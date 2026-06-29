---
type: reference
updated: 2026-06-28
confidence: high
related:
  - "[[sistema/stack]]"
  - "[[errores/index]]"
---

# Schema Supabase — MAKO Intelligence

Instancia: `xbtgafvomvhgujxpjubr.supabase.co`
Auth: SIEMPRE usar service_role JWT. La anon key no funciona (bug S5).

---

## Tabla `signals` (fuente de verdad del sistema)

| Columna | Tipo | Notas |
|---------|------|-------|
| id | uuid | PK, auto |
| entity_id | text | ID único del item en su fuente (ej: ML item ID, URL RSS) |
| fuente | text | `'google-trends-ar'`, `'mercadolibre-argentina'`, `'mercadolibre-argentina-resenas'`, `'social-tiktok'`, `'aliexpress'`, `'comtrade'`, `'rss-noticias'`, `'institucional'`, `'google-maps-proveedores'` |
| keyword | text | Keyword que originó la señal |
| category | text | Categoría del producto/tema |
| texto_original | text | Texto limpio para embeddings |
| raw_payload | jsonb | Payload completo del actor/fuente (campos varían por fuente) |
| embedding | vector(1536) | OpenAI text-embedding-3-small (nullable hasta correr Embeddings) |
| captured_at | timestamptz | Fecha/hora de captura — **PROXY de corrida** (no existe run_id) |
| created_at | timestamptz | Auto-generado por Supabase |

### ⚠️ Columna que NO existe
- `run_id` — NO existe. Causar error en queries que la pidan.
- Usar `captured_at::date` como proxy de corrida: `captured_at > now() - interval '1 day'`

### Campos clave de raw_payload por fuente

**mercadolibre-argentina** (actor karamelo):
- `articuloTitulo` — título del producto
- `nuevoPrecio` — precio actual en ARS (número)
- `precioDiscount` — string "22% OFF" → parsear con `parseInt(String(val).replace(/[^0-9]/g,''),10)`
- `produtoReviews` — cantidad de reseñas
- `zdireccion` — URL del listing
- `produtoCategoryID` (typo intencional del actor)

**mercadolibre-argentina-resenas** (actor saswave):
- `content` — texto de la reseña
- `rating` — puntaje 1-5
- `date` — string, puede ser vacío → usar `r.date || r.date_str || null`
- NO tiene campo `type` → no filtrar por `r.type`

**aliexpress** (actor piotrv1001):
- `price_usd` — precio en USD
- `currency` — siempre `'USD'`
- Keywords deben estar en INGLÉS (no español)

---

## Tabla `reports` (Diarios generados)

| Columna | Tipo | Notas |
|---------|------|-------|
| id | uuid | PK, auto |
| edition_number | int | Número de Diario (1, 2, 3...) |
| period_start | date | Inicio del período analizado |
| period_end | date | Fin del período analizado |
| quality_score | int | Score 0-100 (Ralph Gate) |
| quality_grade | text | `'A'`, `'B'`, `'C'`, `'C_FORZADO'` |
| quality_flags | text | JSON string con array de flags |
| phase1_json | jsonb | Output estructurado de Gemini Fase 1 |
| diario_text | text | Markdown completo del Diario (15 módulos) |
| signals_processed | int | Cantidad de señales usadas |
| generated_at | timestamptz | Timestamp de generación |
| diario_word_count | int | Palabras del Diario |
| diario_module_count | int | Módulos encontrados (debe ser 15) |

---

## Tabla `parametros_corrida` (Control Panel)

| Columna | Tipo | Notas |
|---------|------|-------|
| id | uuid | PK |
| capital_disponible | numeric | Capital en ARS (default 700000) |
| precio_min_ars | numeric | Precio mínimo por producto (default 1000) |
| precio_max_ars | numeric | Precio máximo por producto (default 50000) |
| created_at | timestamptz | Auto |
| active | boolean | Solo usar el registro con `active = true` |

---

## Tablas de clustering

### `clusters`
| Columna | Tipo |
|---------|------|
| id | uuid PK |
| cluster_id | text |
| created_at | timestamptz |

### `cluster_signals`
| Columna | Tipo |
|---------|------|
| id | uuid PK |
| cluster_id | uuid FK → clusters.id |
| signal_id | uuid FK → signals.id |

---

## Queries frecuentes

```sql
-- Señales de la corrida más reciente
SELECT * FROM signals 
WHERE captured_at::date = (SELECT MAX(captured_at::date) FROM signals)
ORDER BY captured_at DESC;

-- Contar señales por fuente
SELECT fuente, COUNT(*) FROM signals GROUP BY fuente ORDER BY COUNT(*) DESC;

-- Último Diario generado
SELECT edition_number, quality_grade, quality_score, generated_at 
FROM reports ORDER BY edition_number DESC LIMIT 1;

-- Clusters con pocas fuentes (debug clustering)
SELECT cluster_id, COUNT(*) as signals, COUNT(DISTINCT s.fuente) as fuentes
FROM cluster_signals cs JOIN signals s ON cs.signal_id = s.id
GROUP BY cluster_id HAVING COUNT(*) < 5 OR COUNT(DISTINCT s.fuente) < 2;
```
