#!/usr/bin/env bash
# Bodega COCOA USFQ — hoja de comandos del proyecto
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

ESTADO_FILE="$ROOT/docs/estado.md"
REPO_URL="https://github.com/AshenThread/bodega-cocoa-usfq"

red()  { printf '\033[0;31m%s\033[0m\n' "$*"; }
grn()  { printf '\033[0;32m%s\033[0m\n' "$*"; }
ylw()  { printf '\033[0;33m%s\033[0m\n' "$*"; }
cyn()  { printf '\033[0;36m%s\033[0m\n' "$*"; }
bold() { printf '\033[1m%s\033[0m\n' "$*"; }

cls() { clear 2>/dev/null || printf '\n'; }

pause() {
  echo
  if [[ -t 0 ]]; then
    read -r -p "Enter para volver al menú… " _
  fi
}

escribir_estado() {
  local nota="${1:-Actualización manual}"
  local branch remote_status dirty ahead behind
  branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")"
  dirty="$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')"
  ahead="$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)"
  behind="$(git rev-list --count HEAD..@{u} 2>/dev/null || echo 0)"
  if [[ "$dirty" == "0" && "$ahead" == "0" && "$behind" == "0" ]]; then
    remote_status="Sincronizado con origin/$branch"
  else
    remote_status="Local≠remoto (dirty=$dirty, ahead=$ahead, behind=$behind)"
  fi

  mkdir -p "$(dirname "$ESTADO_FILE")"
  cat > "$ESTADO_FILE" <<EOF
# Estado del proyecto — Bodega COCOA USFQ

- **Actualizado:** $(date '+%Y-%m-%d %H:%M:%S %Z')
- **Nota:** $nota
- **Rama:** \`$branch\`
- **Repo:** $REPO_URL
- **GitHub:** $remote_status
- **Commit:** \`$(git rev-parse --short HEAD 2>/dev/null || echo n/a)\`

## Entrega actual

Avance #2 — PRD, brand board y sistema de diseño.

## Próximo

Avance #3 — implementación de épicas del MVP.
EOF
}

opcion_1_revision() {
  cls
  bold "════════════════════════════════════════"
  bold "  1 · Revisión actual del proyecto"
  bold "════════════════════════════════════════"
  echo

  cyn "▸ Local"
  echo "  Carpeta: $ROOT"
  echo "  Rama:    $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo n/a)"
  echo "  Commit:  $(git rev-parse --short HEAD 2>/dev/null || echo n/a)"
  echo

  cyn "▸ Working tree"
  if [[ -z "$(git status --porcelain 2>/dev/null)" ]]; then
    grn "  Sin cambios pendientes."
  else
    ylw "  Hay cambios sin commitear:"
    git status -sb
    echo
    git status --short
  fi
  echo

  cyn "▸ Sync con GitHub"
  git fetch origin --quiet 2>/dev/null || ylw "  No se pudo hacer fetch (¿red/auth?)."
  if git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
    local ahead behind
    ahead="$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)"
    behind="$(git rev-list --count HEAD..@{u} 2>/dev/null || echo 0)"
    echo "  Remoto:  $(git rev-parse --abbrev-ref '@{u}')"
    echo "  Ahead:   $ahead  |  Behind: $behind"
    if [[ "$ahead" == "0" && "$behind" == "0" ]]; then
      grn "  Sincronizado con origin."
    elif [[ "$ahead" != "0" ]]; then
      ylw "  Hay commits locales sin push. Usa opción 2."
    elif [[ "$behind" != "0" ]]; then
      ylw "  El remoto tiene commits que no tienes. Haz pull antes de seguir."
    fi
  else
    ylw "  Sin upstream configurado."
  fi
  echo

  cyn "▸ GitHub (gh)"
  if command -v gh >/dev/null 2>&1; then
    gh repo view --json nameWithOwner,url,visibility,updatedAt,defaultBranchRef \
      --jq '"  Repo:        \(.nameWithOwner)\n  URL:         \(.url)\n  Visibilidad: \(.visibility)\n  Default:     \(.defaultBranchRef.name)\n  Updated:     \(.updatedAt)"' \
      2>/dev/null || ylw "  No se pudo consultar gh repo view."
  else
    ylw "  gh CLI no está instalado."
  fi
  echo

  cyn "▸ Archivos clave Avance #2"
  local ok=0 miss=0
  for f in \
    README.md \
    DESIGN.md \
    docs/prd/prd.md \
    docs/diseno/brand-board.html \
    docs/diseno/brand-board.jpg \
    docs/entrega/Avance2_BodegaCOCOA_USFQ_Grupo1.docx
  do
    if [[ -f "$f" ]]; then
      grn "  ✓ $f"
      ok=$((ok + 1))
    else
      red "  ✗ FALTA $f"
      miss=$((miss + 1))
    fi
  done
  echo

  cyn "▸ Recomendaciones"
  if [[ "$miss" -gt 0 ]]; then
    red "  • Completa los archivos faltantes antes de entregar."
  else
    grn "  • Estructura de Avance #2 completa en local."
  fi
  if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
    ylw "  • Hay cambios locales: usa [2] para subirlos a GitHub."
  fi
  ylw "  • Para D2L: sube el .docx y el enlace $REPO_URL"
  ylw "  • Plazo Avance #2: 25 nov 2026, 23:59."
  echo "  • Siguiente: Avance #3 (épicas del MVP)."
  if [[ -f "$ESTADO_FILE" ]]; then
    echo
    cyn "▸ Último estado registrado"
    sed 's/^/  /' "$ESTADO_FILE" | head -n 12
  fi

  pause
}

opcion_2_actualizar() {
  cls
  bold "════════════════════════════════════════"
  bold "  2 · Actualizar repo y estado"
  bold "════════════════════════════════════════"
  echo

  git fetch origin --quiet 2>/dev/null || true
  git status -sb
  echo

  if [[ -z "$(git status --porcelain 2>/dev/null)" ]]; then
    if [[ "$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)" == "0" ]]; then
      grn "Nada que subir: ya está sincronizado."
      escribir_estado "Revisión sin cambios — ya sincronizado"
      grn "Estado actualizado en docs/estado.md"
      pause
      return
    fi
  fi

  echo "Se hará: add → commit (si hay cambios) → push → docs/estado.md"
  read -r -p "Mensaje de commit (Enter = mensaje automático): " msg
  if [[ -z "${msg// }" ]]; then
    msg="Actualiza entrega Avance #2 y estado del proyecto."
  fi

  git add -A
  if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
    # Evitar Co-authored-by de IA; autor = identidad Git local
    if git commit -m "$msg"; then
      grn "Commit creado: $(git rev-parse --short HEAD)"
      echo "Autor: $(git log -1 --format='%an <%ae>')"
    else
      red "Falló el commit."
      pause
      return
    fi
  else
    ylw "No había cambios nuevos para commit."
  fi

  if git push -u origin HEAD; then
    grn "Push OK → $REPO_URL"
  else
    red "Falló el push. Revisa auth/red."
    pause
    return
  fi

  escribir_estado "Repo actualizado vía menú opción 2"
  # Si estado.md quedó dirty, un segundo commit pequeño
  if [[ -n "$(git status --porcelain docs/estado.md 2>/dev/null)" ]]; then
    git add docs/estado.md
    git commit -m "Actualiza docs/estado.md tras sync." || true
    git push || true
  fi

  grn "Listo. Estado en docs/estado.md"
  pause
}

opcion_9_cerrar() {
  cls
  bold "════════════════════════════════════════"
  bold "  9 · Cerrar sesión de trabajo"
  bold "════════════════════════════════════════"
  echo

  if [[ -n "$(git status --porcelain 2>/dev/null)" ]] || \
     [[ "$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)" != "0" ]]; then
    red "Hay trabajo sin guardar en GitHub."
    git status -sb
    echo
    read -r -p "¿Guardar ahora con la opción 2? [s/N]: " ans
    if [[ "${ans:-}" =~ ^[sS]$ ]]; then
      opcion_2_actualizar
    else
      ylw "No se subió nada. Los cambios siguen solo en local."
      echo
      read -r -p "¿Cerrar igual? [s/N]: " ans2
      if [[ ! "${ans2:-}" =~ ^[sS]$ ]]; then
        echo "Cancelado. Sigues en el menú."
        pause
        return
      fi
    fi
  else
    grn "Todo guardado y sincronizado con GitHub."
  fi

  escribir_estado "Sesión cerrada — listo para continuar después"
  if [[ -n "$(git status --porcelain docs/estado.md 2>/dev/null)" ]]; then
    git add docs/estado.md
    git commit -m "Registra cierre de sesión en docs/estado.md." || true
    git push || true
  fi

  echo
  bold "Checklist antes de cerrar Cursor"
  grn "  1. Guarda archivos abiertos: Cmd+S / Cmd+Option+S"
  grn "  2. Repo: $REPO_URL"
  grn "  3. Para la siguiente sesión: abre esta carpeta y corre:"
  echo "       ./scripts/menu.sh"
  echo
  ylw "Puedes cerrar Cursor con seguridad (Cmd+Q)."
  echo
  bold "Saliendo del menú…"
  exit 0
}

opcion_libre() {
  local n="$1"
  cls
  ylw "Opción [$n] libre — reservada para más adelante."
  pause
}

mostrar_menu() {
  cls
  bold "╔════════════════════════════════════════╗"
  bold "║   Bodega COCOA USFQ · hoja de comandos ║"
  bold "╚════════════════════════════════════════╝"
  echo
  echo "  [1] Revisión actual (local + GitHub + recomendaciones)"
  echo "  [2] Actualizar repo y estado"
  echo "  [3] (libre)"
  echo "  [4] (libre)"
  echo "  [5] (libre)"
  echo "  [6] (libre)"
  echo "  [7] (libre)"
  echo "  [8] (libre)"
  echo "  [9] Cerrar sesión (guardar y salir)"
  echo "  [0] Salir del menú"
  echo
  printf "Elige una opción: "
}

main() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    red "No es un repo git: $ROOT"
    exit 1
  fi

  while true; do
    mostrar_menu
    read -r op
    case "${op:-}" in
      1) opcion_1_revision ;;
      2) opcion_2_actualizar ;;
      3|4|5|6|7|8) opcion_libre "$op" ;;
      9) opcion_9_cerrar ;;
      0) echo "Hasta luego."; exit 0 ;;
      *) ylw "Opción no válida."; sleep 1 ;;
    esac
  done
}

main "$@"
