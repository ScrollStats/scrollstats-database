{{ config
(
    materialized = 'table'
)
}}

SELECT
date_trunc('month',BLOCK_TIMESTAMP) as month, 
l.name,
COUNT(*) as num_transactions
FROM SCROLL.RAW.TRANSACTIONS st
INNER JOIN SCROLLSTATS.DBT_SCROLLSTATS.SCROLLSTATS_LABELS_BD l ON st.TO_ADDRESS = l.address
AND date_trunc('month',BLOCK_TIMESTAMP) > date_trunc('month',current_date) - interval '24 month'
GROUP BY 1,2
ORDER BY 1