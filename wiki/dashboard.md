---
type: dashboard
updated: 2026-06-27
---

# MAKO Intelligence — Dashboard

## Estado del sistema

```dataview
TABLE status AS "Estado", id AS "ID n8n"
FROM "wiki/workflows"
SORT file.name ASC
```

## Señales en Supabase
- **Total:** 5.654+
- **Fuentes activas:** 18+
- **Diarios generados:** 8

## Bugs abiertos

```dataview
LIST
FROM "wiki/errores"
WHERE contains(file.name, "index")
```

## Sesiones recientes

```dataview
TABLE file.ctime AS "Fecha"
FROM "wiki/sesiones"
WHERE !contains(file.name, "checkpoint")
SORT file.ctime DESC
LIMIT 10
```

## Workflows activos

| Workflow | ID | Estado |
|----------|----|--------|
| Trends AR | DC74ImsqVudt11xb | ✅ |
| ML Productos | OZ4J5d3ClU4uAC79 | ✅ |
| ML Reseñas | UxJIOX85hYSnMGu1 | ✅ |
| Social v2.0 | ZJLM7jq2FLjxp47J | ✅ |
| AliExpress | gR1DY5FhgtcP9yP6 | ✅ |
| Comtrade | XJwLHeKxuryvElrt | ✅ |
| Proveedores | PcE0ATR4UsLBnjiw | ✅ |
| RSS | kSfveBpckZ6APF57 | ✅ |
| Institucional | whzTinkADwKzdtQ1 | ✅ |
| Embeddings | 7tFDSnx0tEGej8qe | ✅ |
| Clustering | 3jsUOE9rVrSkzh41 | ✅ |
| Motor Diario | gpAW2laIPCEj19FI | ✅ |
| Control Panel | JtSONgOXo0C2XbRl | ✅ |

## Pendientes urgentes
- Ralph Loop: espera OK de Dario para publicar
- Bug D1: calidad Diario N°7 — decidir arquitectura
- Social: investigar 0 resultados
- n8n Starter: pagar $20/mes

## Costos
- Apify: ~$6.50/corrida | Presupuesto jun 2026: ~$87 USD
- n8n: 50 exec/mes disponibles
- IA (Gemini): $0
