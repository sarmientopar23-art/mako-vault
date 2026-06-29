---
type: hot-cache
updated: 2026-06-29
---

# Contexto reciente — MAKO (29/06/2026)

## Estado actual
Sistema MAKO completo y operativo. 12 workflows activos en n8n. 5.654+ señales en Supabase. 10 Diarios generados.
Corrida N°10 completada 29/06/2026 con múltiples fixes aplicados.

## Corrida N°10 — resumen ejecutivo
- **Total exec:** 12 workflows ejecutados (RSS 553 → Motor Diario 573)
- **Diario N°10** generado exitosamente (exec 573, 3m 20s)
- **3 fixes de producción aplicados durante la corrida:**

| Workflow | Fix | Parámetro |
|----------|-----|-----------|
| ML Productos | OOM en Code Normalize Deals | `maxResultsPerPage: 1000 → 100` |
| Proveedores | Timeout ECONNABORTED | `onError: continueErrorOutput` en HTTP Apify |
| Embeddings | OOM cascade + n8n 503 | `limit: 500 → 100` en GET Signals Pendientes |

## Límites de producción FIJOS (NO cambiar)
| Workflow | Parámetro | Valor | Razón |
|----------|-----------|-------|-------|
| ML Productos Deals Scraper | `maxResultsPerPage` | 100 | OOM en Code node |
| Embeddings | `limit` en GET Signals | 100 | Vectores 1536-dim agotan RAM n8n Cloud |

## Problema clave detectado: n8n Cloud OOM cascade
Workflows pesados (AliExpress 1.5h + Proveedores 30min) agotan la RAM del servidor n8n Cloud STARTER.
Si Embeddings se lanza inmediatamente después → crash repetido → 503 completo.
**Solución:** `limit=100` + esperar 2-3 min post-corrida pesada.

## Workflows activos — IDs clave
| Workflow | ID n8n | Estado |
|----------|--------|--------|
| Motor Diario v2.0 | gpAW2laIPCEj19FI | ✅ Activo, Diario N°10 generado |
| ML Productos v2.0 | OZ4J5d3ClU4uAC79 | ✅ maxResultsPerPage=100 |
| ML Reseñas v3 | UxJIOX85hYSnMGu1 | ✅ Activo |
| Trends AR | DC74ImsqVudt11xb | ✅ Activo, ventana 1-mes |
| Social v2.0 | ZJLM7jq2FLjxp47J | ✅ Activo |
| AliExpress | gR1DY5FhgtcP9yP6 | ✅ currency=USD fix |
| RSS | kSfveBpckZ6APF57 | ✅ MAX_AGE_DAYS=20 |
| Comtrade | XJwLHeKxuryvElrt | ✅ Activo |
| Proveedores | PcE0ATR4UsLBnjiw | ✅ continueErrorOutput |
| Embeddings | 7tFDSnx0tEGej8qe | ✅ limit=100 |
| Clustering | 3jsUOE9rVrSkzh41 | ✅ Activo |
| Institucional | whzTinkADwKzdtQ1 | ✅ Activo |

## Costos
- Apify: ~$6/corrida | Presupuesto jul 2026: ~$81 USD
- n8n: 50 exec/mes | ~12 por corrida completa
- IA: $0 (Gemini 2.5 Flash gratis)

## Columna que NO existe en signals
`run_id` NO existe. Usar `captured_at` (fecha YYYY-MM-DD) como proxy de corrida.

## GAP estratégico identificado
MAKO no cubre análisis de competencia directa en ML. Ver [[estrategia/cobertura-ecommerce-ar]].

## Próxima sesión
1. Revisar calidad Diario N°10 — correr `/analisis-diario`
2. Reiniciar Claude Code → reconectar Obsidian vault MCP
3. Evaluar módulo de competencia ML (consultar con Dario)
