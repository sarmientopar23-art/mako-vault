# /resume — Carga de contexto MAKO

Carga el contexto completo de MAKO Intelligence en segundos.

## Pasos

1. Leer `wiki/hot.md` — contexto reciente (últimas 500 palabras)
2. Leer `wiki/index.md` — estado global del sistema
3. Leer el archivo más reciente en `wiki/sesiones/` — última sesión
4. Mostrar resumen de:
   - Estado actual del sistema
   - Pendientes urgentes
   - Bugs abiertos
   - Qué NO toco sin OK de Dario (publish_workflow, ejecutar Apify)

## Formato de respuesta

```
## MAKO — Contexto cargado

**Estado general:** [OK / hay problemas]
**Última sesión:** [fecha]
**Pendiente urgente:** [lista]
**Bugs abiertos:** [lista]
**Listo para:** [qué puedo hacer ahora]
```
