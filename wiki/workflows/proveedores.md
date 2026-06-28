---
type: workflow
updated: 2026-06-28
status: activo
id: PcE0ATR4UsLBnjiw
---

# MAKO-INGEST-PROVEEDORES-AR-v1.0

**Estado**: ✅ ACTIVO — migrado a Apify compass~crawler-google-places
**ID n8n**: `PcE0ATR4UsLBnjiw`
**Schedule**: NO activado
**TEST_MODE**: true → 3 keywords × 5 places = ~15 señales

## Actor Apify
`compass~crawler-google-places` — $0.002/place — ~$0.04/corrida producción

## Cómo obtiene las queries
Lee signals de Supabase donde `fuente = 'google-trends-argentina'` → filtra con Code Build Queries:
- Excluye: preguntas (que, como, cuanto), marcas, términos de precio/promo
- Construye: `"mayorista {keyword} Argentina"`

## Endpoint Apify
```
POST .../compass~crawler-google-places/run-sync-get-dataset-items
  ?token={TOKEN}&timeout=300
Body: { searchStringsArray: [query], maxCrawledPlacesPerSearch: 5,
        language: "es", countryCode: "ar", includeReviews: false }
n8n timeout: 360000ms | responseFormat: "text"
```

## Bugs críticos
- `countryCode`: SIEMPRE lowercase `"ar"` — con "AR" da error 400
- timeout mínimo 300s — las búsquedas tardan ~88s

## Output Supabase
- `fuente`: `proveedores-google-maps`
- `texto_original`: "{nombre} - proveedor {keyword}"
- `raw_payload`: { name, phone, address, city, website, rating, reviews_count, instagram, facebook, google_category, keyword_origen, maps_url, place_id }

## Usa en el Diario
- M11: Directorio de proveedores (con teléfono, dirección, web, Instagram)
- M13/M14: Campo `local_supplier` en candidatos HIGH/MEDIUM (regla R8)
