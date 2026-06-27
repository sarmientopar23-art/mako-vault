---
type: sistema
updated: 2026-06-27
---

# Pipeline MAKO — Flujo completo de datos

```
INPUT → SIGNALS → CLUSTERS → OPPORTUNITIES → DIARIO ESTRATÉGICO
```

## Secuencia de ejecución (cada 15-20 días)

| Orden | Módulo | Workflow ID | Hora UTC |
|-------|--------|-------------|----------|
| 1 | RSS Noticias | kSfveBpckZ6APF57 | día 1, 4am |
| 2 | Institucional (CACE/CAME) | whzTinkADwKzdtQ1 | día 1, 5am |
| 3 | Google Trends AR | DC74ImsqVudt11xb | día 1, 6am |
| 4 | ML Productos | OZ4J5d3ClU4uAC79 | día 1, 7am |
| 5 | ML Reseñas | UxJIOX85hYSnMGu1 | día 1, 8am |
| 6 | Social (TikTok+IG) | ZJLM7jq2FLjxp47J | día 1, 10am |
| 7 | AliExpress | gR1DY5FhgtcP9yP6 | día 5, 6am |
| 8 | Comtrade | XJwLHeKxuryvElrt | día 5, 5am |
| 9 | Proveedores | PcE0ATR4UsLBnjiw | día 5, 7am |
| 10 | Embeddings | 7tFDSnx0tEGej8qe | después de ingesta |
| 11 | Clustering | 3jsUOE9rVrSkzh41 | después de Embeddings |
| 12 | Diario Estratégico | gpAW2laIPCEj19FI | último |

**NOTA**: Ningún schedule está activado aún — ejecución manual hasta OK de Dario.

## Principios arquitectónicos
- **Módulos 100% independientes**: si uno falla, los demás siguen
- **Supabase como punto de encuentro**: nunca dos workflows se comunican directamente
- **n8n solo orquesta**: nunca calcula similitud ni almacena datos permanentes
- **pgvector para similitud**: threshold 0.82, mínimo 5 signals, 2 fuentes distintas

## Fuentes de datos
- [[serpapi]] — Trends (gratis)
- [[apify]] — ML, Reviews, Social, AliExpress, Proveedores
- [[comtrade]] — Importaciones AR←China (gratis)
- RSS — feeds económicos AR
- APIs públicas CACE/CAME

## Datos en Supabase (27/06/2026)
- Señales totales: 5.654+
- Fuentes activas: 18+
- Diarios generados: 8
