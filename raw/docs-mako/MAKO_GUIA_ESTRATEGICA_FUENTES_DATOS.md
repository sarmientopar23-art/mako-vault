# GUÍA ESTRATÉGICA — FUENTES DE DATOS MAKO
## Documento complementario al FIN DE TRABAJO
## Fecha: 15/06/2026
## Propósito: Orientar al próximo chat sobre todo lo discutido en la última parte de la sesión

---

# 0. PRINCIPIO FUNDACIONAL — LA EXTRACCIÓN DE INFORMACIÓN ES EL ALMA DE MAKO

> "La extracción de datos, es decir de información, es el alma de todo. Si podemos traer información de calidad, ahí vamos a apuntar."
> — Darío, 19/06/2026

Este principio está por encima de cualquier decisión técnica en MAKO:

- **Calidad sobre comodidad:** Si existe una fuente que entrega información más rica o más relevante para el e-commerce argentino, hay que evaluarla — aunque implique cambiar una herramienta.
- **Costo como criterio, no como veto:** El presupuesto objetivo es ~$30/mes para correr el sistema completo cada 15 días. Si una fuente vale la pena y entra en ese presupuesto, se usa.
- **Siempre consultar con Darío:** Cualquier decisión sobre fuentes de datos, cambio de proveedor o nueva herramienta de scraping se consulta primero. Nunca se cambia solo por cambiar.
- **Estabilidad como resultado:** El objetivo final es que MAKO corra con efectividad, sin modificaciones constantes. Cada fuente que se suma debe poder quedarse, no ser un parche temporal.
- **Supabase como beneficiario:** Cuanta más información de calidad y variedad entren, más cruce significativo puede hacer Supabase entre fuentes, y más certeros son los insights del Diario Estratégico.

---

# 1. POR QUÉ EXISTE ESTE DOCUMENTO

Hacia el final de la sesión, Darío planteó una preocupación central: el Módulo 1 (Google Trends) por sí solo es débil. MAKO necesita ser un sistema robusto que combine múltiples fuentes de datos desde el principio, no construir un módulo por vez de forma lenta.

Esta guía detalla exactamente qué se discutió, qué se decidió, y cómo tiene que construirse el sistema completo de captura de señales.

---

# 2. EL PROBLEMA QUE DARÍO IDENTIFICÓ

Darío señaló correctamente que:

- Google Trends solo mide curiosidad/búsqueda general, no intención de compra
- Un sistema de inteligencia comercial real necesita cruzar múltiples fuentes
- Los ecommerce de élite no usan una sola fuente de datos — combinan tendencias culturales, intención de compra, contexto económico y datos de proveedores
- MAKO no puede tardar dos años en ser útil — si está bien diseñado desde el principio, con suficiente volumen de señales por corrida, ya desde el primer mes y medio (3 corridas de 15 días) puede empezar a mostrar patrones firmes
- La cantidad de búsquedas por corrida es la variable clave: más búsquedas por corrida = más cruce de información = insights más certeros, no hace falta esperar años

**Conclusión de Darío:** No construir módulo por módulo de forma lenta. Diseñar TODOS los módulos de captura ahora, dejarlos funcionando en paralelo (cada uno como workflow independiente, todos por temporizador, sin depender uno del otro), y que cada uno se pueda corregir individualmente si falla sin tirar abajo el resto del sistema.

---

# 3. DECISIÓN SOBRE FACEBOOK

**Se investigó:** Facebook cerró su API pública de tendencias en 2018. No existe forma oficial ni semi-oficial confiable de extraer tendencias de Facebook hoy.

**Decisión tomada:** Facebook queda EXCLUIDO del stack de fuentes de MAKO. Darío fue explícito: "no pasa nada, no reneguemos, tampoco es tan importante". No se vuelve a evaluar esta fuente a menos que aparezca una vía de acceso nueva en el futuro.

---

# 4. EL MAPA COMPLETO DE FUENTES — QUÉ SE VA A CONSTRUIR

## 4.1 Resumen visual del ciclo de inteligencia

```
TikTok/Instagram → algo se viraliza culturalmente
        ↓
Google Trends → la gente empieza a buscarlo en general (YA OPERATIVO)
        ↓
Mercado Libre → la gente lo busca para COMPRAR (intención directa)
        ↓
Noticias económicas + Proveedores → contexto y oportunidad de abastecimiento
        ↓
MAKO cruza todo → OPORTUNIDAD ACCIONABLE con evidencia
        ↓
Diario Estratégico → "Esto es lo que tenés que vender este período"
```

## 4.2 Tabla completa de módulos a construir

| Módulo | Fuente | Estado | Costo | Prioridad |
|--------|--------|--------|-------|-----------|
| Módulo 1 | Google Trends Argentina (SerpAPI) | ✅ OPERATIVO | Gratis (250/mes) | Hecho |
| Módulo 2 | Mercado Libre (vía Apify scraper) | ❌ Por construir | $0.80/1000 resultados | ALTA |
| Módulo 3 | TikTok Trends Argentina (Apify) | ❌ Por construir | Créditos Apify existentes | ALTA |
| Módulo 3b | Instagram hashtags ecommerce AR (Apify) | ❌ Por construir | $0.016/hashtag | ALTA |
| Módulo 4 | RSS Noticias económicas | ❌ Por construir | Gratis | MEDIA |
| Módulo 4b | CACE / CAME / Aduana-AFIP / TradeMap (proveedores y contexto) | ❌ Por investigar y construir | Gratis (públicas) | MEDIA |
| Módulo 5 | Alibaba/1688 tendencias | ❌ Fase posterior | SerpAPI + Apify | BAJA (futuro) |
| Facebook | — | ❌ EXCLUIDO definitivamente | — | No aplica |

---

# 5. MERCADO LIBRE — LO QUE PASÓ Y LA DECISIÓN FINAL

## 5.1 Intento con la API oficial

Darío se registró en developers.mercadolibre.com.ar siguiendo la recomendación inicial de usar la API oficial gratuita de tendencias (`/trends/MLA`).

**Resultado:** Error 403 Forbidden al intentar acceder.

**Diagnóstico:** La ruta de developers de Mercado Libre tiene restricciones de acceso para el endpoint de tendencias que no estaban documentadas como bloqueantes, pero en la práctica impiden el acceso directo sin aprobación adicional o sin cumplir requisitos no explícitos de la plataforma. Esto confirma algo que Darío ya sabía por experiencia previa: la vía oficial de ML está fuertemente restringida.

## 5.2 Decisión final — Plan B confirmado

**Se descarta la API oficial de Mercado Libre.**

**Se adopta: scraper vía Apify.**

Específicamente el actor `ultramarine_freezer/meli` (Mercado Libre Full Product Scraper):
- Soporta 18 países incluyendo Argentina
- Más de 30 campos por producto (precio, descuentos, seller, ratings, reviews, imágenes, condición)
- Costo: $0.80 por cada 1000 resultados — sin necesidad de proxies
- Permite buscar por keyword O por URL directa

Darío fue explícito: "$0.80 por mil búsquedas no es nada, está bueno para que empiece a funcionar ya". Aceptación total de este costo como punto de partida.

## 5.3 Cómo va a funcionar el Módulo 2 en la práctica

1. Scrapear la página pública de tendencias de Mercado Libre Argentina (`mercadolibre.com.ar/tendencias`) para obtener la lista de búsquedas trending — esto NO requiere API, es una página pública.
2. Por cada keyword trending obtenida, usar el scraper de Apify para extraer los primeros productos de esa búsqueda específica (buscando por keyword, una de las dos modalidades que soporta el actor).
3. Extraer de cada producto: nombre, precio, categoría, cantidad de reviews, datos del vendedor, condición.
4. Normalizar y guardar todo en la tabla `signals` con `fuente = mercadolibre-argentina`.

**Estimación de volumen:** 50 keywords trending × 10 productos cada una = 500 señales de compra directa por corrida, a un costo aproximado de $0.40 por ejecución completa.

## 5.4 Pendiente para la próxima sesión sobre Mercado Libre

- Definir y configurar el actor exacto de Apify a usar (`ultramarine_freezer/meli` u otro equivalente si en la investigación en vivo se encuentra uno mejor)
- Conectar la cuenta de Apify de Darío a n8n (HTTP Request o credencial dedicada)
- Diseñar el workflow completo: obtención de keywords trending → scraping de productos → normalización → inserción en signals
- Es importante buscar, al momento de construir, "un buen rascador que busque por URL o por keyword" — palabras textuales de Darío, validando que el actor elegido cumpla ambas modalidades de búsqueda

---

# 6. TIKTOK — LO QUE SE INVESTIGÓ Y CÓMO SE VA A CONSTRUIR

## 6.1 Hallazgo de la investigación

No existe API pública oficial de TikTok para tendencias — la API oficial de TikTok está enfocada en publicación de contenido y gestión de cuenta, no en descubrimiento de tendencias.

Sin embargo, sí existe acceso legítimo a datos públicos de tendencias mediante scrapers especializados, particularmente el actor de Apify `clockworks/tiktok-trends-scraper`, que extrae datos directamente de "TikTok Trend Discovery" — un sitio público de TikTok que muestra qué está en tendencia, filtrable por país.

Este actor extrae: hashtags trending, canciones, creadores y videos — todo filtrado para Argentina.

## 6.2 Costo

Con el plan gratuito de Apify ($5 de crédito mensual), considerando que scrapers simples de tendencias cuestan entre $0.001 y $0.002 por página, se pueden hacer miles de extracciones mensuales sin costo adicional, usando los créditos que Darío ya tiene en su cuenta de Apify.

## 6.3 Cómo va a funcionar

- Workflow combinado con Instagram (ver punto 7), llamando a la API de Apify desde n8n vía HTTP Request
- Filtro por país: Argentina
- Resultado: hashtags virales, sonidos en tendencia, creadores destacados, videos top
- Cada hashtag/tendencia se normaliza como signal con `fuente = tiktok-argentina`

---

# 7. INSTAGRAM — LO QUE SE INVESTIGÓ Y CÓMO SE VA A CONSTRUIR

## 7.1 Hallazgo de la investigación

La API oficial de Meta para Instagram es extremadamente restringida desde 2018, requiere aprobación empresarial y cuenta de negocios verificada, con datos limitados incluso si se aprueba.

**Alternativa viable:** Apify tiene el actor `apify/instagram-hashtag-scraper`, que extrae posts públicos por hashtag sin necesitar login ni autenticación, con métricas de engagement completas (likes, comentarios, vistas, posts top).

## 7.2 Costo

$0.016 por hashtag, con los primeros 60 posts incluidos en ese precio. Esto significa que con $5 de crédito gratuito de Apify se pueden scrapear aproximadamente 300 hashtags por mes.

## 7.3 Hashtags específicos a trackear para MAKO

Definidos en la sesión:
- #mercadolibre
- #emprendedores
- #ecommercear
- #ventasonline
- #dropshippingargentina
- #emprendimientoar
- #negociosonline

## 7.4 Cómo va a funcionar

- Mismo workflow que TikTok (Módulo 3), ambos vía Apify, ambos llamados desde n8n con HTTP Request a la API de Apify
- Por cada hashtag de la lista, se extraen los posts/reels top
- Se normalizan como signals con `fuente = instagram-argentina`

---

# 8. NOTICIAS ECONÓMICAS Y CONTEXTO DE PROVEEDORES

## 8.1 Lo que Darío pidió explícitamente

Darío fue específico: en esta capa "nos vamos a tener que lucir" — buscar dónde realmente están los datos que usan los proveedores y las estadísticas que el común de la gente no conoce, porque "para eso está la IA".

## 8.2 Fuentes básicas (RSS, gratuitas, fáciles)

- El Cronista Comercial
- Infobae Economía
- Ámbito Financiero
- iProfesional

## 8.3 Fuentes especializadas para proveedores (más valiosas, requieren investigación más profunda en la próxima sesión)

- **CACE** (Cámara Argentina de Comercio Electrónico): publica estadísticas trimestrales oficiales sobre el ecommerce argentino — categorías que crecen, volúmenes de venta, comportamiento de compra
- **CAME** (Confederación Argentina de la Mediana Empresa): datos sobre pymes y comercio minorista
- **Aduana Argentina / AFIP**: declaraciones juradas de importación públicas — permite ver qué están importando las empresas argentinas, en qué volumen y de qué países, lo cual anticipa qué productos van a aparecer en el mercado antes de que lleguen a los marketplaces
- **TradeMap**: estadísticas internacionales de importación/exportación por categoría de producto aplicadas a Argentina

## 8.4 Pendiente para la próxima sesión

Investigar en profundidad, usando búsqueda web en vivo, exactamente qué endpoints, reportes descargables o páginas con estadísticas estructuradas ofrece cada una de estas cuatro fuentes (CACE, CAME, Aduana/AFIP, TradeMap), porque ninguna fue completamente mapeada todavía — quedó identificada la fuente pero no el método técnico exacto de extracción.

---

# 9. ALIBABA / 1688 — FASE FUTURA (NO INMEDIATA)

Se mencionó como módulo de fase posterior, no prioritario ahora:

**Lógica:** El 80% de los productos que se venden en Mercado Libre Argentina vienen de China. Lo que está en tendencia en Alibaba hoy llega al mercado argentino en 30-60 días. Trackear esto da una ventaja de anticipación significativa.

**Fuente probable:** SerpAPI Google Shopping combinado con un scraper de Alibaba vía Apify.

**Por qué no es prioritario ahora:** Darío priorizó primero tener el stack argentino completo (Google Trends + Mercado Libre + TikTok/Instagram + noticias) funcionando y generando valor antes de sumar esta capa internacional.

---

# 10. PRINCIPIO ARQUITECTÓNICO CONFIRMADO POR DARÍO

Cita textual de la decisión de Darío sobre cómo deben construirse los módulos:

"Los workflows van a estar todos por separado, no van a estar conectados, van a estar todos por un temporizador... si va a funcionar así por separado, ¿qué probabilidades tenemos de que haya tantos errores? Funcionó Mercado Libre, pero tenemos Google Trends. Si veo que no funcionó, lo puedo frenar yo mismo, lo corregimos, funciona, carga la base y que siga funcionando."

**Esto significa, en términos técnicos concretos para la próxima sesión:**

- Cada módulo (1, 2, 3, 4) es un workflow 100% independiente en n8n
- Ninguno depende de que otro haya terminado para ejecutarse
- Si Mercado Libre falla, Google Trends sigue corriendo sin problema
- Si TikTok falla, las noticias económicas se siguen capturando
- Darío puede frenar manualmente cualquier módulo individual sin afectar a los demás
- Todos escriben a la misma tabla `signals` en Supabase, que es el punto de encuentro de todo el sistema
- El cruce real de información ocurre después, en el módulo de Clustering — no en la capa de captura

---

# 11. SOBRE EL VOLUMEN Y LA VELOCIDAD DE RESULTADOS

Darío corrigió una afirmación del Cloud Architect durante la sesión, y quedó establecido como principio:

**No es necesario esperar mucho tiempo para tener resultados firmes**, siempre que cada corrida tenga suficiente volumen de búsquedas/señales. La diferencia entre un sistema débil y uno robusto no es el tiempo que pasa, es la cantidad y diversidad de señales que se capturan en cada ejecución.

Con corridas de alto volumen desde el principio (cientos o miles de señales por corrida, combinando las 4-5 fuentes), ya en la tercera ejecución (aproximadamente mes y medio) MAKO puede empezar a mostrar patrones confiables, no hace falta esperar dos años para que el sistema sea útil.

**Implicación técnica para el diseño de cada módulo:** Diseñar siempre pensando en volumen alto desde el día uno (no probar con 10 productos como techo, sino como piso de testeo, sabiendo que la arquitectura tiene que escalar a cientos o miles de señales por corrida sin rediseño).

---

# 12. RESUMEN EJECUTIVO PARA EL PRÓXIMO CHAT

Si tuvieras que resumir en tres líneas qué se decidió en esta parte final de la sesión:

1. **Facebook queda descartado** definitivamente como fuente — no hay vía de acceso confiable.

2. **Mercado Libre vía API oficial falló (error 403)** — confirmado el Plan B: scraper de Apify (`ultramarine_freezer/meli`), $0.80/1000 resultados, buscando primero las keywords trending de la página pública de ML y después scrapeando productos por cada keyword.

3. **El sistema completo a construir tiene 4 módulos de captura activos** (Google Trends ✅, Mercado Libre 🔴, TikTok+Instagram vía Apify 🔴, Noticias/Proveedores 🔴), todos como workflows independientes por temporizador, todos alimentando la misma tabla signals, diseñados desde el inicio para soportar alto volumen.

---

**— Cloud Architect | MAKO-CTO-SELF-HEALING-V6.1 | 15/06/2026 —**
**Documento complementario — usar junto con MAKO_FIN_DE_TRABAJO_15062026_v2.md**
