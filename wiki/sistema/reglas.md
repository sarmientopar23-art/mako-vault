---
type: sistema
updated: 2026-06-27
---

# Reglas MAKO — No negociables

## Reglas de arquitectura

1. **n8n es orquestador** — no almacena ni calcula similitud semántica
2. **Todo se escribe en `signals`** — tabla Supabase como fuente de verdad absoluta
3. **Nada se sobrescribe** — todo se versiona (UPSERT con `on_conflict=entity_id` + `ignore-duplicates`)
4. **Trazabilidad completa** — Opportunity → Cluster → Signal → Fuente (siempre rastreable)
5. **Feedback no modifica histórico** — nunca UPDATE sobre datos pasados
6. **Toda IA se registra** — modelo, versión, prompt, timestamp en cada uso

## Reglas de hardware

- **CERO scraping local** — prohibido correr Crawlee, Puppeteer, Playwright en la notebook
- **Cloud-First obligatorio** — todo actor Apify se lanza via API Token desde n8n
- La notebook solo corre: Claude Code + VS Code + MCP

## Reglas de trabajo (permisos)

| Operación | Nivel | Acción |
|-----------|-------|--------|
| read, validate, get_execution, queries Supabase | LOW | Proceder directo |
| update_workflow (draft), crear tabla, agregar campo | MED | Informar, continuar |
| publish_workflow, ejecutar con Apify, borrar datos, activar schedule | HIGH | ESPERAR OK de Dario |

## Decisiones tomadas (no re-discutir)
Ver [[decisiones/index]] para la lista completa.

## Umbral clustering
- Similitud: **0.82**
- Mínimo signals: **5**
- Fuentes distintas: **2**

## Motor Diario
- **Modelo**: Gemini 2.5 Flash — NO cambiar a Claude ni ChatGPT
- **Costo**: $0 por corrida
- **thinkingBudget**: 0 (obligatorio — sin esto Gemini piensa y consume tokens)
- **maxOutputTokens**: 65.536

## Schedules
- **NINGUNO activado** hasta que Dario dé OK definitivo para el sistema completo
