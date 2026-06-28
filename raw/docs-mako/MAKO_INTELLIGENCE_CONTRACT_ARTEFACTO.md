# MAKO INTELLIGENCE CONTRACT v1.2
## ESPECIFICACIÓN OPERATIVA

---

## MISIÓN

**MAKO existe para escuchar el comercio argentino de manera continua.**

Objetivo: Convertir señales dispersas del mercado en inteligencia comercial accionable.

**No es generar reportes.**

**Es producir inteligencia acumulativa** que permita detectar:
- Nichos emergentes
- Productos con potencial
- Tendencias de mercado
- Riesgos comerciales
- Oportunidades ejecutables
- Proveedores potenciales
- Cambios estructurales del comercio

MAKO ayuda a tomar mejores decisiones comerciales antes que la mayoría de participantes del mercado.

---

## PRODUCTO FINAL

**CARPETA OPERATIVA DE INTELIGENCIA COMERCIAL**

Cada edición debe permitir:
- Comprender qué está ocurriendo
- Detectar qué está cambiando
- Identificar oportunidades accionables
- Identificar riesgos
- Encontrar proveedores
- Priorizar acciones

**La inteligencia debe orientarse a ejecución comercial real.**

No alcanza con decir qué vender. Debe ayudar a comenzar a vender.

---

## UNIVERSO DE OBSERVACIÓN

MAKO observa permanentemente **siete áreas**.

### FRENTE 1: Productos
Detecta productos nuevos, variaciones, productos con potencial.

### FRENTE 2: Nichos
Identifica nichos emergentes, nichos saturados, oportunidades de nicho.

### FRENTE 3: Tendencias
Patrones de comportamiento, cambios de preferencia, movimientos de mercado.

### FRENTE 4: Proveedores
Proveedores nuevos, cambios en oferta, oportunidades de partnership.

### FRENTE 5: Contexto Económico Argentino
Contexto económico, legal, regulatorio, comercial de Argentina.

### FRENTE 6: Mercados Regionales
Observa: Argentina, Brasil, Chile, Uruguay, Paraguay.

**IMPORTANTE:** Las señales regionales NO generan oportunidades MAKO automáticamente.
Solo generan contexto anticipatorio.

Una señal regional se transforma en oportunidad MAKO **únicamente cuando aparece evidencia equivalente en señales argentinas**.

### FRENTE 7: Memoria Histórica MAKO
No es frente de observación.
Es capa transversal que alimenta todos los demás frentes.

---

## ENTIDADES PERSISTENTES

Toda inteligencia relevante se almacena como entidad persistente.

### Tipos de Entidades
- Nicho
- Producto
- Tendencia
- Proveedor
- Oportunidad

### Campos Obligatorios de Toda Entidad
```
- entity_id (único, permanente)
- nombre_canónico
- alias_detectados
- fecha_primera_detección
- estado_actual
- historial_de_estados
- fuentes_relacionadas
```

**Las entidades nunca pierden identidad histórica.**
El `entity_id` es permanente.

---

## ESTADOS DE ENTIDADES

### Estados Válidos
```
Emergente       → Acaba de aparecer, pocas señales
Creciendo       → Señales en aumento, tendencia positiva
Estable         → Plateau, estado consolidado
Debilitándose   → Señales en disminución
Declive         → Tendencia claramente negativa
```

---

## NACIMIENTO DE ENTIDADES

### Nicho / Producto / Oportunidad
Nacen cuando superan criterios mínimos definidos por MAKO Core.

### Tendencia
Nace cuando múltiples clusters relacionados muestran evolución consistente durante varios ciclos.

### Proveedor
Nace cuando existe evidencia de existencia comercial verificable + al menos un dato de contacto válido.

---

## ESTADOS DE OPORTUNIDADES

- **Observación:** Existe evidencia inicial
- **Confirmada:** Evidencia suficiente para considerarla accionable
- **Descartada:** La evidencia posterior invalida la hipótesis

---

## PRIORIDAD DE OPORTUNIDADES

Factores: intensidad de señales, velocidad de crecimiento, diversidad de fuentes, ventana temporal, viabilidad operativa.

---

## INTELIGENCIA ACUMULATIVA

Toda edición debe indicar: qué apareció, qué creció, qué se estabilizó, qué se debilitó, qué desapareció.

**MAKO no produce ediciones aisladas. Produce continuidad histórica.**

---

## RESPONSABILIDADES

- **Cloud Architect:** Define construcción, audita entregas, garantiza cumplimiento
- **IAs Ejecutoras:** Construyen componentes, implementan flujos
- **Darío:** Autoridad final, prioridades estratégicas, aprueba cambios estructurales

---

**ESTADO: CONGELADO**
