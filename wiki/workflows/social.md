---
type: workflow
updated: 2026-06-27
status: activo
id: ZJLM7jq2FLjxp47J
---

# MAKO-INGEST-SOCIAL-AR-v2.0

**Estado**: ✅ ACTIVO — filtro frescura TikTok/Instagram (60 días)
**ID n8n**: `ZJLM7jq2FLjxp47J`
**Fuentes Supabase**: `tiktok-argentina`, `instagram-argentina`

## Actores Apify
- TikTok: `clockworks~tiktok-scraper` — ~$0.40/run
- Instagram: `apify~instagram-hashtag-scraper` — ~$0.10/run

## Fix aplicado 27/06/2026
- `Normalize TikTok Posts`: descarta videos con `createTime` anterior a 60 días (Unix timestamp)
- `Normalize Instagram Posts`: descarta posts con `timestamp` anterior a 60 días (ISO string)
- Ambos logs cuentan `descartados_antiguos` para auditoría

## Pendiente
- Tuvo 0 resultados en última corrida — investigar configuración de keywords en Social

## Workflow archivado
- v1.0 (ID: mwjHcmNmk5ihjtMy) → ARCHIVADO. Reemplazado por v2.0.

## Usa en el Diario
- M10: Quejas y frustraciones (fuente: Reseñas ML + Social)
