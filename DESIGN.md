# DESIGN.md — Bodega COCOA USFQ

Sistema de diseño de **Bodega COCOA USFQ** — Sistema de reservas de equipos audiovisuales de la Universidad San Francisco de Quito.

**Diseño y brand board:** Paula Hidalgo, Amelia Duclos  
**Documentación de sistema / repo:** Ismael Zambrano · Grupo 1

## Concepto

**Bodega COCOA USFQ**  
Sistema de reservas de equipos audiovisuales.

**Frase:** We want more humans, more dragons.

**Palabras clave:** Reserva · Crea · Explora

Plataforma clara, institucional y directa. El rojo USFQ marca las acciones principales; el negro y el blanco dan estructura y legibilidad. El brand board (`docs/diseno/brand-board.html` y `brand-board.jpg`) es la fuente visual; este archivo traduce esas decisiones a reglas para el equipo y el agente.

## Usuarios y contexto de uso

- Estudiantes y profesores de COCOA / USFQ reservan equipos y espacios desde laptop o celular.
- Administradores de la Bodega (Santiago y Luis Daniel) gestionan principalmente desde escritorio.
- Prioridad de responsive en ambas interfaces (admin optimizado para computadora).

## Principios

1. El estado de un equipo o reserva debe entenderse al instante.
2. Respetar la identidad visual del brand board (rojo, negro, blanco, tipografías definidas).
3. Acciones primarias siempre en rojo USFQ.
4. Nada automatizado en el flujo de aprobación (según el cliente).
5. Transparencia controlada: el usuario ve mantenimiento; el admin ve daño/extravío.

## Colores

| Nombre       | Hex       | Uso |
|--------------|-----------|-----|
| Rojo USFQ    | `#E11B22` | Botones primarios, acentos, títulos destacados |
| Negro        | `#231F20` | Textos principales, fondos oscuros, encabezados |
| Gris         | `#939598` | Textos secundarios, bordes, elementos neutros |
| Blanco       | `#FFFFFF` | Fondos, tarjetas, contraste |
| Success      | `#16A34A` | Disponible / Aprobada / éxito |
| Warning      | `#F59E0B` | En mantenimiento / Pendiente / carga prolongada |
| Danger       | `#DC2626` | Rechazada / error / atrasada (admin) |

Contraste de texto: negro sobre blanco y blanco sobre rojo/negro cumplen ≥ 4.5:1. No usar gris `#939598` como único color de texto sobre fondos claros para contenido crítico.

## Tipografía

| Familia | Pesos | Uso |
|---------|-------|-----|
| Helvetica / Helvetica Neue | Light, Regular, Bold | UI, cuerpo, botones, navegación |
| Baskerville | Regular | Títulos secundarios y citas |
| University Roman | Regular | Uso institucional / títulos de marca puntuales |

| Token | Tamaño | Uso |
|-------|--------|-----|
| `--text-xs` | 12px | Metadatos, badges |
| `--text-sm` | 14px | Labels, ayuda |
| `--text-md` | 16px | Cuerpo |
| `--text-lg` | 20px | Subtítulos |
| `--text-xl` | 24px | Títulos de sección |
| `--text-2xl` | 32px | Títulos de página |
| `--text-3xl` | 40px | Display / hero |

## Espaciado

| Token | Valor | Uso |
|-------|-------|-----|
| `--space-1` | 4px | Micro gaps |
| `--space-2` | 8px | Entre icono y texto |
| `--space-3` | 16px | Padding interno de controles |
| `--space-4` | 24px | Separación entre bloques |
| `--space-5` | 32px | Separación de secciones |
| `--space-6` | 48px | Márgenes de página |

## Radios

| Token | Valor | Uso |
|-------|-------|-----|
| `--radius-sm` | 4px | Inputs, badges |
| `--radius-md` | 8px | Botones, tarjetas |
| `--radius-lg` | 12px | Paneles / modales |

## Variables CSS (`tokens.css`)

```css
:root {
  --color-rojo: #E11B22;
  --color-rojo-hover: #C4101C;
  --color-negro: #231F20;
  --color-gris: #939598;
  --color-blanco: #FFFFFF;
  --color-success: #16A34A;
  --color-warning: #F59E0B;
  --color-danger: #DC2626;

  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;

  --space-1: 4px;
  --space-2: 8px;
  --space-3: 16px;
  --space-4: 24px;
  --space-5: 32px;
  --space-6: 48px;

  --text-xs: 12px;
  --text-sm: 14px;
  --text-md: 16px;
  --text-lg: 20px;
  --text-xl: 24px;
  --text-2xl: 32px;
  --text-3xl: 40px;

  --font-sans: "Helvetica Neue", Helvetica, Arial, sans-serif;
  --font-serif: "Baskerville", "Times New Roman", serif;
  --font-display: "University Roman", serif;
}
```

## Componentes

### Botones
- Primario: fondo `#E11B22`, texto blanco, radio 8px, altura ≥ 44px → “Reservar equipo →”
- Secundario / outline: borde `#231F20`, fondo blanco, texto negro → “Ver disponibilidad →”
- Hover primario: `#C4101C`
- Deshabilitado: fondo/borde gris, sin acción

### Campos
- Fondo blanco, borde `#939598`, radio 4px, texto `#231F20`
- Label arriba en Helvetica Regular 14px
- Focus: borde `#E11B22`
- Error: borde `#DC2626` + mensaje debajo en danger
- Placeholder en gris; nunca sustituye al label

### Tarjeta de equipo / espacio
- Foto (1–2), nombre, **ID único** de la unidad
- Badge de estado de ítem (Disponible / En mantenimiento)
- Botón “Reservar equipo” (deshabilitado si no aplica)
- Ítems dañados/extraviados: no se muestran al usuario; solo en admin

### Estados de reserva (alineados al PRD)

| Estado | Color | Texto visible |
|--------|-------|---------------|
| En carrito | Gris | En carrito |
| Pendiente | Warning | Pendiente de aprobación |
| Aprobada | Success | Aprobada |
| Rechazada | Danger | Rechazada |
| Cancelada | Gris | Cancelada |

### Estados de ítem (inventario)

| Estado | Visible para | Color | Texto |
|--------|--------------|-------|-------|
| Disponible | Usuario y admin | Success | Disponible |
| En mantenimiento | Usuario y admin | Warning | En mantenimiento |
| Dañado | Solo admin | Danger | Dañado |
| Extraviado | Solo admin | Danger | Extraviado |

### Estados de interfaz

| Estado | Comportamiento |
|--------|----------------|
| Carga | Skeleton o spinner negro/gris; no bloquear layout completo si es parcial |
| Vacío | Mensaje claro + CTA (“Aún no tienes reservas”, “Explorar equipos”) |
| Error | Texto danger + acción de reintento cuando aplique |
| Éxito | Confirmación breve (“Tu solicitud fue enviada”, “Reserva aprobada”) |

## Datos y textos

- Fechas: `DD/MM/YYYY`
- Horarios: formato 24h (`HH:mm`)
- Cantidades: enteros; IDs de equipo siempre visibles en tarjetas y PDF
- Estados: exactamente los textos de las tablas anteriores
- Nombre de producto en UI y título de página: **Bodega COCOA USFQ**

## Tono de voz

Directo, claro e institucional.

**Así sí**  
“Reserva el equipo que necesitas.”  
“Tu reserva fue aprobada. Descarga el PDF.”  
“Este equipo está en mantenimiento.”  
“Tu carrito expira en 60 minutos.”

**Así no**  
“Request processed.”  
“Item unavailable.”  
“Oops! Something went wrong.”  
Lenguaje ambiguo o en inglés en la UI principal.

## Accesibilidad

- Contraste mínimo 4.5:1 en texto.
- Botones e inputs táctiles ≥ 44 px de altura.
- Estados no solo por color (texto + icono/badge).
- Focus visible en teclado (borde rojo USFQ).

## No hacemos

- Aprobaciones automáticas.
- Ocultar equipos en mantenimiento al usuario.
- Mostrar “dañado” o “extraviado” a usuarios finales.
- Renovaciones de reservas.
- Interfaz solo en un dispositivo.
- Librerías de UI (Tailwind, Bootstrap, MUI, etc.) salvo indicación contraria.
- Colores o tipografías fuera de este sistema.

---

Este `DESIGN.md` está alineado con el brand board y con los estados/reglas del PRD. Créditos de identidad visual: **Paula Hidalgo** y **Amelia Duclos**.
