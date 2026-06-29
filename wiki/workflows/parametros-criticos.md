---
type: reference
updated: 2026-06-28
confidence: high
related:
  - "[[workflows/mercadolibre]]"
  - "[[workflows/diario]]"
  - "[[workflows/social]]"
  - "[[workflows/aliexpress]]"
  - "[[workflows/rss]]"
---

# Parámetros críticos — workflows MAKO

Referencia rápida: qué nodo tocar y qué cambiar sin necesidad de leer el JSON completo del workflow.

---

## Motor Diario — `gpAW2laIPCEj19FI`

### Nodo: `Code Validate + Capital + Score`
- **capital_limit_usd**: derivado de `floor((capitalArs / blueRate) * 0.6)` — no es parámetro, es calculado
- **ralph_retry_count**: debe ser `currentRetry + 1` (bug B3 corregido 28/06)
- **Lógica capital**: validación AGREGADA (presupuesto acumulado), no individual por candidato (bug B2 corregido 28/06)

### Nodo: `Code Prepare Report`
- **Validación moduleCount**: lanza error si `moduleCount < 15` (bug B4 corregido 28/06)
- Patrón de detección: `diarioText.match(/## MODULO/g)`

### Nodo: `Code Init`
- Lee `parametros_corrida` de Supabase (capital_disponible, precio_min_ars, precio_max_ars)
- Defaults: capital=700000 ARS, min=1000, max=50000

---

## ML Productos — `OZ4J5d3ClU4uAC79`

### Nodo: `Code Init`
| Parámetro | TEST | PRODUCCIÓN |
|-----------|------|------------|
| `TEST_MODE` | `true` | `false` |
| `MAX_ITEMS` | 2 (por keyword) | `50` |
| Señales generadas | ~9 | ~750 |

**Costo Apify en producción**: ~$2.40 por corrida
**Actor**: `karamelo~mercadolibre-scraper-espanol-castellano`

---

## ML Reseñas — `UxJIOX85hYSnMGu1`

### Nodo: `Code Init`
| Parámetro | TEST | PRODUCCIÓN |
|-----------|------|------------|
| `TEST_MODE` | `true` | `false` |
| Keywords activas | 1-2 | 15 |
| Productos por keyword | 1 | 3 |
| Reseñas por producto | 3 | 30 |
| Señales generadas | ~3 | ~100+ |

**Costo Apify en producción**: ~$2.79 por corrida
**Actor**: `saswave~mercadolibre-reviews-scraper`

---

## AliExpress — `gR1DY5FhgtcP9yP6`

### Nodo: `Code Init`
| Parámetro | TEST | PRODUCCIÓN |
|-----------|------|------------|
| `TEST_MODE` | `true` | `false` |
| Keywords activas | 5 | 50 |
| Señales generadas | ~25 | ~500+ |

**Costo Apify en producción**: ~$0.60 por corrida
**Actor**: `piotrv1001~aliexpress-listings-scraper`
**CRÍTICO**: keywords en INGLÉS. NO usar español.

---

## Social TikTok+IG — `ZJLM7jq2FLjxp47J`

### Estado actual: 0 resultados — investigar antes de tocar
- **Actor TikTok**: `clockworks~tiktok-trends-scraper` — NO soporta `adsCountryCode: "AR"`
- Estrategia actual: derivar trends de posts descargados con regex de hashtags
- Filtro antigüedad: 60 días → posible causa de 0 resultados
- **No correr Apify hasta diagnosticar con `get_execution`**

---

## RSS — `kSfveBpckZ6APF57`

### Feeds actuales (3 de 5 muertos)
| Feed | Estado |
|------|--------|
| Ámbito Financiero | ⚠️ Solo 1 señal |
| iProfesional | 🔴 Muerto |
| Cronista | 🔴 Muerto |
| + 2 más | 🔴 Estado desconocido |

**Fix pendiente**: reemplazar feeds muertos + fix `responseFormat: "json"` → `"text"` en nodo UPSERT (bug S1)

---

## Proveedores — `PcE0ATR4UsLBnjiw`

### Nodo: `Code Build Queries`
- Genera queries a partir de keywords de Trends
- **Ampliar con queries estáticas** (Etapa 5):
  - `"importador cosmeticos belleza Argentina"`
  - `"mayorista fitness yoga Argentina"`
  - `"distribuidor depiladoras epiladoras Argentina"`

---

## Trends AR — `DC74ImsqVudt11xb`
✅ Estable. Sin cambios pendientes.
**API**: SerpAPI (credencial configurada)

---

## Embeddings — `7tFDSnx0tEGej8qe`
✅ Estable.
**Credencial**: BNNRJaDhsx7ZnKxl (OpenAI text-embedding-3-small)

## Clustering — `3jsUOE9rVrSkzh41`
✅ Estable.
**Umbral**: 0.82 similitud, mínimo 5 signals, 2 fuentes distintas — NO cambiar.

## Comtrade — `XJwLHeKxuryvElrt`
✅ Estable.
**Endpoint**: `/public/v1/preview` sin API key. Solo funciona desde n8n Cloud (no local).

## Institucional — `whzTinkADwKzdtQ1`
✅ Estable. Fuentes: INDEC, BCRA, CAME, CACE.
