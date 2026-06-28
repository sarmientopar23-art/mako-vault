---
type: referencia
updated: 2026-06-28
---

# Skills disponibles — Inventario completo

Skills instaladas en `~/.claude/skills/`. Invocar con `/nombre-skill` en Claude Code.

---

## MAKO — Skills específicas del proyecto

| Skill | Cuándo invocar |
|-------|---------------|
| `/mako-sistema` | Al iniciar cualquier sesión MAKO — carga IDs, actores, arquitectura completa |
| `/supabase-mako` | Para queries SQL a la DB de MAKO — schema signals, clusters, reports |
| `/analisis-diario` | Después de generar un Diario — auditar calidad, detectar módulos débiles |
| `/ecommerce-ar` | Para calibrar el Diario con contexto del mercado argentino real |
| `/mako-status` | Estado rápido del sistema — workflows activos, señales, bugs, próximos pasos |

---

## n8n — Skills de construcción de workflows

| Skill | Cuándo invocar |
|-------|---------------|
| `/using-n8n-mcp-skills` | **SIEMPRE primero** en cualquier tarea n8n — routea a la skill correcta |
| `/n8n-agents` | Construir agentes IA con LangChain, AI Agent nodes, tool calling |
| `/n8n-code-javascript` | Escribir Code nodes en JS — acceso a $json, $items, crypto, helpers |
| `/n8n-code-python` | Escribir Code nodes en Python |
| `/n8n-error-handling` | Manejo de errores en workflows — try/catch, fallbacks, error outputs |
| `/n8n-expression-syntax` | Expresiones `{{ }}` — errores comunes, acceso a nodos previos |
| `/n8n-mcp-tools-expert` | Usar las herramientas MCP de n8n desde Claude (search, validate, create) |
| `/n8n-node-configuration` | Configurar nodos específicos — gotchas por tipo de nodo |
| `/n8n-subworkflows` | Diseñar sub-workflows, Execute Workflow node, patrones de encadenamiento |
| `/n8n-validation-expert` | Validar workflows antes de publicar — catálogo de errores falsos positivos |
| `/n8n-workflow-patterns` | Patrones: HTTP API, scheduled tasks, webhook, database operations |
| `/n8n-binary-and-data` | Manejo de binarios, imágenes, PDFs en n8n |
| `/n8n-code-tool` | Code nodes como herramientas de agentes IA |

---

## Apify — Skills de scraping cloud

| Skill | Cuándo invocar |
|-------|---------------|
| `/apify-ultimate-scraper` | Scraping de cualquier plataforma — Instagram, TikTok, Google Maps, etc. |
| `/apify-actor-development` | Crear o modificar actores Apify desde cero |
| `/apify-actorization` | Convertir código existente en Actor de Apify |
| `/apify-google-trends` | Actor específico para Google Trends via Apify |
| `/apify-mercadolibre-ar` | Investigar precios de autos en ML Argentina (skill especializada) |

---

## Ingeniería y arquitectura

| Skill | Cuándo invocar |
|-------|---------------|
| `/senior-data-engineer` | Diseño de pipelines, modelado de datos, arquitectura de datos |
| `/sql-pro` | Queries SQL complejas, optimización, patrones avanzados |
| `/postgres-pro` | PostgreSQL específico — pgvector, índices, extensiones |
| `/prompt-architect` | Diseñar prompts efectivos para Gemini/Claude — frameworks CoT, CO-STAR |
| `/javascript-pro` | JavaScript avanzado fuera de n8n |
| `/api-designer` | Diseño de APIs REST |
| `/debugging-wizard` | Debug sistemático de problemas complejos |

---

## Claude Code — Skills del entorno

| Skill | Cuándo invocar |
|-------|---------------|
| `/karpathy-guidelines` | Guías de Karpathy para usar Claude Code efectivamente |
| `/resume` | Cargar contexto MAKO al inicio de cada sesión |
| `/save` | Guardar sesión actual en el vault |

---

## Regla de uso

**Siempre invocar `/using-n8n-mcp-skills` antes de cualquier tarea n8n** — es el skill que routea y previene errores silenciosos.

**Para tareas MAKO:** `/mako-sistema` al iniciar + skill específica según la tarea.

Para n8n con IA: `/n8n-agents` cubre todo LangChain, AI Agent, tool calling.
