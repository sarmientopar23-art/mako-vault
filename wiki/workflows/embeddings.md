---
type: workflow
updated: 2026-06-28
status: activo
id: 7tFDSnx0tEGej8qe
---

# MAKO-MOTOR-EMBEDDINGS-v1.0

**Estado**: ✅ ACTIVO
**ID n8n**: `7tFDSnx0tEGej8qe`
**Credencial**: `BNNRJaDhsx7ZnKxl` (OpenAI — text-embedding-3-small)
**Costo**: ~$0.10/corrida

## Qué hace
Lee señales de la tabla `signals` que no tienen embedding → genera vectores 1536 dimensiones → los guarda en la columna `embedding` (tipo VECTOR(1536) de pgvector).

## ⚠️ Límite crítico — NO cambiar
`GET Signals Pendientes` usa `limit=100`. **NUNCA subir a más de 100.**
Razón: Los vectores 1536-dim son muy pesados en RAM. Con `limit=500`, después de corridas pesadas (AliExpress 1.5h + Proveedores 30min), n8n Cloud STARTER se queda sin memoria → crash + n8n 503.
Fix aplicado 29/06/2026 (activeVersionId: 0412262e). Ver [[errores/index#OOM]].

## Tecnología
- **Modelo**: `text-embedding-3-small` (OpenAI)
- **Columna destino**: `signals.embedding` (pgvector)
- Los embeddings **nunca se reemplazan** — nuevas versiones conviven con anteriores

## Posición en pipeline
Corre después de todos los workflows de ingesta. Antes de [[clustering]].

## Regla arquitectónica
Nada calcula similitud dentro de n8n. Todo el cálculo vectorial ocurre en [[stack#pgvector]].
