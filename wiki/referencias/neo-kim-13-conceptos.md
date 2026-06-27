---
type: referencia
updated: 2026-06-27
fuente: newsletter.systemdesign.one (@systemdesignone)
---

# Neo Kim — 13 conceptos de AI Engineering (2026)

Fuente original: newsletter de Neo Kim. Aplicados en el diseño de MAKO + este vault.

---

## 1. Vector Database
pgvector (<100K vectores) es suficiente. HNSW para escala mayor.
**MAKO**: confirma que pgvector en Supabase es la decisión correcta.

## 2. How RAG Works
RAG = Retrieve → Augment → Generate. Producción requiere multi-step (reformulación, reranking).
**MAKO**: confirma arquitectura embeddings → clustering.

## 3. Personal Chat Assistant
Privacidad, system prompts custom, prompt caching reducen costos.
**MAKO**: el vault es el "system prompt persistente" de Claude.

## 4. LLM Concepts
Context window, temperatura, embeddings, agentes vs workflows.
**MAKO**: base conceptual para decisiones de diseño.

## 5. How to Design an AI Agent
4 componentes: Brain + Hands (MCP) + Skills + Memory. Humano siempre en el loop para decisiones críticas.
**MAKO**: confirma que Dario tiene autoridad final — no automatizar `publish_workflow`.

## 6. Reinforcement Learning
RLHF: cómo Claude fue entrenado. Trial-and-error con feedback humano.
**MAKO**: instrucciones precisas en CLAUDE.md producen mejor comportamiento.

## 7. LLM Evals 101
No-determinismo, correctness fuzzy. MVP: 50 ejemplos golden + 1 heurística + 1 LLM judge.
**MAKO (futuro)**: evaluar calidad del Diario con golden set de referencia.

## 8. Context Engineering ← EL MÁS IMPORTANTE
"Más contexto ≠ mejores resultados."
Anatomy: System Prompt + History + Tools + External Data. Compaction para sesiones largas.
**MAKO**: hot.md lean (500 palabras max). Confirma pre-compact hook.
**Regla aplicada**: si agregar contexto no mejora la respuesta, no lo agregues.

## 9. AI Coding Workflow
Contexto primero, plan antes de código, pasos chicos.
Patrón: Read @README → Read @CLAUDE.md → tarea.
**MAKO**: define el patrón exacto de /resume al iniciar sesión.

## 10. Agentic Patterns
Escalation: Direct API → Workflow → Agent → Multi-agent. Start simple.
**MAKO**: confirma que n8n como orquestador con módulos independientes es el patrón correcto.

## 11. How AI Agents Work
PEAS: Performance + Environment + Actuators + Sensors. ReAct: Reason → Act → Observe → Repeat.
**MAKO**: /resume debe declarar qué tengo disponible y qué NO tocar.

## 12. Multi-Agent Architectures
Usar múltiples agentes solo si: overflow de contexto, paralelismo, o especialización.
**MAKO**: confirma independencia total de módulos. Pipeline RSS→Trends→ML→Diario.

## 13. How MCP Works
N×M → N+M. Tres capas: Hosts + Clients + Servers. Tres primitivos: Resources + Prompts + Tools.
**MAKO**: confirma obsidian-vault como MCP server adicional.

---

## BONUS — Artículo "Claude Folder" (#157)
- `.claude/` es el sistema operativo de Claude
- **CLAUDE.md: máximo ~200 líneas**
- Regla de oro: **"Si borrar una línea no cambia el comportamiento de Claude, bórrala"**
- Nunca commitear `settings.local.json` (tiene rutas locales)

---

## Lo que cambió en MAKO gracias a Neo Kim
1. CLAUDE.md del vault: lean (~80 líneas, no 500)
2. hot.md: exactamente 500 palabras de contexto, no más
3. /resume: carga 3 archivos en orden fijo (hot → index → última sesión)
4. Pre-compact hook: guarda checkpoint antes de comprimir contexto
5. Evaluación del Diario: agregar al roadmap (feature futura)
