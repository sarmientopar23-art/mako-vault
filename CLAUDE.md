# MAKO Intelligence — Vault

## Identidad
Trabajo con Dario en MAKO Intelligence: sistema de inteligencia comercial para e-commerce argentino.
Dario es el dueño. Tiene autoridad final sobre todas las decisiones estratégicas.
Siempre responder en español.

## Cómo arrancar cada sesión — /resume
Leer en este orden:
1. `wiki/hot.md` — contexto reciente (500 palabras)
2. `wiki/index.md` — estado global del sistema
3. `wiki/sesiones/` — última sesión guardada
4. Declarar qué puedo hacer y qué NO toco sin OK de Dario

## Comandos

### /resume
Lee hot.md + index.md + última sesión. Carga contexto completo en segundos. Úsalo al inicio de cada sesión.

### /save
Guarda la sesión actual:
1. Crea `wiki/sesiones/YYYY-MM-DD.md` con decisiones, cambios y próximos pasos
2. Actualiza `wiki/hot.md` con el resumen más reciente (máx 500 palabras)
3. Agrega entrada a `wiki/log.md`

### lint the wiki
Verifica:
- Notas sin wikilinks entrantes (huérfanas)
- Decisiones contradictorias
- Workflows con estado desactualizado
- Guarda resultado en `outputs/lint-YYYY-MM-DD.md`

## Estructura del vault
```
MAKO-VAULT/
├── CLAUDE.md              ← este archivo
├── wiki/
│   ├── index.md           ← catálogo maestro
│   ├── hot.md             ← contexto reciente (500 palabras)
│   ├── log.md             ← registro append-only
│   ├── sistema/           ← arquitectura MAKO
│   ├── workflows/         ← estado de cada workflow n8n
│   ├── errores/           ← bugs y lecciones
│   ├── decisiones/        ← decisiones tomadas (no re-discutir)
│   ├── fuentes/           ← análisis de fuentes de datos
│   └── sesiones/          ← log de cada sesión de trabajo
├── raw/docs-mako/         ← artefactos MAKO (inmutables)
└── outputs/               ← reportes y lint
```

## Convenciones
- Frontmatter YAML en cada nota: `type`, `updated`, `confidence`, `related`
- Wikilinks `[[nombre]]` para cross-referencias entre notas
- `wiki/log.md`: append-only — nunca modificar entradas anteriores
- `wiki/hot.md`: sobrescribir en cada sesión (máx 500 palabras)
- Confianza: `high` = verificado en ejecución real | `medium` = diseñado, no probado | `low` = hipótesis

## Reglas MAKO — NO negociables
1. n8n es orquestador — nunca almacena ni calcula similitud
2. Todo se escribe en tabla `signals` de Supabase (fuente de verdad absoluta)
3. Nada se sobrescribe — todo se versiona
4. Trazabilidad: Opportunity → Cluster → Signal → Fuente
5. Feedback nunca modifica datos históricos

## Clasificador de riesgo
| Nivel | Acción | Qué hacer |
|-------|--------|-----------|
| LOW | read-only, validate, queries | Proceder directo |
| MED | update_workflow draft, crear tabla | Informar, continuar |
| HIGH | publish_workflow, ejecutar Apify, borrar datos | ESPERAR OK de Dario |

## Siempre dar la respuesta directa
Si tengo datos o una conclusión clara — decirla directo sin esperar a ser preguntado.
No suavizar con "podría ser" cuando la respuesta es clara.
