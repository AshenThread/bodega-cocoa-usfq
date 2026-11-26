# DESIGN.md — Bodega COCOA USFQ

Sistema de diseño de **Bodega COCOA** — Sistema de reservas de equipos audiovisuales de la Universidad San Francisco de Quito.

## Concepto

**Bodega COCOA**  
Sistema de reservas de equipos audiovisuales.

**Frase:** We want more humans, more dragons.

**Palabras clave:** Reserva · Crea · Explora

Plataforma clara, institucional y directa. El rojo USFQ marca las acciones principales; el negro y el blanco dan estructura y legibilidad.

## Usuarios y contexto de uso

- Estudiantes y profesores de COCOA / USFQ reservan equipos y espacios desde laptop o celular.
- Administradores de la Bodega gestionan principalmente desde escritorio.
- Prioridad de responsive en ambas interfaces.

## Principios

1. El estado de un equipo o reserva debe entenderse al instante.
2. Respetar la identidad visual del brand board (rojo, negro, blanco, tipografías definidas).
3. Acciones primarias siempre en rojo USFQ.
4. Nada automatizado en el flujo de aprobación (según el cliente).
5. Transparencia controlada: el usuario ve mantenimiento; el admin ve daño/extravío.

## Colores

| Nombre       | Hex       | Uso |
|--------------|-----------|-----|
| Rojo USFQ    | `#E11B22` | Botones primarios, acentos, títulos destacados, estados críticos |
| Negro        | `#231F20` | Textos principales, fondos oscuros, encabezados |
| Gris         | `#939598` | Textos secundarios, bordes, elementos neutros |
| Blanco       | `#FFFFFF` | Fondos, tarjetas, contraste |
| Success      | `#16A34A` | Disponible / Aprobada |
| Warning      | `#F59E0B` | En mantenimiento / Pendiente |
| Danger       | `#DC2626` | Rechazada / Atrasada (admin) |

**Variables CSS (tokens.css):**

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
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 16px;
  --space-4: 24px;
  --font-sans: "Helvetica Neue", Helvetica, Arial, sans-serif;
  --font-serif: "Baskerville", "Times New Roman", serif;
  --font-display: "University Roman", serif;
}
```

## Tipografía

- **Helvetica Light / Regular / Bold** — Interfaz, cuerpo de texto y botones.
- **Baskerville** — Títulos secundarios y citas.
- **University Roman** — Uso institucional o títulos de marca cuando se requiera.

Escala sugerida: 12 · 14 · 16 · 20 · 24 · 32 · 40 px.

## Componentes

### Botones
- Primario: fondo `#E11B22`, texto blanco, radio 8px → “Reservar equipo”
- Secundario / Outline: borde `#231F20` o `#E11B22`, texto negro → “Ver disponibilidad”

### Tarjeta de equipo
- Foto, nombre, ID único.
- Badge de estado (Disponible / En mantenimiento).
- Botón “Reservar equipo”.

### Estados de reserva
| Estado              | Color     | Texto visible              |
|---------------------|-----------|----------------------------|
| En carrito          | Gris      | En carrito                 |
| Pendiente           | Warning   | Pendiente de aprobación    |
| Aprobada            | Success   | Aprobada                   |
| Rechazada           | Danger    | Rechazada                  |
| Cancelada           | Gris      | Cancelada                  |
| En mantenimiento    | Warning   | En mantenimiento           |

## Datos y textos

- Fechas: `DD/MM/YYYY`
- Horarios: formato 24h
- Estados exactamente como en la tabla anterior.

## Tono de voz

Directo, claro e institucional.

**Así sí**  
“Reserva el equipo que necesitas.”  
“Tu reserva fue aprobada. Descarga el PDF.”  
“Este equipo está en mantenimiento.”

**Así no**  
“Request processed.”  
“Item unavailable.”

## Accesibilidad

- Contraste mínimo 4.5:1.
- Botones ≥ 44 px de altura.
- Estados no solo por color.

## No hacemos

- Aprobaciones automáticas.
- Ocultar equipos en mantenimiento.
- Mostrar “dañado” o “extraviado” a usuarios finales.
- Renovaciones de reservas.
- Interfaz solo en un dispositivo.

---

Este `DESIGN.md` está 100 % alineado con el brand board entregado (colores, tipografías, botones y tono).
