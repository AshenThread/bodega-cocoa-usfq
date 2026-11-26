# Bodega COCOA USFQ

Sistema de reservas de equipos audiovisuales de la Bodega COCOA — Universidad San Francisco de Quito.

**Proyecto final · Web Development 3**  
**Equipo:** Grupo 1 — Ismael Zambrano, Paula Hidalgo, Amelia Duclos

## Descripción

Plataforma web para que estudiantes y profesores reserven equipos y espacios de forma autónoma, con selección de unidades específicas (ID único), carrito multi-ítem, notificaciones por correo y gestión manual completa por el administrador.

## Documentación

| Documento | Ubicación |
|-----------|-----------|
| Product Requirements (PRD) | [`docs/prd/prd.md`](docs/prd/prd.md) |
| Sistema de diseño | [`DESIGN.md`](DESIGN.md) |
| Brand board | [`docs/diseno/`](docs/diseno/) |

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

## Hooks de commits (autoría humana)

Para que cada commit quede a nombre del integrante (sin co-autoría de IA):

```bash
git config core.hooksPath .githooks
```

- `.githooks/` — `prepare-commit-msg` y `commit-msg` (Git)
- `.cursor/hooks/` — guarda commits del agente en Cursor

## Estado

Estructura inicial del repositorio. Pendiente de implementación de las épicas del MVP.
