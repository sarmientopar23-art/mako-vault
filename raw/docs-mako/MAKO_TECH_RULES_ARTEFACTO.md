# MAKO TECH RULES v1.0
## REGLAS TÉCNICAS OBLIGATORIAS

---

## INTRODUCCIÓN

Este documento define las reglas técnicas obligatorias que toda implementación, workflow, JSON, automatización, integración o componente de MAKO debe respetar.

**Si una implementación viola una de estas reglas, se considera desviación arquitectónica y debe corregirse.**

---

| # | Regla | Detalle |
|---|-------|---------|
| 1 | PostgreSQL = Verdad | Única fuente de verdad. Ninguna IA, workflow o interfaz tiene autoridad superior. |
| 2 | Toda entidad persiste | Signals, Clusters, Opportunities y Reports deben existir en DB. |
| 3 | pgvector para similitud | No se permiten cálculos masivos de similitud dentro de n8n. |
| 4 | Embeddings versionados | No se comparan embeddings de versiones distintas. Declarar siempre `embedding_version`. |
| 5 | Cluster: 5 signals, 2 fuentes | Mínimo para crear un Cluster. |
| 6 | Similitud 0.82 default | Umbral base. Excepciones deben versionarse. |
| 7 | Opportunities desde Clusters | No pueden nacer directamente desde Signals. |
| 8 | Trazable a origen | Opportunity → Cluster → Signals → Fuente Original. |
| 9 | Cálculos versionados | Scoring, clustering, embeddings, IA, reportes. |
| 10 | Historia inmutable | Las nuevas versiones generan nuevas entidades. Nunca sobrescriben. |
| 11 | Feedback no modifica | Solo alimenta versiones futuras. |
| 12 | IA registrada | Modelo, versión, prompt, parámetros, timestamp. |
| 13 | Golden Cases | Toda nueva versión debe pasar validación antes de producción. |
| 14 | n8n = orquestador | No es fuente de verdad, no es motor vectorial, no es almacenamiento. |
| 15 | Auditoría desde DB | Toda implementación debe poder auditarse reconstruyendo desde PostgreSQL. |

---

**ESTADO: CONGELADO**
