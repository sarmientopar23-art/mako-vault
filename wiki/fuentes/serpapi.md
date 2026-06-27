---
type: reference
updated: 2026-06-27
---

# SerpAPI — Google Trends + Shopping AR

**API Key**: `6eedbd26678bb237b2b8873217980732f905b4391d98e59f389b0a41dc0bd92a`
**Costo**: $0 — incluido en el plan de Dario
**Uso en MAKO**: Módulo 1 (Trends) + Google Shopping en AliExpress

## Endpoints usados

### Google Trends AR
```
GET https://serpapi.com/search.json
  ?engine=google_trends&q={keyword}&geo=AR&hl=es&api_key={KEY}
```

### Google Shopping AR (cruce AliExpress)
```
GET https://serpapi.com/search.json
  ?engine=google_shopping&q={keyword}&gl=ar&hl=es&api_key={KEY}
```

## Workflow
- [[trends]] — Módulo 1, base de todo el sistema
- [[mercadolibre]] — lee los trends para buscar keywords

## Nota
SerpAPI es gratuita en el plan actual. No hay costo a monitorear aquí.
