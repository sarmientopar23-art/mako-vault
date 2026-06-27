---
type: workflow
updated: 2026-06-27
status: parcial
id: kSfveBpckZ6APF57
---

# MAKO-INGEST-RSS-AR-v1.0

**Estado**: 🟡 Funciona parcialmente
**ID n8n**: `kSfveBpckZ6APF57`
**Schedule**: días 1 y 15 a las 4am UTC (1am Argentina)

## 5 feeds configurados

| Feed | Fuente | Estado |
|------|--------|--------|
| infobae.com/economia | `infobae-economia` | ✅ 107 señales |
| lanacion.com.ar/economia | `lanacion-economia` | ✅ 91 señales |
| ambito.com/rss/economia | `ambito-financiero` | ⚠️ solo 1 señal |
| iprofesional.com/rss/economia | `iprofesional` | ❌ 0 señales |
| cronista.com/economia-politica | `cronista-comercial` | ❌ 0 señales |

## Bugs pendientes (no bloqueantes)
1. `Supabase UPSERT signals RSS` tiene `responseFormat: "json"` → debería ser `"text"`
2. Verificar URLs de iProfesional y Cronista (pueden estar caídas)
3. `ingestion_log` registra `fuente: 'rss-noticias-economia-ar'` genérico en vez de por feed

## Workflow hermano
- `whzTinkADwKzdtQ1` — MAKO-INGEST-INSTITUCIONAL (CACE + CAME + Aduana)

## Usa en el Diario
- M1: Pulso económico (fuente: RSS + Institucional)
- M2: Comportamiento consumidor
