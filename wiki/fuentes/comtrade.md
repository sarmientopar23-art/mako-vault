---
type: reference
updated: 2026-06-27
---

# Comtrade ONU — Importaciones AR←China

**Costo**: $0 — API pública
**Workflow**: MAKO-INGEST-COMTRADE-AR-v1.0 (ID: XJwLHeKxuryvElrt)
**Estado**: ✅ CREADO 23/06/2026 — listo para test run

## Endpoint
```
GET https://comtradeapi.un.org/public/v1/preview/C/M/{YYYYMM}
    ?reporterCode=32&partnerCode=156&flowCode=M&includeDesc=true
```
- `reporterCode=32` = Argentina
- `partnerCode=156` = China
- Sin API key (endpoint público /preview)

## Output en Supabase
- `fuente`: `comtrade-ar-china`
- `texto_original`: "importacion china {categoría_en_español}"
- `raw_payload.hs_chapter`: código HS de 2 dígitos (ej: "85" = electrónica)
- `raw_payload.fob_usd`: valor importado en USD ese mes
- `raw_payload.period`: YYYYMM (ej: "202605")
- Mapa HS→ES: 70 capítulos mapeados al español en Code Normalize
- `entity_id`: SHA256(fuente + ':' + chapter + ':' + period)

## Schedule
- Día 5 de cada mes, 5am UTC — NO activado aún

## Usa en el Diario
- M12-M15: Inteligencia estratégica (qué importa China que todavía no se vende en AR)
