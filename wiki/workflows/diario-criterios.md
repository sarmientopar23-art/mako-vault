---
type: reference
updated: 2026-06-28
related: ["workflows/diario", "errores/index"]
---

# Criterios de Calidad — Diario Estratégico MAKO

Un Diario de calidad no es el que se genera sin errores. Es el que Dario puede usar para tomar decisiones reales de compra.

---

## Criterio 1: Completitud de módulos

El Motor Diario debe generar los 15 módulos. Un Diario incompleto es inutilizable.

| Check | Qué verificar |
|-------|---------------|
| M1–M3 | Resumen ejecutivo + contexto de mercado presentes |
| M4–M6 | Al menos 3 oportunidades HIGH con nombre de producto específico |
| M7–M9 | Al menos 5 oportunidades MEDIUM |
| M10 | Señales emergentes (tendencias que aún no son masivas) |
| M11 | Directorio de proveedores (nombre, teléfono, ciudad) |
| M12 | Contexto macro AR (tipo de cambio, inflación, contexto) |
| M13–M14 | Candidatos HIGH/MEDIUM con campo `local_supplier` completado |
| M15 | Próximos pasos para Dario — accionables específicos |

**Síntoma de falla**: Diario N°7 generó 3 llamadas Gemini en vez de 1 → secciones duplicadas o faltantes.

---

## Criterio 2: Diversidad de categorías

Un Diario de calidad NO puede tener los mismos productos repetidos.

| Malo ❌ | Bueno ✅ |
|---------|---------|
| 5 oportunidades de ropa infantil | Ropa infantil + electrónica + hogar + fitness + mascotas |
| Misma keyword en M4 y M13 | Candidatos distintos en cada módulo |
| Repite productos del Diario anterior | Productos nuevos o con ángulo distinto |

**Regla práctica**: si más del 40% de las oportunidades HIGH/MEDIUM son de la misma categoría, el Diario falla diversidad.

---

## Criterio 3: Trazabilidad completa

Cada oportunidad debe poder rastrearse hasta su origen.

```
Opportunity → Cluster → Signals → Fuente original
```

**Verificación rápida en Supabase:**
```sql
-- ¿La oportunidad tiene cluster_id?
SELECT id, titulo, cluster_id FROM opportunities WHERE cluster_id IS NULL;

-- ¿El cluster tiene mínimo 5 signals de 2 fuentes distintas?
SELECT cluster_id, COUNT(*) as signals, COUNT(DISTINCT fuente) as fuentes
FROM cluster_signals cs JOIN signals s ON cs.signal_id = s.id
GROUP BY cluster_id HAVING COUNT(*) < 5 OR COUNT(DISTINCT fuente) < 2;
```

Si hay oportunidades sin cluster_id → el Diario saltó la cadena. Inválido.

---

## Criterio 4: Capital awareness

Ninguna recomendación puede superar el límite de capital de Dario.

```
capitalLimitUsd = floor((capitalArs / blueRate) * 0.6)
```

**Check**: en cada candidato HIGH, el precio estimado de compra mayorista debe estar dentro del límite. Si no hay precio → el candidato no es accionable.

---

## Criterio 5: Accionabilidad

El Diario es una herramienta de decisión, no un informe académico.

| Accionable ✅ | No accionable ❌ |
|-------------|-----------------|
| "Reposteros de silicona: proveedor en Liniers, $8.500 c/u mayorista, margen estimado 180%" | "Existe demanda creciente de productos de repostería" |
| Nombre de producto + precio referencial + fuente de compra | Solo categoría genérica |
| Proveedor con teléfono o dirección | "Buscar en MercadoLibre" |

---

## Criterio 6: Frescura — sin repetición del Diario anterior

El sistema debe detectar si una oportunidad ya fue recomendada.

**Verificar antes de generar el Diario:**
```sql
SELECT titulo FROM opportunities 
WHERE corrida_id = (SELECT id FROM corridas ORDER BY created_at DESC LIMIT 1 OFFSET 1)
```

Si el Motor repite las mismas oportunidades → el clustering no está diferenciando bien entre corridas. Revisar ventana temporal de signals.

---

## Criterio 7: Registro de IA

Toda llamada a Gemini debe quedar registrada.

| Campo | Dónde se guarda |
|-------|-----------------|
| modelo | `ai_calls.modelo` |
| versión | `ai_calls.version` |
| prompt (hash) | `ai_calls.prompt_hash` |
| timestamp | `ai_calls.created_at` |
| corrida_id | `ai_calls.corrida_id` |

Si hay secciones del Diario sin `ai_call_id` asociado → trazabilidad rota.

---

## Score rápido de calidad (0–100)

| Criterio | Peso | Cómo medir |
|----------|------|------------|
| Completitud de módulos | 25 pts | ¿Están los 15 módulos? |
| Diversidad de categorías | 20 pts | ¿Menos del 40% en una sola categoría? |
| Trazabilidad | 20 pts | ¿Todas las oportunidades tienen cluster_id? |
| Accionabilidad | 20 pts | ¿Cada HIGH tiene precio + proveedor? |
| Frescura | 10 pts | ¿Menos del 30% repetido del Diario anterior? |
| Registro IA | 5 pts | ¿Todas las llamadas Gemini registradas? |

**Umbral mínimo aceptable: 70/100**
Diario N°7 estimado: ~55/100 (falla en completitud por 3 llamadas Gemini fragmentadas)

---

## Cómo usar este documento

Después de cada corrida, correr el skill `/analisis-diario` que audita el Diario generado contra estos criterios y devuelve el score + lista de problemas.

Si el score es < 70 → no publicar el Diario a Dario. Relanzar el Motor con debug.
