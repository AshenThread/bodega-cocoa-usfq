# Bodega COCOA USFQ

Sistema de reservas de equipos audiovisuales de la Bodega COCOA — Universidad San Francisco de Quito.

**Proyecto final · Web Development 3 · Avance #2**  
**Equipo:** Grupo 1 — Ismael Zambrano, Paula Hidalgo, Amelia Duclos

## Descripción

Plataforma web para que estudiantes y profesores reserven equipos y espacios de forma autónoma, con selección de unidades específicas (ID único), carrito multi-ítem, notificaciones por correo y gestión manual completa por el administrador.

## Entrega Avance #2

| Documento | Ubicación | Créditos |
|-----------|-----------|----------|
| PRD | [`docs/prd/prd.md`](docs/prd/prd.md) | Equipo |
| Brand board | [`docs/diseno/brand-board.html`](docs/diseno/brand-board.html) · [`brand-board.jpg`](docs/diseno/brand-board.jpg) | Paula Hidalgo, Amelia Duclos |
| Sistema de diseño | [`DESIGN.md`](DESIGN.md) | Paula Hidalgo, Amelia Duclos (identidad); Ismael Zambrano (repo) |

## Reglas clave del MVP

- Sin aprobación automática: todo lo decide el administrador.
- Cada unidad de equipo tiene ID único (aunque sea del mismo modelo).
- Carrito multi-ítem con expiración a 1 hora.
- Cancelación con mínimo 1 hora de anticipación.
- Horarios en formato 24 horas.
- Responsive prioritario en interfaz de usuario y de administrador.
- Colores y tipografías solo los definidos en `DESIGN.md`.
- Sin librerías de UI (Tailwind, Bootstrap, MUI, etc.) salvo indicación contraria.

## Épicas del MVP

1. Autenticación y gestión de usuarios
2. Catálogo e inventario
3. Proceso de reserva
4. Aprobación, notificaciones y documentos
5. Panel de administración

## Hoja de comandos

**Autoría de scripts:** Ismael Zambrano · ver [`scripts/AUTORIA.md`](scripts/AUTORIA.md)

```bash
./scripts/menu.sh
```

- `[1]` Revisión actual (local + GitHub + recomendaciones)
- `[2]` Actualizar repo y estado (`docs/estado.md`)
- `[9]` Cerrar sesión (guardar y checklist para cerrar Cursor)
- `[3]`–`[8]` libres

## Hooks de commits (autoría humana)

```bash
git config core.hooksPath .githooks
```

- `.githooks/` — limpia/bloquea co-autoría de IA
- `.cursor/hooks/` — valida `--author` en commits del agente

## Estado

Documentación del Avance #2 lista (PRD, brand board, DESIGN.md). Pendiente implementación de épicas en el Avance #3.
