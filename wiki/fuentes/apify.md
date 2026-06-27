---
type: reference
updated: 2026-06-27
---

# Apify — Fuente de scraping cloud

**Plan**: STARTER $29 USD/mes
**Token en workflows n8n**: `[ver referencias_tecnicas.md en memoria privada]`
**Token en MCP**: `[ver .mcp.json — no commitear]`
**Presupuesto disponible jun 2026**: ~$87 USD

## Actores en uso

| Actor | ID | Costo | Workflow |
|-------|-----|-------|---------|
| MercadoLibre ES | `karamelo~mercadolibre-scraper-espanol-castellano` | ~$0.096/run | [[mercadolibre]] |
| ML Reviews | `saswave~mercadolibre-reviews-scraper` | $0.0006/reseña | ML Reseñas v3 |
| TikTok | `clockworks~tiktok-scraper` | ~$0.40/run | [[social]] |
| Instagram | `apify~instagram-hashtag-scraper` | ~$0.10/run | [[social]] |
| AliExpress | `piotrv1001~aliexpress-listings-scraper` | ~$0.60/50kw | AliExpress |
| Google Places | `compass~crawler-google-places` | $0.002/place | Proveedores |

## Patrón run-sync (OBLIGATORIO para evitar bug waitForFinish)
```
POST https://api.apify.com/v2/acts/{ACTOR_ID}/run-sync-get-dataset-items
  ?token={TOKEN}&timeout=300&maxItems={N}
Body: {...params}
n8n timeout: 360000ms
responseFormat: "text"
```

## Regla de oro
CERO scraping local. Todo se ejecuta en los servidores de Apify via API Token.
La notebook SOLO corre Claude Code + VS Code + MCP.

## Gasto acumulado (jun 20-23/2026): $7.92
## Costo por corrida completa: ~$5.89
## 2 corridas/mes = ~$12 → dentro del plan STARTER

## Quirks documentados
- `waitForFinish=300` NO espera cuando actor está en cola (status READY) → usar `run-sync-get-dataset-items`
- `alwaysOutputData: true` en HTTP nodes que pueden recibir dataset vacío — sin esto el loop se cuelga
- `countryCode` en compass: debe ser lowercase `"ar"` (no "AR" → da error 400)
- saswave: no usar `r.type !== 'REVIEW'` para filtrar — usar `!textoOriginal` en su lugar
