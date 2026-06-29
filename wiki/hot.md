---
type: hot-cache
updated: 2026-06-28
---

# Contexto reciente — MAKO (28/06/2026)

## Estado actual
Sistema MAKO completo y operativo. 13 workflows activos en n8n. 5.654+ señales en Supabase. 9 Diarios generados.
Motor Diario v2.0 actualizado con 3 bugs críticos corregidos (28/06).

## Sesión 28/06/2026 — lo que cambió
- **Bug fix run_id** (exec 550 falló): `HTTP Supabase ML History` pedía columna `run_id` que no existe → cambiado a `captured_at`; `Code Compare Historico` usa fecha como proxy de corrida
- **Diario N°9** (exec 551): ✅ Grade A, Score 100, 4 HIGH + 2 MEDIUM, 3m26s, guardado en Supabase + OneDrive
- **3 bugs corregidos en Motor Diario** (draft, NO publicado):
  - B2: capital ahora validado de forma AGREGADA (acumula presupuesto, no individual por candidato)
  - B3: `ralph_retry_count: currentRetry + 1` (antes no incrementaba → loop infinito potencial)
  - B4: moduleCount < 15 → error explícito, Diario no se guarda
- **Plan 8 etapas aprobado** por Dario para mejorar el sistema antes de corrida completa
- **MAKO-VAULT** conectado vía MCP obsidian-vault → Claude puede leer/escribir el vault directamente

## IMPORTANTE: Motor Diario en DRAFT
Los 3 fixes están aplicados pero el workflow NO está publicado aún. Requiere OK de Dario antes de `publish_workflow`.

## Pendiente inmediato
1. Dario da OK → publicar Motor Diario con fixes
2. Etapa 2: ML Productos → TEST_MODE = false (nodo `Code Init`, workflow OZ4J5d3ClU4uAC79)
3. Etapa 3: ML Reseñas → TEST_MODE = false (nodo `Code Init`, workflow UxJIOX85hYSnMGu1)
4. Etapa 4: RSS feeds muertos → reemplazar iProfesional + Cronista
5. Etapa 8 (ÚLTIMA): corrida completa

## Workflows activos — IDs clave
| Workflow | ID n8n | Estado |
|----------|--------|--------|
| Motor Diario v2.0 | gpAW2laIPCEj19FI | ⚠️ DRAFT (fixes pendientes de publicar) |
| ML Productos v2.0 | OZ4J5d3ClU4uAC79 | TEST_MODE (9 señales) |
| ML Reseñas v3 | UxJIOX85hYSnMGu1 | TEST_MODE (3 reseñas) |
| Trends AR | DC74ImsqVudt11xb | ✅ Activo |
| Social v2.0 | ZJLM7jq2FLjxp47J | ⚠️ 0 resultados en última corrida |
| AliExpress | gR1DY5FhgtcP9yP6 | TEST_MODE |
| RSS | kSfveBpckZ6APF57 | ⚠️ 3/5 feeds muertos |
| Control Panel | JtSONgOXo0C2XbRl | ✅ Activo |

## Costos actuales
- Apify: ~$6.50/corrida | Presupuesto jun 2026: ~$87 USD
- n8n: 50 exec/mes | ~12 por corrida completa
- IA: $0 (Gemini 2.5 Flash gratis)

## Columna que NO existe en signals
`run_id` NO existe. Usar `captured_at` (fecha YYYY-MM-DD) como proxy de corrida.
