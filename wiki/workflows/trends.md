---
type: workflow
updated: 2026-06-27
status: operativo
id: DC74ImsqVudt11xb
---

# MAKO-INGEST-TRENDS-AR-v3.0

**Estado**: ✅ Operativo. No tocar.
**ID n8n**: `DC74ImsqVudt11xb`
**Schedule**: días 1 y 15 a las 6am UTC
**Fuente Supabase**: `google-trends-argentina`

## Seeds (9 keywords base)
- Tier 0: `mercadolibre`
- Tier 1: `mascotas`, `decoracion`, `ropa moda`, `celular`
- Tier 2: `colageno`, `videojuegos`, `freidora de aire`, `ropa niños`
- Filtro: excluye keywords de deportes y política

## Output en Supabase
- `fuente` = `google-trends-argentina`
- `search_volume` = número (ej: 1000 = 1000%)
- `texto_original` = keyword trending
- `increase_percentage` = % de aumento (integer)

## Relaciones
- [[mercadolibre]] lee estas keywords para buscar productos
- [[rss]] — workflow hermano en pipeline
- Ver [[stack]] para credenciales SerpAPI

## Notas
- Este workflow es el ancla de todo el sistema — si Trends no tiene datos, ML no tiene keywords
- SerpAPI incluida en plan sin costo extra
