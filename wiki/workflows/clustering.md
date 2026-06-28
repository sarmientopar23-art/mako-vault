---
type: workflow
updated: 2026-06-28
status: activo
id: 3jsUOE9rVrSkzh41
---

# MAKO-MOTOR-CLUSTERING-v1.0

**Estado**: ✅ ACTIVO
**ID n8n**: `3jsUOE9rVrSkzh41`

## Qué hace
Agrupa signals similares en clusters usando pgvector en Supabase. Cada cluster representa un fenómeno emergente del mercado.

## Parámetros de clustering
- **Umbral similitud**: `0.82` (cosine similarity en pgvector)
- **Mínimo signals por cluster**: `5`
- **Mínimo fuentes distintas**: `2`
- **Ventana temporal**: 7 días

## Output → tabla `clusters`
Cada cluster tiene: ID, lista de signal IDs, fuentes involucradas, score, timestamp.

## Posición en pipeline
Corre después de [[embeddings]]. Antes de [[diario]].

## Regla arquitectónica
- Cálculo de similitud ocurre en pgvector (SQL), NO dentro de n8n
- Los Opportunities nacen desde Clusters, nunca directamente desde Signals
- Trazabilidad: Opportunity → Cluster → Signals → Fuente original
