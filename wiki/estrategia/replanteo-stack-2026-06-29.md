---
type: estrategia
date: 2026-06-29
tags: [replanteo, stack, n8n, python, arquitectura, decisión-crítica]
status: pendiente-decision
---

# Replanteo Estratégico — Stack y Dirección de MAKO

## Contexto de la sesión
Dario pidió un análisis crítico con abogado del diablo: ¿es n8n el tool correcto para MAKO?
Basado en investigación web, fuentes reales (Reddit, DEV.to, comparativas técnicas, competidores reales).

---

## LO QUE LA INVESTIGACIÓN REVELÓ

### 1. La competencia real ya existe y está bien financiada

| Tool | Qué hace | Escala |
|------|----------|--------|
| **Nubimetrics** | Inteligencia ML: mercado, competencia, mi negocio | 10TB/día, 200M+ productos, 18 países, 4000+ clientes (Samsung, Disney) |
| **Real Trends** | Inteligencia ML + gestión operativa | Argentina, Brasil, México |

**Lo crítico:** Estas herramientas YA hacen análisis de competidores en ML, tendencias, precios.
MAKO es diferente: cruza fuentes (TikTok + AliExpress + Comtrade + ML + Trends) para detectar oportunidades ANTES de que sean obvias. Eso es más ambicioso Y más diferente. 
**El problema no es el objetivo — es el tool.**

### 2. Lo que n8n hace bien vs. mal

**Bien:**
- Conectar APIs (webhooks, HTTP requests)
- Mover datos pequeños entre servicios
- Automatización de procesos de negocio
- Prototipado rápido de integraciones

**Mal — demostrado en producción en MAKO:**
- Loops con >50 items → OOM
- Lógica compleja → Code nodes que se vuelven insostenibles
- Análisis de datos → no es para eso
- Construir un producto → no es una plataforma de producto
- Debug → el modelo visual dificulta entender errores profundos
- Escala → single-threaded, memoria limitada en Cloud STARTER

**Cita exacta encontrada:** "n8n excels at flexible, mid-tier automation, but it's not a distributed orchestrator for petabyte-scale workloads."
"The most common failure point: memory overload when workflows hold >50 items or process large data."

### 3. Lo que la web muestra para market intelligence real

No n8n. Lo que usan los builders reales:
- **Scraping**: Apify / Scrapy / Python + proxies (ya lo tenemos en Apify ✅)
- **Base de datos**: Supabase/PostgreSQL + pgvector (ya lo tenemos ✅)
- **Procesamiento/análisis**: Python scripts (NO n8n)
- **Orquestación**: cron jobs, GitHub Actions, Prefect, o simplemente un scheduler Python
- **Producto**: Web app (Next.js + FastAPI) o dashboard (Streamlit para MVP)
- **IA/Embeddings**: OpenAI directo desde Python (ya lo tenemos vía API ✅)

### 4. El diagnóstico técnico real de MAKO

| Componente | Herramienta actual | Veredicto |
|------------|-------------------|-----------|
| Scraping cloud | Apify | ✅ Correcto. No cambiar. |
| Base de datos | Supabase + pgvector | ✅ Correcto. No cambiar. |
| Orquestación de llamadas API | n8n | ⚠️ Funciona pero es frágil |
| Lógica compleja / normalización | Code nodes en n8n | ❌ Incorrecto. Python es mejor aquí. |
| Embeddings | OpenAI desde n8n | ⚠️ Funciona con limite=100, muy frágil |
| Clustering | SQL en Supabase vía n8n | ✅ El SQL está bien, el trigger via n8n es innecesario |
| Generación del Diario | Gemini vía n8n | ⚠️ Funciona pero el prompt y contexto son limitados por el nodo |
| Output / Producto | Texto en n8n → OneDrive | ❌ No es un producto. Es un archivo. |

### 5. La pregunta que cambia todo

¿Qué es MAKO exactamente?

A) **Una herramienta para Dario solo** → el stack actual es over-engineered para un uso personal
B) **Un servicio/consultoría** → Dario vende el Diario como servicio a clientes → necesita producto
C) **Un SaaS/producto** → construir algo que otros paguen → necesita web app, auth, etc.

Según la conversación del 29/06: Dario quiere replantear si n8n es el camino o si hay otro stack (aplicación, herramienta, página web).

---

## CAMINOS POSIBLES (sin decidir aún)

### Camino A: Mantener n8n pero usarlo "correctamente"
**Solo para:** disparar Apify actors y hacer HTTP requests simples.
**Sacar de n8n:** toda la lógica Python (Code nodes) → mover a funciones cloud / scripts Python.
**Resultado:** n8n como dispatcher, Python como el cerebro.
**Costo de migración:** medio. Mantiene lo existente pero lo purga de complejidad.

### Camino B: Reemplazar n8n con Python puro
**Scheduler:** cron en VPS barato ($5/mes en Render o Railway) o GitHub Actions (gratis).
**Scripts Python:** reemplazan todos los Code nodes. Control total, debug fácil, escala.
**Mantener:** Apify + Supabase (100% compatible).
**Resultado:** más robusto, más barato ($0 adicional si usas GitHub Actions), más fácil de mantener.
**Costo de migración:** alto en tiempo. Hay que reescribir la lógica de 12 workflows.

### Camino C: Construir un producto real
**Stack:** FastAPI (Python) + Next.js + Supabase (ya existe) + Apify (ya existe).
**Que hace:** web app donde Dario (o clientes) ven el Diario en tiempo real, exploran señales, filtran por categoría.
**Diferencia de Nubimetrics:** datos cruzados (AliExpress + Comtrade + Social) que ellos no tienen.
**Costo:** 2-4 semanas de desarrollo con Claude Code. Infraestructura ~$20/mes (Vercel free + Railway $5).
**Resultado:** es un producto real, no un workflow.

### Camino D: Consultoría/servicio manual potenciado por IA
**Abandonar la automatización total.** Usar Claude directamente con acceso a Supabase para generar el Diario bajo demanda.
**Sin n8n, sin workflows.** Dario pide el análisis, Claude lo genera consultando Supabase.
**Costo:** $0 adicional. Solo el tiempo de generación.
**Limitación:** no escala si quiere vender a muchos clientes.

---

## PRÓXIMA DECISIÓN (para sesión nueva)

Antes de escribir una sola línea de código nuevo, Dario necesita responder:
1. ¿Para quién es MAKO? Solo para mí / para vender / para consultoría
2. ¿Cuánto tiempo tengo para invertir en el rediseño?
3. ¿Quiero que sea un producto web o una herramienta interna?

La respuesta a esas 3 preguntas determina el stack correcto.

---

## Fuentes reales consultadas
- [n8n vs Python 2026](https://www.searchcans.com/blog/build-ai-research-agent-n8n-vs-python-2026/)
- [n8n real limits production](https://dev.to/alifar/the-real-limits-of-n8n-free-automation-what-you-need-to-know-before-shipping-to-production-59o6)
- [Why n8n Isn't Python](https://growwstacks.com/blog/why-n8n-isnt-python)
- [Nubimetrics vs Real Trends](https://www.woosync.io/blog/nubimetrics-vs-real-trends-analisis-completo/)
- [Ecommerce market intelligence tools](https://extralt.com/blog/best-ecommerce-market-intelligence-tools)
- [Python + Supabase + FastAPI + Next.js](https://api.collegepressbox.com/blog/fastapi-next-js-and-supabase-a-powerful-trio-1764801459)
