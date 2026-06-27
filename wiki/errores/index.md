---
type: errors
updated: 2026-06-27
confidence: high
---

# Errores y Lecciones MAKO

## Supabase
| # | Error | Fix |
|---|-------|-----|
| S1 | HTTP crashea en UPSERT | `responseFormat: "text"` en todos los UPSERT |
| S2 | `increase_percentage` rechazado | `parseInt(String(val).replace(/[^0-9]/g,''),10)\|\|null` |
| S3 | GET devuelve solo 1000 filas | 16 queries separadas por fuente, limit=500 |
| S4 | UPSERT falla con array vacío | `$json._empty ? '[]' : JSON.stringify([...])` |
| S5 | anon key no funciona | Usar SIEMPRE service_role JWT |

## Apify
| # | Error | Fix |
|---|-------|-----|
| A1 | 0 resultados aunque terminó | Usar `/run-sync-get-dataset-items` — bloquea hasta terminar |
| A3 | Loop se corta con 0 items | `alwaysOutputData: true` en TODOS los GET dentro de loops |
| A5 | Fan-in doble en loop | Verificar que cada nodo del loop tenga exactamente UNA conexión entrante |
| A6 | AliExpress 0 con keywords en español | Keywords en inglés, mapa EN→ES para Supabase |

## n8n expresiones y nodos
| # | Error | Fix |
|---|-------|-----|
| N1 | "invalid syntax" en HTTP body | Construir JSON en Code node, referenciar con `$json.campo` |
| N2 | Execute Workflow mata sub-workflow | Usar webhook HTTP POST para workflows >2 min |
| N3 | nextBatch nunca se llama | `alwaysOutputData: true` en nodos que pueden devolver `[]` |
| N5 | Code node sobrescribe contexto | Siempre incluir el código COMPLETO del nodo |
| N6 | Loop externo avanza múltiples posiciones | Loop interno para N reseñas, nextBatch solo en onDone del interno |

## Gemini 2.5 Flash
| # | Error | Fix |
|---|-------|-----|
| G1 | 0 tokens output, éxito falso | `thinkingConfig: { thinkingBudget: 0 }` |
| G2 | thinkingConfig inline falla | Construir body en Code node → HTTP referencia `$json.gemini_body` |

## Actores — quirks
### Karamelo (`karamelo~mercadolibre-scraper-espanol-castellano`)
- `precioDiscount` → string "22% OFF" → parsear a int
- `articuloTitulo`, `nuevoPrecio`, `zdireccion` (URL), `produtoCategoryID` (typo)

### saswave (`saswave~mercadolibre-reviews-scraper`)
- NO tiene campo `type` → no filtrar por `r.type !== 'REVIEW'`
- `date` puede ser string vacío → usar `r.date || r.date_str || null`

### TikTok (`clockworks~tiktok-trends-scraper`)
- NO soporta Argentina (`adsCountryCode: "AR"`) → devuelve `{}` vacío
- Solución: derivar trends de posts ya descargados (regex #hashtags)

### Instagram (`apify~instagram-scraper`)
- BLOQUEADO para hashtags → usar `apify~instagram-hashtag-scraper`
- `likesCount` siempre 0 — Meta lo oculta

### AliExpress (`piotrv1001~aliexpress-listings-scraper`)
- NO usar `shipCountry=AR` → filtra todos los resultados
- Keywords en inglés de 1 palabra

### Comtrade (API ONU)
- Endpoint correcto: `/public/v1/preview` (sin API key)
- No resuelve desde Windows — funciona solo desde n8n Cloud

## Anti-patrones — nunca hacer
- ❌ `responseFormat: "json"` en UPSERTs a Supabase
- ❌ `waitForFinish=300` para actores Apify pesados
- ❌ `thinkingConfig` inline en expresión `={{ }}` de n8n
- ❌ Execute Workflow para workflows >2 minutos
- ❌ Keywords en español en AliExpress
- ❌ `updateNodeParameters` con código parcial
- ❌ Pedir a Dario que corra sin diagnosticar primero
