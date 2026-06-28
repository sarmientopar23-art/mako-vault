---
type: workflow
updated: 2026-06-28
status: activo
id: gR1DY5FhgtcP9yP6
---

# MAKO-INGEST-ALIEXPRESS-AR-v1.0

**Estado**: 🟡 Construido. Probado con 10 productos. Falta run completo con 50 keywords.
**ID n8n**: `gR1DY5FhgtcP9yP6`
**Schedule**: día 5 de cada mes, 6am UTC — NO activado
**TEST_MODE**: `true` → primeras 5 keywords, MAX_ITEMS=10

## Actor Apify
`piotrv1001~aliexpress-listings-scraper` — ~$0.60/50 keywords

## Endpoint crítico (run-sync — obligatorio)
```
POST https://api.apify.com/v2/acts/piotrv1001~aliexpress-listings-scraper/run-sync-get-dataset-items
  ?token={TOKEN}&timeout=300&maxItems={N}
Body: { "searchUrls": [{ "url": "https://www.aliexpress.com/wholesale?SearchText={keyword}" }] }
n8n timeout: 360000ms
```

## 50 keywords en inglés (organizadas por categoría)
```
Hogar: curtains, bedding, lamp, pillow, rug, mirror, cushion, vase, candles, decor
Moda: sneakers, handbag, jewelry, sunglasses, watch, belt, dress, leggings, shoes, bracelet
Tech: keyboard, smartwatch, earbuds, speaker, charger, headphones, webcam, powerbank, cables, tablet
Salud: skincare, collagen, vitamins, massager, makeup, perfume, shampoo, serum
Mascotas/Niños: collar, leash, toys, bicycle, stroller, backpack
Deporte: yoga, fitness, dumbbells, gloves
Temporada: christmas, halloween
```

## Mapa EN→ES
Incluido en Code Init. `texto_original` en Supabase queda en español aunque la búsqueda sea en inglés.

## Output Supabase
- `fuente`: `aliexpress-ar`
- `texto_original`: keyword en ESPAÑOL
- `raw_payload.price_usd`: precio en USD
- `raw_payload.currency`: `USD`

## Bugs corregidos
- `currency: 'ARS'` era incorrecto → ahora `currency: 'USD'` + `price_usd`
- NO usar `shipCountry=AR` → filtra todos los resultados a 0
- NO usar keywords argentinas (marcas locales) → AliExpress no las reconoce

## Flujo (18 nodos, 2 desactivados)
```
Trigger → Code Init → Code Build Queue → Loop Keywords
  → HTTP Apify run-sync (devuelve items directamente)
  → HTTP SerpAPI Google Shopping AR
  → Code Normalize AliExpress
  → Code Normalize Google Shopping
  → Merge → UPSERT Supabase → Code Counter → nextBatch
onDone: → Code Aggregate → ingestion_log
```
