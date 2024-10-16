{{ config
(
    materialized = 'table'
)
}}

WITH metadata AS (
SELECT DISTINCT NAME, LLAMA_NAME FROM SCROLLSTATS.DBT_SCROLLSTATS.SCROLLSTATS_LABELS_BD 
)

SELECT 
TO_VARCHAR(DATE_TRUNC('month',DATE), 'YYYY-MM-DD') AS date,
NAME,
LAST_VALUE(TVL) OVER (PARTITION BY DATE_TRUNC('month', DATE), NAME ORDER BY DATE) AS TVL
FROM (
    SELECT
    DATE,
    NAME,
    SUM(TVL) AS TVL 
    FROM (
        SELECT 
        DATE,
        m.NAME,
        h.TOTAL_LIQUIDITY_USD AS TVL,
        ROW_NUMBER() OVER (PARTITION BY h.PROTOCOL_NAME, DATE ORDER BY h.NEAREST_DATE DESC) AS rn
        FROM metadata m
        INNER JOIN DEFILLAMA.TVL.HISTORICAL_TVL_PER_CHAIN h
        ON h.CHAIN = 'Scroll'
        AND LLAMA_NAME != ''
        AND h.PROTOCOL_NAME LIKE LLAMA_NAME || '%'
        AND date_trunc('month',DATE) > date_trunc('month',current_date) - interval '24 month'
    )
    WHERE rn = 1 
    GROUP BY 1,2
)
QUALIFY ROW_NUMBER() OVER (PARTITION BY DATE_TRUNC('month', DATE), NAME ORDER BY DATE DESC) = 1