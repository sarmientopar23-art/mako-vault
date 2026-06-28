---
type: workflow
updated: 2026-06-28
status: activo
id: UxJIOX85hYSnMGu1
---

# MAKO-INGEST-ML-REVIEWS-AR-v3.0

**Estado**: ✅ OPERATIVO. 17 reseñas insertadas en test (20/06/2026).
**ID n8n**: `UxJIOX85hYSnMGu1`
**Schedule**: días 1 y 15 a las 8am UTC — NO activado
**TEST_MODE**: `true` actualmente → cambiar a `false` para producción

## Actores Apify
- `karamelo~mercadolibre-scraper-espanol-castellano` → busca productos por keyword → filtra `/p/MLA\d+`
- `saswave~mercadolibre-reviews-scraper` → $0.0006/reseña → scrapeea reseñas del catálogo

## Costo
- Test (3 kw): ~$0.40 | Producción (15 kw): ~$2.25/corrida

## Arquitectura v3 (independiente de ML Productos)
Lee keywords de Trends directamente → Karamelo busca por keyword → filtra catalogos → saswave → reseñas → Supabase

## Bugs críticos corregidos
1. `alwaysOutputData: true` en `HTTP Get Reviews Dataset` — sin esto, dataset vacío → onDone nunca dispara
2. `alwaysOutputData: true` en `HTTP Get Karamelo Dataset` — mismo problema defensivo
3. saswave NO tiene campo `r.type` → filtrar por `!textoOriginal`, NO por `r.type !== 'REVIEW'`

## Formato real saswave
Items: `{ rating, sku, content, title, likes, date, date_str, images, variant }`
- `date` puede ser string vacío → usar `date_str` como fallback
- `sku` = catalog ID formato MLA+dígitos

## entity_id
```javascript
SHA256('mercadolibre-argentina-resenas:' + sku + ':' + textoNorm)
```

## Output Supabase
- `fuente`: `mercadolibre-argentina-resenas`
- `texto_original`: contenido de la reseña (r.content || r.title)
- `raw_payload.rating`: rating
- `raw_payload.catalog_id`: MLA8dígitos
- `search_volume`: r.likes (votos útiles)

## Workflow archivado
v1.0/v2.0 (ID: H3Zvi8zLpiqgbTAH) → ARCHIVADO 20/06/2026 (dependía de ML Productos con URL nula)
