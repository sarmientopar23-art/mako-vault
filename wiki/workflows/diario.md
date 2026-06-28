---
type: workflow
updated: 2026-06-27
confidence: high
related: ["[[sistema/pipeline]]", "[[errores/index]]"]
---

# Motor Diario v2.0

**ID n8n**: gpAW2laIPCEj19FI
**Estado**: ✅ ACTIVO — 27 nodos — versión 26d7b85e
**Modelo**: Gemini 2.5 Flash — $0 por corrida
**Credencial principal**: PEv3ZDOnsevtL9C1

## Arquitectura (27 nodos)
```
Code Init (lee parametros_corrida → capital dinámico)
→ HTTP Supabase (16 queries por fuente)
→ HTTP Supabase ML History (últimas 300 señales ML)
→ Code Compare Historico (M7/M8: precios históricos cross-run)
→ Code Build Fase 1 Prompt
→ HTTP Gemini Fase 1 → análisis JSON estructurado
→ IF Ralph Gate → (loop si calidad baja, max 3 intentos)
→ Code Validate + Capital + Score
→ Code Build Fase 2 Prompt
→ HTTP Gemini Fase 2 → 15 módulos
→ Code Parse Diario
→ HTTP Supabase INSERT reports
```

## Los 15 módulos del Diario
- M1-M2: Pulso económico + Comportamiento consumidor (RSS + Institucional)
- M3-M5: Nichos subieron / bajaron / estables (Trends + ML + Social)
- M6-M9: Productos estables / bajaron / nuevos / estacionales (ML + AliExpress)
- M10: Quejas y frustraciones (Reseñas + Social)
- M11: Directorio proveedores (Google Maps)
- M12-M15: Inteligencia estratégica

## Capital dinámico
- Defaults: capital=$700K ARS, min=$1K, max=$50K
- `capitalLimitUsd = floor((capitalArs / blueRate) * 0.6)`
- Panel de Control: `/form/mako-control-panel` (ID: JtSONgOXo0C2XbRl)

## Reglas del prompt (activas)
- R6: todos los precios en ARS, AliExpress como "USD X (ARS Y)"
- R7: porcentajes enteros 1-100 siempre con referencia
- R8: prohibido inventar métricas/siglas — cruce obligatorio proveedor-producto
- M9: calendario comercial AR 2026-2027 hardcodeado (9 fechas) con countdown

## Bug abierto — D1
Diario N°7 (3 llamadas Gemini, 15 módulos) tuvo calidad insatisfactoria.
Opciones: volver a 1 sola llamada con límite de palabras por módulo vs. mantener 3 llamadas y mejorar prompts.
**Pendiente decisión de Dario.**

## Diarios generados
| N° | Ejecución | Fecha | Resultado |
|----|-----------|-------|-----------|
| 1-3 | early | jun 2026 | Versiones iniciales |
| 4 | 24/06 | corrida completa | OK |
| 5 | exec 544 | 25/06 | Grade A, fix MAX_TOKENS |
| 6 | exec 545 | 26/06 | Grade A, 1 llamada, solo 5 módulos |
| 7 | exec 546 | 26/06 | 3 llamadas, 15 módulos, calidad insatisfactoria |
| 8 | 27/06 | post-review | 15 módulos, mejoras aplicadas |
| 9 | exec 551 | 28/06 | ✅ Grade A, Score 100, 4 HIGH + 2 MEDIUM, 3m26s |
