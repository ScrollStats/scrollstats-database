{{ config
(
    materialized = 'table'
)
}}

SELECT
TO_VARCHAR(date_trunc('month',BLOCK_TIMESTAMP), 'YYYY-MM-DD') as month, 
l.name,
COUNT(DISTINCT FROM_ADDRESS) as active_wallets
FROM SCROLL.RAW.TRANSACTIONS st
INNER JOIN SCROLLSTATS.DBT_SCROLLSTATS.SCROLLSTATS_LABELS_BD l ON st.TO_ADDRESS = l.address
AND date_trunc('month',BLOCK_TIMESTAMP) > date_trunc('month',current_date) - interval '24 month'
GROUP BY 1,2
ORDER BY 1