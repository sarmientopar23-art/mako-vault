---
type: decisions
updated: 2026-06-27
confidence: high
---

# Decisiones tomadas — no re-discutir

## Arquitectura
- **n8n es orquestador** — nunca almacena ni calcula similitud
- **Supabase es la fuente de verdad absoluta** — todo va ahí
- **Módulos 100% independientes** — ninguno espera que otro termine
- **Ciclo: cada 15-20 días** — el sistema corre completo y genera un Diario

## Fuentes de datos
- **Facebook**: EXCLUIDO definitivamente — no hay API confiable
- **API oficial MercadoLibre**: DESCARTADA (error 403) → usar Apify `karamelo~mercadolibre-scraper-espanol-castellano`
- **TikTok trends directo**: DESCARTADO (no soporta AR) → derivar de posts con regex
- **Comtrade**: endpoint `/public/v1/preview` sin API key

## Modelo de IA
- **Gemini 2.5 Flash**: motor del Diario — $0 por corrida. NO cambiar a Claude ni ChatGPT.
- **OpenAI text-embedding-3-small**: solo para Embeddings (credencial BNNRJaDhsx7ZnKxl)

## Costos
- **Apify STARTER $29/mes**: plan elegido por Dario
- **n8n Cloud 50 exec/mes**: plan actual — evaluar upgrade a Starter $20/mes
- **Presupuesto máximo**: ~$30/mes para correr el sistema completo

## Clustering
- Umbral: **0.82 similitud**, 5 signals mínimo, 2 fuentes distintas — NO cambiar sin evidencia

## Schedules
- **NINGUNO activado** hasta que Dario dé el OK final del sistema completo
- Los workflows se construyen y prueban manualmente primero

## Dario tiene autoridad final sobre
- Qué actores/fuentes usar
- Cuándo publicar workflows
- Cuándo activar schedules
- Cualquier decisión que cueste dinero
