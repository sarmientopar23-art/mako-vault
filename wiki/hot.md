---
type: hot-cache
updated: 2026-06-27
---

# Contexto reciente — MAKO (27/06/2026)

## Estado actual
Sistema MAKO completo y operativo. 13 workflows activos en n8n. 5.654+ señales en Supabase. 8 Diarios generados.

## Última sesión (27/06/2026)
- Review Diario N°8 con Dario — auditoría 11 problemas detectados
- Fix P11: filtro frescura TikTok/Instagram (descarta posts >60 días)
- Motor Diario: R6 (precios en ARS), R7 (porcentajes enteros), R8 (no inventar métricas)
- M9: calendario comercial AR 2026-2027 hardcodeado (9 fechas)
- Comparación histórica M7/M8 implementada (cross-run por entity_id)
- Inicio integración Claude Code + Obsidian (esta sesión)

## Pendiente urgente
- **Ralph Loop**: Motor Diario draft listo — espera OK de Dario para publicar
- **Bug D1**: Calidad Diario N°7 insatisfactoria — decidir arquitectura (1 llamada vs 3)
- **Social TikTok+IG**: tuvo 0 resultados en última corrida — investigar
- **n8n Starter $20/mes**: subir de 50 a 2500 ejecuciones

## Workflows activos (IDs clave)
- Trends: DC74ImsqVudt11xb ✅
- ML Productos: OZ4J5d3ClU4uAC79 ✅
- Motor Diario: gpAW2laIPCEj19FI ✅ (27 nodos, Gemini 2.5 Flash)
- Control Panel: JtSONgOXo0C2XbRl ✅

## Costos actuales
- Apify: ~$6.50/corrida | Presupuesto jun 2026: ~$87 USD
- n8n: 50 exec/mes | ~12 por corrida completa
- IA: $0 (Gemini 2.5 Flash gratis)

## Próximo paso recomendado
Continuar con módulo 3 (TikTok/Instagram) o resolver Bug D1 del Motor Diario.
