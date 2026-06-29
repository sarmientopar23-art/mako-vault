---
type: index
updated: 2026-06-27
---

# MAKO Intelligence — Índice Maestro

## Pipeline completo
```
RSS → Institucional → Trends → ML Productos → Reseñas ML → Social → AliExpress
→ Comtrade → Proveedores → Embeddings → Clustering → Diario
```

## Estado de workflows

| Workflow | ID n8n | Estado |
|----------|--------|--------|
| Trends AR | DC74ImsqVudt11xb | ✅ Activo |
| ML Productos v2.0 | OZ4J5d3ClU4uAC79 | ✅ Activo |
| ML Reseñas v3 | UxJIOX85hYSnMGu1 | ✅ Activo |
| Social v2.0 | ZJLM7jq2FLjxp47J | ✅ Activo |
| AliExpress | gR1DY5FhgtcP9yP6 | ✅ Activo |
| Comtrade | XJwLHeKxuryvElrt | ✅ Activo |
| Proveedores v1.0 | PcE0ATR4UsLBnjiw | ✅ Activo |
| RSS | kSfveBpckZ6APF57 | ✅ Activo |
| Institucional | whzTinkADwKzdtQ1 | ✅ Activo |
| Embeddings | 7tFDSnx0tEGej8qe | ✅ Activo |
| Clustering | 3jsUOE9rVrSkzh41 | ✅ Activo |
| Motor Diario v2.0 | gpAW2laIPCEj19FI | ✅ Activo |
| Control Panel | JtSONgOXo0C2XbRl | ✅ Activo |

## Secciones del vault

### Sistema
- [[sistema/pipeline]] — arquitectura completa INPUT→DIARIO
- [[sistema/stack]] — n8n / Supabase / Apify / pgvector
- [[sistema/reglas]] — reglas no negociables

### Workflows
- [[workflows/trends]] — Módulo 1: Google Trends AR
- [[workflows/mercadolibre]] — Módulo 2: ML Productos + Reseñas
- [[workflows/social]] — Módulo 3: TikTok + Instagram
- [[workflows/rss]] — Módulo 4: RSS noticias
- [[workflows/aliexpress]] — AliExpress
- [[workflows/comtrade]] — Comtrade ONU
- [[workflows/proveedores]] — Google Maps proveedores
- [[workflows/diario]] — Motor Diario Gemini 2.5 Flash
- [[workflows/diario-criterios]] — ⭐ Criterios de calidad del Diario (score 0–100)

### Conocimiento acumulado
- [[errores/index]] — 30+ bugs resueltos y anti-patrones
- [[decisiones/index]] — decisiones tomadas (no re-discutir)
- [[fuentes/apify]] — actores Apify y sus quirks
- [[fuentes/serpapi]] — Google Trends y Maps
- [[fuentes/comtrade]] — API pública ONU
- [[referencias/neo-kim-13-conceptos]] — 13 conceptos AI engineering aplicados a MAKO
- [[referencias/obsidian-plugins]] — guía de instalación plugins + queries Dataview
- [[skills/index]] — inventario de 30+ skills disponibles

### Sources ingestadas (método Karpathy)
- [[sources/karpathy-wiki-method-obsidian-claude-code]] — Método Wiki Karpathy: ingest/query/lint con Claude Code + Obsidian

### Templates
- `templates/nota-base.md` — template con frontmatter completo para notas nuevas

### Base de datos
- [[supabase/schema]] — ⭐ Schema completo: tablas, columnas, queries frecuentes (columnas que NO existen)
- [[workflows/parametros-criticos]] — ⭐ Referencia rápida nodo+parámetro por workflow (evita leer JSONs completos)

## Datos en Supabase (28/06/2026)
- Señales totales: 5.654+
- Diarios generados: 8
- Fuentes activas: 18+
- Instancia: xbtgafvomvhgujxpjubr.supabase.co

## Bugs abiertos
- **D1**: Calidad Diario N°7 insatisfactoria (3 llamadas Gemini vs 1)
- **Social**: 0 resultados en última corrida

## Pendientes
- Ralph Loop: OK de Dario → publicar
- Módulo 3 (TikTok/IG): investigar 0 resultados
- n8n Starter: pagar $20/mes
