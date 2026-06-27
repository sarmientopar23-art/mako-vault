---
type: workflow
updated: 2026-06-27
status: operativo
id: OZ4J5d3ClU4uAC79
---

# MAKO-INGEST-ML-AR-v2.0

**Estado**: ✅ Operativo. Cerrado.
**ID n8n**: `OZ4J5d3ClU4uAC79`
**Fuente Supabase**: `mercadolibre-argentina`
**Schedule**: días 1 y 15 (corre después de Trends)
**TEST_MODE**: `true` (3 kw × 3 productos = 9 signals) → cambiar a `false` + `MAX_ITEMS=50` para producción

## Actor Apify
`karamelo~mercadolibre-scraper-espanol-castellano` — ~$0.096/run

## Flujo
```
Manual/Schedule → HTTP Supabase Leer Trends → Code Init → Code Build Queue
→ Loop Keywords (batchSize=1)
  → HTTP Apify Karamelo → HTTP Wait → Code Extract Dataset
  → HTTP Get Dataset → Code Normalize ML → Supabase UPSERT
  → Code Update Counter → nextBatch
onDone: → Code Aggregate Stats → UPSERT Deals → ingestion_log
```

## Campos críticos del actor Karamelo
- `articuloTitulo` → `texto_original`
- `nuevoPrecio` → `raw_payload.price` (parsear a float)
- `precioAnterior` → `raw_payload.old_price`
- `precioDiscount` → `increase_percentage` (extraer int de "22% OFF")
- `SKU` → `raw_payload.sku`
- `produtoReviews` → `raw_payload.reviews`

## UPSERT pattern (funciona)
```
URL: .../rest/v1/signals?on_conflict=entity_id
Prefer: resolution=ignore-duplicates,return=minimal
responseFormat: "text" ← CRÍTICO: no "json" (204 No Content vacío rompe el nodo)
```

## Bug crítico corregido (20/06/2026)
- `increase_percentage` DEBE ser INTEGER
- Karamelo devuelve "22% OFF" → extraer con `parseInt(String(val).replace(/[^0-9]/g, ''), 10)`

## Workflows relacionados
- [[diario]] — lee estas señales para M3/M4/M5/M6/M7/M8
- Workflow hermano: MAKO-INGEST-ML-REVIEWS-AR-v3.0 (ID: UxJIOX85hYSnMGu1)
