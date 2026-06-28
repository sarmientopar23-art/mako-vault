-- =====================================================================
-- MAKO Intelligence — Queries de verificación en Supabase
-- Tabla: signals  |  Log: ingestion_log
-- Uso: Supabase → SQL Editor → New query → pegar → Run
-- =====================================================================

-- 1) RESUMEN GENERAL — cuántas señales por capa/fuente
SELECT fuente,
       COUNT(*)         AS total_senales,
       MIN(captured_at) AS primera,
       MAX(captured_at) AS ultima
FROM signals
GROUP BY fuente
ORDER BY total_senales DESC;

-- 2) RESEÑAS ML (Módulo 3) — campos correctos del raw_payload
--    OJO: el producto es 'titulo_producto', NO 'producto'. Trae keyword + catalog_id + rating.
SELECT id,
       raw_payload->>'keyword'         AS keyword,
       raw_payload->>'titulo_producto' AS producto,
       raw_payload->>'catalog_id'      AS catalog_id,
       (raw_payload->>'rating')::int   AS rating,
       texto_original                  AS resena,
       captured_at
FROM signals
WHERE fuente = 'mercadolibre-argentina-resenas'
ORDER BY (raw_payload->>'rating')::int ASC  -- peores primero (señales de oportunidad)
LIMIT 50;

-- 3) PRODUCTOS ML (Módulo 2)
SELECT id,
       texto_original          AS producto,
       increase_percentage     AS descuento_pct,
       raw_payload->>'precio'  AS precio,
       raw_payload->>'Vendedor' AS vendedor,
       captured_at
FROM signals
WHERE fuente = 'mercadolibre-argentina'
ORDER BY created_at DESC
LIMIT 50;

-- 4) KEYWORDS GOOGLE TRENDS (Módulo 1)
SELECT texto_original      AS keyword,
       search_volume,
       increase_percentage AS aumento_pct,
       start_timestamp
FROM signals
WHERE fuente = 'google-trends-argentina'
ORDER BY search_volume DESC NULLS LAST
LIMIT 50;

-- 5) HISTORIAL DE CORRIDAS
SELECT fuente,
       module_version,
       signals_insertados,
       signals_descartados,
       started_at,
       finished_at
FROM ingestion_log
ORDER BY started_at DESC
LIMIT 20;

-- 6) CHEQUEO DE DUPLICADOS (debería devolver 0 filas)
SELECT entity_id, COUNT(*)
FROM signals
GROUP BY entity_id
HAVING COUNT(*) > 1;
