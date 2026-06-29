---
type: estrategia
date: 2026-06-29
tags: [gap, competencia, ecommerce-ar, mako]
---

# Cobertura E-commerce Argentina — Auditoría MAKO

## Las 5 preguntas clave del negocio

| Pregunta | Fuentes MAKO | Estado |
|----------|-------------|--------|
| ¿Qué quiere comprar la gente? | Google Trends + ML Productos + TikTok/Instagram | ✅ Cubierto |
| ¿Cuánto están pagando hoy? | ML Reviews + price_snapshots (AliExpress + Google Shopping) | ✅ Cubierto |
| ¿De dónde sourcea el producto? | AliExpress + Comtrade (China→AR) + Proveedores Google Maps | ✅ Cubierto |
| ¿Qué dice el contexto del mercado? | RSS económico + Institucional (CACE, Tiendanube, BCRA) | ✅ Cubierto |
| ¿Qué están haciendo los competidores? | ❌ Nadie cubre esto | **GAP CRÍTICO** |

## El GAP: Análisis de Competencia Directa

**El problema:** MAKO sabe que hay demanda de un producto y que existe en AliExpress a X precio. Pero no sabe si el mercado en ML ya está saturado de competidores con buena reputación y precios imbatibles.

**La diferencia que falta:**
- "hay demanda de esto" → señal de oportunidad
- "hay demanda *y* el mercado está poco servido" → oportunidad real

Sin competencia, MAKO puede señalar algo que ya explotaron 50 vendedores con millones de ventas.

## Qué habría que agregar

Módulo de Competencia ML:
- Scraping de vendedores activos en ML por categoría
- Métricas por vendedor: cantidad de publicaciones, reputación, precio promedio, volumen estimado
- Identificar nichos con alta demanda + baja competencia o competencia débil
- Actor candidato: análisis de sellers en ML por categoría

## Fortaleza actual del sistema

Las 9 fuentes activas cubren demanda + sourcing + contexto:
- **Demanda real:** Trends (búsquedas) + ML (lo que se compra) + Social (lo que viraliza)
- **Precio:** price_snapshots acumula histórico → detecta tendencias con el tiempo
- **Sourcing dual:** AliExpress + Comtrade + Proveedores locales mayoristas
- **Contexto macro:** RSS + Institucional cruza oportunidades con realidad económica AR

## Estado de la decisión

🔴 **No avanzar sin consultar con Dario.** Agregar un módulo nuevo es decisión estratégica.
El GAP existe y está documentado. La solución propuesta es investigar actor Apify para análisis de sellers en ML.

Ver también: [[workflows/mercadolibre]] para el actor actual de productos ML.
