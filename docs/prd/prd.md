# PRD — Bodega COCOA USFQ

**Proyecto Final · Web Development 3**  
**Equipo:** Grupo 1  
**Integrantes:** Ismael Zambrano, Paula Hidalgo, Amelia Duclos  
**Fecha:** 25 de noviembre de 2026  
**Versión:** 1.0 (Avance #2)

## 1. Problema y objetivo

La Bodega COCOA de la Universidad San Francisco de Quito administra el préstamo de equipos de cine, periodismo y comunicación, así como espacios (como el estudio de TV). La plataforma web actual presenta fallas graves: el carrito se borra al agregar más de un ítem, hay problemas de inicio de sesión y recuperación de contraseña, no envía notificaciones y no es usable ni para estudiantes ni para administradores. Esto genera hasta 10 solicitudes manuales por hora al administrador.

**Objetivo:** Desarrollar una plataforma web que permita a usuarios (estudiantes y profesores) reservar equipos y espacios de forma autónoma, con selección de ítems específicos, carrito multi-ítem, notificaciones por correo y gestión manual completa por parte del administrador. El sistema debe reducir la carga operativa del administrador y permitir reservas claras, rastreables y con generación de PDF.

## 2. Usuarios

| Perfil | Descripción | Necesidades principales |
|--------|-------------|-------------------------|
| Usuario general (estudiante o profesor) | Miembro de la comunidad USFQ con correo institucional | Reservar uno o más equipos/espacios específicos, ver disponibilidad, recibir confirmaciones, cancelar con anticipación, descargar PDF de su reserva |
| Administrador | Personal de la Bodega (Santiago y Luis Daniel) | Crear/dar de baja usuarios, aprobar o rechazar reservas manualmente, editar cualquier reserva, gestionar inventario (alta, baja, mantenimiento, daño), bloquear usuarios temporalmente, ver resumen de reservas, recibir notificaciones |

Acceso exclusivo con correo institucional. El administrador es el único que crea y elimina cuentas.

## 3. Alcance del MVP

Funcionalidades que el cliente podrá probar en el avance 3 y en la presentación final:

1. Autenticación solo con correo institucional y gestión de usuarios exclusiva del administrador.
2. Catálogo de equipos y espacios con fotos (1-2 por ítem), estado visible de mantenimiento y selección de unidad específica (por ID único).
3. Carrito multi-ítem que permite agregar varios equipos/espacios en una sola reserva.
4. Selección de fecha y horario con sistema de 24 horas e interfaz clara y fácil.
5. Solicitud de reserva con comentario corto obligatorio de uso previsto (sin límite de duración, incluso todo el semestre).
6. Aprobación o rechazo manual de cada reserva por el administrador (nada automatizado).
7. Notificaciones por correo: al administrador (nueva solicitud y confirmación) y al usuario (solicitud enviada y aprobación/rechazo).
8. Generación automática de PDF con la información de cada reserva.
9. Cancelación de reserva por el usuario con mínimo 1 hora de anticipación.
10. Expiración del carrito a los 60 minutos si no se completa la solicitud.
11. Panel de administrador con resumen del total de reservas y capacidad de editar cualquier reserva.
12. Visualización de equipos en mantenimiento (aparecen con nota visible).
13. Gestión de estados de ítems dañados/extraviados (solo visibles para admin; se ocultan del front del usuario).
14. Bloqueo temporal de usuarios por el administrador (con razón; desbloqueo automático por tiempo).
15. Diseño responsive prioritario tanto para usuarios como para administradores (admin optimizado para escritorio).

## 4. Reglas de negocio

1. Una reserva puede incluir múltiples ítems específicos (cada unidad tiene ID único, aunque sean del mismo modelo).
2. No existe límite de duración de reserva. Se permite reservar por todo el semestre sin justificación formal, pero se exige un comentario corto de uso.
3. El administrador revisa y decide manualmente cada reserva. No hay aprobación automática.
4. Notificaciones por correo:
   - Administrador: nueva solicitud de reserva y confirmación de reserva.
   - Usuario: confirmación de envío de solicitud y confirmación/rechazo por el administrador.
5. Si un equipo está en mantenimiento, sigue apareciendo en el catálogo con una nota visible.
6. No se pueden devolver ciertos ítems en ciertos días (ejemplo: cámaras no se devuelven los sábados; computadoras sí).
7. Se acepta un atraso máximo de 15 a 30 minutos en la entrega del equipo respecto a la hora acordada. Se envían avisos al correo 10 minutos antes y 30 minutos después.
8. Cancelación de reserva: mínimo 1 hora de anticipación.
9. El carrito se elimina automáticamente si no se completa la solicitud en 1 hora.
10. No se permiten renovaciones de reservas.
11. El administrador puede bloquear usuarios (por atraso o daño) indicando la razón. El desbloqueo es automático según el tiempo definido.
12. Ítems dañados o extraviados se ocultan del catálogo de usuarios; solo los administradores ven el estado real.
13. El administrador puede editar cualquier reserva de cualquier usuario.
14. Cada reserva genera un PDF con su información.
15. Sistema de horarios en formato 24 horas.
16. Nombre de la plataforma y de la página debe incluir “Bodega COCOA USFQ”.

## 5. Fuera de alcance

- Bot de WhatsApp (mencionado como deseo adicional, no prioritario para esta versión).
- Aprobación automática de reservas.
- Renovación de reservas.
- Registro libre de usuarios (solo creación por administrador).
- Integración con sistemas externos más allá del correo institucional y generación de PDF.
- Gestión completa de sanciones económicas o de daños (solo registro y bloqueo temporal).

## 6. Decisiones del cliente (visita 11/11/26)

- Reserva conjunta de más de un equipo: sí.
- Selección de ítem específico aunque haya varios iguales: sí (elige la unidad concreta).
- Sin límite de tiempo de reserva (incluso todo el semestre) + comentario corto de uso.
- Avisos de atraso: 10 min antes y 30 min después. Todo revisión manual.
- Equipo en mantenimiento: visible con nota.
- Restricciones de devolución por tipo de ítem y día.
- Notificaciones bidireccionales por correo (detalle en reglas).
- Reserva por ítem con ID único (aunque mismo modelo).
- No hay renovación de reservas.
- Admin puede bloquear usuarios (baneo con razón, desbaneo automático por tiempo).
- Ítems dañados/extraviados: ocultos del front, solo visibles para admin.
- Atraso máximo aceptable en entrega: 15-30 min.
- Cancelación: mínimo 1 hora antes.
- Carrito expira a la 1 hora.
- Admin puede editar reservas de cualquier usuario.
- Nada automatizado.
- Cada reserva genera PDF.
- Mejor forma de elegir horarios y fechas.
- Resumen de reservas en panel principal del admin.
- Responsive prioritario en ambas interfaces (admin mejor en computadora).
- Sistema de 24 horas.
- Nombre obligatorio: Bodega COCOA USFQ.

## 7. Supuestos y preguntas abiertas

**Supuestos (mientras no se confirme lo contrario):**
- Los correos institucionales son del dominio USFQ.
- El administrador define la duración del bloqueo de usuarios al momento de aplicarlo.
- Las fotos (1-2 por equipo) se cargan junto con el Excel inicial.
- El PDF de reserva incluye: ítems, fechas/horarios, usuario, comentario de uso y estado.
- Los espacios se manejan igual que los equipos en cuanto a disponibilidad y reserva.

**Preguntas abiertas:**
- ¿Cuáles son exactamente las reglas de días/horarios de devolución por tipo de equipo (lista completa)?
- ¿Qué información exacta debe contener el PDF de la reserva?
- ¿Cuál es el tiempo estándar o cómo se define la duración del bloqueo de un usuario?
- ¿Existen categorías o filtros obligatorios en el catálogo?
- ¿El comentario de uso tiene un límite de caracteres?

## 8. Épicas del MVP

1. **Autenticación y gestión de usuarios** — Acceso institucional y control exclusivo del administrador sobre cuentas y bloqueos.
2. **Catálogo e inventario** — Visualización de equipos/espacios con unidades específicas, estados de mantenimiento y ocultamiento de dañados.
3. **Proceso de reserva** — Carrito multi-ítem, selección de fecha/hora 24h, comentario de uso y expiración del carrito.
4. **Aprobación, notificaciones y documentos** — Flujo manual de aprobación, correos y generación de PDF.
5. **Panel de administración** — Resumen de reservas, edición de reservas, gestión de inventario y usuarios.

## 9. Criterios de éxito y restricciones

**Criterios de éxito:**
- Los usuarios pueden completar una reserva de uno o más ítems específicos sin intervención del administrador hasta la aprobación.
- El administrador recibe notificaciones claras y puede aprobar/rechazar/editar con facilidad.
- Se reduce significativamente la carga de solicitudes manuales (objetivo: que el administrador no reciba más de 1-2 consultas de ayuda por día en operación normal).
- Generación correcta de PDF y notificaciones en todos los casos definidos.

**Restricciones:**
- Prototipo funcional para principios de diciembre 2026.
- Hosting y servicios estimados en ~$150 mensuales.
- Datos iniciales de inventario provenientes de Excel del cliente.
- Solo correos institucionales.
- Nada automatizado en el flujo de aprobación.

## 10. Uso de IA

Se utilizó Grok (xAI) para estructurar el PRD a partir de los cinco resúmenes de la entrevista y las respuestas detalladas de la visita del 11/11/26. La herramienta ayudó a consolidar reglas de negocio, detectar consistencias y redactar secciones. Todas las decisiones finales fueron revisadas por el equipo y están basadas exclusivamente en lo dicho por el cliente o en supuestos explícitamente declarados.
