# MAKO DIARIO ESTRATÉGICO v1.0
## ESPECIFICACIÓN DEL PRODUCTO FINAL

---

## PROPÓSITO

El Diario Estratégico es el producto final de MAKO.

**No es un informe de datos.**
**Es un mentor que enseña a ver el mercado.**

No le dice a Darío "vendé esto" y listo. Le explica qué está pasando, por qué está pasando, qué significa para su negocio, y qué hacer con esa información. Con el tiempo, Darío no va a necesitar que nadie le diga qué vender — va a saber detectarlo solo porque el Diario le enseñó a observar.

Cada dato del Diario incluye tres capas:
1. **El dato** — qué pasó
2. **La explicación en criollo** — por qué pasó, qué significa
3. **La señal** — qué hacer con eso

---

## CADENCIA Y COSTO

- Se genera cada 15 días
- Costo por corrida: ~$15 USD en datos (SerpAPI + Apify)
- Cada corrida acumula sobre la anterior — los insights mejoran solos con el tiempo
- Nunca repite el mismo análisis: compara, detecta cambios, actualiza el diagnóstico

---

## CAPITAL AWARENESS — REGLA TRANSVERSAL

**El Diario siempre sabe cuánto capital tiene Darío disponible.**

Este dato se configura al inicio de cada corrida y filtra automáticamente TODAS las recomendaciones. Ninguna sugerencia de producto puede superar el 60% del capital disponible (el resto es para envíos, contingencias y margen de operación).

| Capital disponible | Rango de productos recomendados |
|-------------------|---------------------------------|
| ≤ $300 USD | Solo productos con stock inicial posible dentro de ese monto |
| $300 – $1.000 USD | Rango medio, más opciones |
| $1.000+ USD | Sin restricción de mínimos de compra |

**Principio de escalabilidad progresiva:**
Empezar con productos chicos de alta rotación → hacer el dinero → reinvertir → escalar.
El sistema nunca le va a recomendar a Darío un producto que no pueda afrontar hoy.

---

## CÓMO CRECE CON EL TIEMPO

| Corrida | Qué agrega |
|---------|-----------|
| 1 | Baseline. Primeros patrones. Sin comparativa aún. |
| 2 | Primera comparativa. Tendencias que se confirman o se caen. |
| 3 | Patrones firmes. Señales cruzadas de múltiples fuentes. |
| 6+ | Historia acumulada. Recomendaciones mucho más precisas. |

Cada edición referencia la anterior:
*"En el Diario anterior recomendé X. Hoy los datos muestran: [actualización]."*

---

## LOS 15 MÓDULOS

---

### BLOQUE 1 — CONTEXTO
*Entender el terreno antes de jugar*

---

#### MÓDULO 1: Pulso económico AR en criollo

**Qué muestra:** El estado de la economía argentina del período, traducido a lenguaje comercial real.

**Contenido:**
- Inflación del período: cómo afecta al precio de compra y al poder del consumidor
- Tipo de cambio: impacto en productos importados vs nacionales
- Restricciones de importación vigentes: qué se puede traer y qué no
- Cambios de AFIP / Aduana del período que afecten al e-commerce
- Cualquier noticia económica relevante para el comercio online

**Formato:** Párrafos cortos, sin tecnicismos. Orientado a tomar decisiones, no a informar.

**Fuente de datos:** RSS noticias económicas AR + AFIP + Aduana

---

#### MÓDULO 2: Comportamiento del consumidor argentino

**Qué muestra:** Cómo está gastando (o no gastando) el argentino hoy, y en qué.

**Contenido:**
- ¿Está comprando o ahorrando? ¿Por qué?
- Categorías donde el argentino NO corta el gasto aunque le falte plata
- Cambios de preferencia detectados: qué dejó de comprar, qué empezó
- Ticket promedio por categoría: qué precio está dispuesto a pagar hoy

**Por qué importa:** Vender en Argentina requiere entender que el consumidor toma decisiones distintas según el contexto económico. Este módulo da el mapa de esas decisiones.

**Fuente de datos:** Google Trends + datos CACE + noticias de consumo

---

### BLOQUE 2 — NICHOS
*El mapa del mercado*

---

#### MÓDULO 3: Nichos que subieron

**Qué muestra:** Los nichos con señales positivas en el período, comparados con períodos anteriores.

**Formato:**

| Nicho | Esta semana | Hace 1 semana | Hace 1 mes | Hace 3 meses | Tendencia |
|-------|------------|---------------|------------|--------------|-----------|
| ...   | ...        | ...           | ...        | ...          | ↑         |

**Incluye explicación:** Por qué subió (estacionalidad, evento externo, tendencia cultural, contexto económico).

**Señal para Darío:** Si un nicho sube 3 períodos seguidos → tendencia real, no burbuja.

---

#### MÓDULO 4: Nichos que bajaron

**Qué muestra:** Los nichos con señales negativas. Mismo formato que Módulo 3.

**Incluye señal de causa:** Saturación de mercado / baja demanda estacional / impacto económico / moda pasajera.

**Señal para Darío:** Caída en 2 períodos seguidos → señal de salida o de no entrada.

---

#### MÓDULO 5: Nichos estables

**Qué muestra:** Los nichos que se mantienen sin importar el contexto económico. Son la base segura para empezar.

**Contenido por nicho:**
- Nivel de competencia actual (cuántos vendedores activos)
- Ticket promedio en MercadoLibre
- Barrera de entrada estimada (capital mínimo para competir)
- Por qué es estable (consumo básico / sin sustituto / hábito instalado)

---

### BLOQUE 3 — PRODUCTOS
*La oportunidad concreta*

---

#### MÓDULO 6: Productos que se mantienen (y por qué)

**Qué muestra:** Productos con demanda estable período tras período.

**Contenido por producto:**
- Rango de precio en MercadoLibre
- Nivel de competencia
- Razón de estabilidad

**Por qué importa:** Estos productos son seguros para empezar. Menos emocionantes pero más predecibles.

---

#### MÓDULO 7: Productos que bajaron (señal de salida)

**Qué muestra:** Productos cuya demanda cayó este período.

**Contenido:** Qué bajó, por qué bajó (saturación / fin de temporada / producto reemplazado / tendencia terminada).

**Señal para Darío:** No entrar. Si ya se está, evaluar salida o diferenciación.

---

#### MÓDULO 8: Productos nuevos del período

**Qué muestra:** Productos que aparecieron o empezaron a crecer esta quincena.

**Diferenciación clave:**
- **Nuevo de moda (burbuja):** Muchos vendedores entraron de golpe. Alta competencia inmediata. Riesgo.
- **Nuevo con sustento (tendencia real):** Pocos vendedores todavía. Demanda creciendo. Oportunidad.

**Señal para Darío:** Cuántos vendedores ya entraron es el indicador más importante. Pocos vendedores + demanda creciendo = ventana de oportunidad abierta.

---

#### MÓDULO 9: Productos estacionales

**Qué muestra:** Qué se viene en los próximos 30–60 días por temporada o evento.

**Incluye:**
- Producto / categoría
- Fecha estimada de pico de demanda
- Cruce con histórico: "El año pasado esto explotó en esta semana"
- Capital y stock necesario para estar listo a tiempo

**Señal para Darío:** La anticipación es la ventaja. Quien tiene stock cuando el producto explota, gana. Quien llega tarde, pelea con precio.

---

### BLOQUE 4 — VOZ DEL MERCADO
*Lo que la gente dice sin filtro*

---

#### MÓDULO 10: Quejas y frustraciones de compradores

**Qué muestra:** Qué critica la gente en MercadoLibre, TikTok y redes sobre productos y vendedores de los nichos del período.

**Formato:**
*"La gente que compra [producto X] se queja de [problema Y]"*

**Por qué es el módulo más valioso:**
Cada queja es una oportunidad disfrazada. Quien resuelve lo que los demás no resuelven, gana sin pelear por precio.

**Ejemplos de cómo usar esto:**
- "Se quejan de que llega tarde" → vender con envío rápido y destacarlo en el título
- "Se quejan de calidad baja" → conseguir proveedor mejor y marcarlo explícitamente en la descripción
- "Se quejan de falta de instrucciones en español" → incluir manual traducido

**Fuente de datos:** Reseñas negativas de MercadoLibre + comentarios de TikTok + redes sociales

---

### BLOQUE 5 — PROVEEDORES
*Con quién trabajar*

---

#### MÓDULO 11: Directorio de proveedores del período

**Qué muestra:** Proveedores relevantes para los nichos y productos detectados en este Diario.

**Tipos incluidos:**
- Mayoristas locales argentinos
- Distribuidores nacionales con representación de marcas
- Importadores locales que traen de afuera (China, Brasil, etc.)

**Campos por proveedor:**

| Campo | Descripción |
|-------|-------------|
| Nombre / Razón social | Nombre comercial y legal si se conoce |
| Tipo | Mayorista / Distribuidor / Importador |
| Categorías | Qué productos maneja |
| Ubicación | Ciudad, provincia |
| Contacto | Teléfono, WhatsApp, email, web, Instagram |
| Precio mayorista | Estimado cuando disponible |
| Mínimo de compra | Cantidad o monto mínimo para comprar |
| Fuente | Dónde se encontró esta info |

**Criterio de prioridad:** Primero los que tienen mínimos de compra bajos (etapa actual de Darío). A medida que escala, se agregan proveedores de mayor volumen.

---

### BLOQUE 6 — INTELIGENCIA ESTRATÉGICA
*Lo que los datos dicen y nadie más ve*

---

#### MÓDULO 12: Puntos ciegos del mercado

**Qué muestra:** Análisis cruzado de todo el Diario. Hallazgos que no son obvios mirando cada módulo por separado.

**Formato:**
*"Darío, mirá esto: [hallazgo] → [qué hacer con eso]"*

**Ejemplos de puntos ciegos:**
- "Nicho X crece (Módulo 3) pero nadie está vendiendo con buena presentación (Módulo 10) → entrar con branding diferente es la ventaja"
- "Producto Y tiene muchas quejas de calidad (Módulo 10) y solo 3 vendedores con buenas reseñas (Módulo 6) → hay espacio para uno más que lo haga bien"
- "La gente busca Z en Google Trends (Módulo 3) pero hay poca oferta en MercadoLibre (Módulo 8) → demanda sin oferta = oportunidad directa"

**Este módulo es donde MAKO muestra inteligencia real.** No es sumar datos — es cruzarlos.

---

#### MÓDULO 13: Recomendación ALTO índice de entrada

**El producto más sólido del período para entrar YA.**

Todo filtrado por el capital disponible de Darío (Capital Awareness).

**Ficha completa:**

| Campo | Detalle |
|-------|---------|
| Producto | Nombre y categoría |
| Por qué ahora | Datos específicos que respaldan la recomendación |
| Precio de venta | Rango en MercadoLibre hoy |
| Precio mayorista | Estimado según proveedor del Módulo 11 |
| Margen estimado | % después de comisiones, envío e impuestos |
| Capital mínimo | Para arrancar con stock inicial viable |
| Proveedor recomendado | Del Módulo 11, con info de contacto |
| Qué se quejan (Módulo 10) | Qué problema resolver para diferenciarse |
| Competencia actual | Cuántos vendedores, quién domina, cómo entrar |
| Señal de salida | Cuándo este producto deja de ser recomendable |

---

#### MÓDULO 14: Recomendación MEDIO índice de entrada

**Producto con potencial pero con algún condicionante.**

Mismo formato que Módulo 13, más:
- Explicación clara del condicionante (más competencia / más capital necesario / momento estacional no ideal)
- Cuándo pasa a ser ALTO: qué señal hay que esperar para entrar

---

#### MÓDULO 15: Recomendación AÚN NO (y cuándo sí)

**Producto atractivo que los datos muestran como interesante pero que no es el momento.**

| Campo | Detalle |
|-------|---------|
| Producto | Nombre y categoría |
| Por qué no ahora | La razón específica: capital, saturación, regulación, estacionalidad |
| Cuándo sería el momento | Qué tiene que cambiar para que sea recomendable |
| Qué monitorear | La señal que indica que el momento llegó |

**Por qué incluir este módulo:** Evitar errores de inversión es tan valioso como encontrar oportunidades. Este módulo entrena a Darío a tener paciencia estratégica.

---

## ESTRUCTURA DEL DIARIO (orden de lectura)

```
PORTADA
  Edición N° / Período / Fecha de generación / Capital configurado

BLOQUE 1: CONTEXTO
  Módulo 1 — Pulso económico AR
  Módulo 2 — Comportamiento del consumidor

BLOQUE 2: NICHOS
  Módulo 3 — Nichos que subieron
  Módulo 4 — Nichos que bajaron
  Módulo 5 — Nichos estables

BLOQUE 3: PRODUCTOS
  Módulo 6 — Productos estables
  Módulo 7 — Productos que bajaron
  Módulo 8 — Productos nuevos
  Módulo 9 — Productos estacionales

BLOQUE 4: VOZ DEL MERCADO
  Módulo 10 — Quejas y frustraciones

BLOQUE 5: PROVEEDORES
  Módulo 11 — Directorio del período

BLOQUE 6: INTELIGENCIA ESTRATÉGICA
  Módulo 12 — Puntos ciegos
  Módulo 13 — Recomendación ALTO índice
  Módulo 14 — Recomendación MEDIO índice
  Módulo 15 — Recomendación AÚN NO

REFERENCIA A EDICIÓN ANTERIOR
  Qué cambió respecto al Diario previo
```

---

## FUENTES DE DATOS QUE ALIMENTAN EL DIARIO

| Módulo | Fuente principal |
|--------|-----------------|
| 1, 2 | RSS noticias económicas AR + CACE + CAME |
| 3, 4, 5 | Google Trends AR + MercadoLibre (Apify) + TikTok/Instagram |
| 6, 7, 8, 9 | MercadoLibre (Apify) + Google Trends AR |
| 10 | Reseñas MercadoLibre + comentarios TikTok/Instagram |
| 11 | Web scraping de directorios de proveedores + datos CAME |
| 12–15 | Cruce inteligente de todos los módulos anteriores (IA) |

---

## PRINCIPIO DE DISEÑO

**MAKO no acumula datos. MAKO reduce incertidumbre.**

El Diario no existe para mostrar que el sistema recolectó mucha información.
Existe para que Darío pueda tomar una decisión comercial mejor en los próximos 15 días.

Si el Diario no ayuda a tomar una decisión → el Diario falló.

---

**ESTADO: CONGELADO**
**Versión: 1.0 — Reconstruido en sesión del 18/06/2026**
