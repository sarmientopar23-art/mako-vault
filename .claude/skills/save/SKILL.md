# /save — Guardar sesión actual

Guarda lo que se hizo en esta sesión para que la próxima arranque con contexto completo.

## Pasos

1. Crear `wiki/sesiones/YYYY-MM-DD.md` con:
   - Lo que se hizo
   - Decisiones tomadas
   - Bugs resueltos
   - Pendientes para la próxima sesión

2. Actualizar `wiki/hot.md` con resumen de esta sesión (máx 500 palabras):
   - Estado actual
   - Pendientes urgentes
   - Workflows modificados

3. Agregar entrada a `wiki/log.md`:
   ```
   ## YYYY-MM-DD | Descripción breve
   - cambio 1
   - cambio 2
   ```

## Reglas
- hot.md: sobrescribir completo (no append)
- log.md: solo append — nunca modificar entradas anteriores
- sesiones/: crear archivo nuevo por fecha
