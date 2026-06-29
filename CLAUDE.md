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

### /ingest [archivo o URL]
Ingesta una fuente externa al vault:
1. Leer el archivo en `raw/` (o clipear desde URL a `raw/referencias/`)
2. Crear resumen en `wiki/sources/nombre-kebab-case.md` con frontmatter completo
3. Leer `wiki/index.md` e identificar notas wiki/ existentes relacionadas
4. Actualizar hasta 3 notas wiki/ afectadas (agregar sección, actualizar datos, agregar wikilink)
5. Agregar entrada en `wiki/log.md` listando qué cambió
6. Si la fuente introduce conceptos nuevos → crear nota en `wiki/referencias/`
Máximo 3 fuentes por sesión para mantener calidad de conexiones.

### /lint
Audita la salud del vault y guarda resultado en `outputs/lint-YYYY-MM-DD.md`:
- Notas sin wikilinks entrantes (huérfanas)
- Decisiones contradictorias entre notas
- Workflows con estado desactualizado vs index.md
- Notas con `confidence: low` sin actualización en 30+ días
- Campos frontmatter faltantes (sources, created, updated, type)
- Wikilinks rotos (referencias a notas que no existen)
Ejecutar semanalmente o después de sesiones grandes.

### /new [tipo] [nombre]
Crea una nota nueva con frontmatter completo usando el template:
- Tipo: concept | workflow | decision | error | source | reference
- Usa `templates/nota-base.md` como base
- Guarda en la subcarpeta correcta según el tipo

## Estructura del vault
```
MAKO-VAULT/
├── CLAUDE.md              ← este archivo
├── wiki/
│   ├── index.md           ← catálogo maestro
│   ├── hot.md             ← contexto reciente (500 palabras)
│   ├── log.md             ← registro append-only
│   ├── sistema/           ← arquitectura MAKO (pipeline, stack, reglas)
│   ├── workflows/         ← estado de cada workflow n8n
│   ├── sources/           ← resúmenes de fuentes externas ingestadas
│   ├── errores/           ← bugs resueltos y lecciones
│   ├── decisiones/        ← decisiones tomadas (no re-discutir)
│   ├── fuentes/           ← análisis de fuentes de datos
│   ├── referencias/       ← conceptos técnicos y externos
│   ├── skills/            ← inventario de skills disponibles
│   └── sesiones/          ← log de cada sesión de trabajo
├── raw/
│   ├── docs-mako/         ← artefactos MAKO (inmutables)
│   └── referencias/       ← artículos y docs externos cliqueados
├── templates/
│   └── nota-base.md       ← template para notas nuevas
└── outputs/               ← reportes lint y auditorías
```

## Convenciones de frontmatter YAML
Cada nota DEBE tener este frontmatter completo:
```yaml
---
title: Título descriptivo
type: concept | workflow | decision | error | source | reference | index | log | hot-cache | sistema | checkpoint
created: YYYY-MM-DD
updated: YYYY-MM-DD
confidence: high | medium | low
sources:
  - raw/ruta/al/archivo-fuente.md
related:
  - "[[ruta/nota-relacionada]]"
tags: []
---
```
- `confidence: high` = verificado en ejecución real
- `confidence: medium` = diseñado, no probado
- `confidence: low` = hipótesis o dato sin verificar
- `sources` vacío `[]` si la nota es generada internamente (no viene de un raw/)
- Nombres de archivo: kebab-case siempre

## Reglas de escritura
- Wikilinks `[[nombre]]` para TODA referencia a otra nota del vault
- `wiki/log.md`: append-only — nunca modificar entradas anteriores
- `wiki/hot.md`: sobrescribir en cada sesión (máx 500 palabras)
- `wiki/sources/`: una nota por fuente externa, nunca agrupar varias
- `raw/`: inmutable — nunca modificar archivos en raw/, solo leer
- Después de cualquier cambio masivo → correr `/lint`

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
