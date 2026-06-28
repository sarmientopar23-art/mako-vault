# MAKO CORE v1.0
## ARQUITECTURA FUNDAMENTAL

---

## PROPÓSITO

**MAKO es un sistema de reducción de incertidumbre comercial.**

No predice el futuro.
Detecta señales tempranas → transforma en conocimiento estructurado → genera oportunidades accionables antes de que sean evidentes para el mercado.

**Producto final:** Diario Estratégico

---

## FUENTE DE VERDAD

La fuente de verdad absoluta de MAKO es **la base de datos**.

No la IA.
No los workflows.
No los operadores.
No las interfaces.

**Regla:** Toda decisión relevante debe quedar persistida y auditada en base de datos.

Si una decisión no puede reconstruirse desde la base de datos, MAKO falla.

---

## ENTIDADES FUNDAMENTALES

### SIGNAL
- **Unidad mínima del sistema**
- Evidencia de mercado detectada en fuente externa
- Un hecho, no una conclusión
- Orígenes: redes sociales, búsquedas, marketplaces, foros, medios, fuentes futuras

### CLUSTER
- **Conjunto de Signals relacionados semánticamente**
- Representa un fenómeno emergente
- Primera capa de inteligencia real del sistema

### OPPORTUNITY
- **Interpretación accionable derivada de Clusters**
- Posible oportunidad comercial
- Hipótesis estructurada respaldada por evidencia
- **No es recomendación automática**

### REPORT
- **Materialización del conocimiento generado**
- Forma principal: Diario Estratégico
- **Inmutables — nunca se modifican**

---

## FLUJO FUNDAMENTAL

```
INPUT
  ↓
SIGNALS
  ↓
CLUSTERS
  ↓
OPPORTUNITIES
  ↓
DIARIO ESTRATÉGICO
```

El sistema existe para transformar ruido en oportunidades.

---

## REGLAS DE CLUSTERING

Un Cluster nace cuando existe evidencia suficiente.

**Criterios mínimos iniciales:**
- 5 Signals mínimo
- Ventana máxima: 7 días
- 2 fuentes distintas mínimo
- Similitud semántica base: 0.82

Estos valores evolucionan mediante **versionado**, nunca sobrescritura.

---

## REGLAS DE OPORTUNIDAD

- Las oportunidades **nacen desde Clusters**, no directamente desde Signals
- Toda Opportunity debe ser trazable hasta Signals originales
- Toda Opportunity conserva: origen, timestamp, versión de scoring, versión de clustering, evidencia utilizada

---

## VERSIONADO

**Principio absoluto: Nada se sobrescribe. Todo se versiona.**

Aplica a:
- Scoring
- Prompts
- Embeddings
- Clustering
- Reportes
- Oportunidades

Toda versión anterior permanece disponible para auditoría.

---

## EMBEDDINGS

- Los embeddings nunca se reemplazan
- Nuevas versiones conviven con anteriores
- Cada proceso declara explícitamente qué versión utiliza
- Decisiones históricas deben poder reconstruirse usando versión original

---

## FEEDBACK

- Se captura
- **No modifica automáticamente el sistema**
- Alimenta futuras versiones
- Nunca altera la historia

Toda mejora derivada de feedback requiere:
1. Evidencia agregada
2. Validación
3. Nueva versión

---

## REGRESSION TESTING

- Ninguna versión entra en producción sin validación
- Toda mejora debe demostrar que no rompe comportamientos previos
- Casos de prueba históricos son parte permanente del sistema

---

## GOBERNANZA

- La IA puede **proponer**
- Los workflows pueden **ejecutar**
- La base de datos **persiste**
- La arquitectura **define**

Ninguna capa individual posee autoridad absoluta.

---

## PRINCIPIO DE DISEÑO

**MAKO no acumula datos. MAKO reduce incertidumbre.**

La calidad de una salida siempre tiene prioridad sobre la cantidad de información procesada.

---

## OBJETIVO FINAL

Convertir grandes volúmenes de información dispersa en un Diario Estratégico capaz de mostrar:

- Fenómenos emergentes
- Cambios de comportamiento
- Oportunidades comerciales
- Riesgos potenciales
- Señales anticipatorias

**Antes de que sean evidentes para el mercado general.**

---

**ESTADO: CONGELADO**
