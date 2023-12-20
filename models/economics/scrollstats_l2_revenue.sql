{{ config
(
    materialized = 'incremental',
    unique_key = 'DAY'
)
}}

SELECT
date_trunc('day', t.BLOCK_TIMESTAMP) AS DAY
, SUM((RECEIPT_L1_FEE + GAS_PRICE * RECEIPT_GAS_USED)/1e18) AS GAS_REV
, SUM(p.USD_PRICE * ((RECEIPT_L1_FEE + GAS_PRICE * RECEIPT_GAS_USED)/1e18)) AS GAS_REV_USD
FROM SCROLL.RAW.TRANSACTIONS t
INNER JOIN COMMON.PRICES.TOKEN_PRICES_HOURLY_EASY p
  ON p.HOUR = date_trunc('hour', t.BLOCK_TIMESTAMP)
  AND p.symbol = 'ETH'
  AND t.BLOCK_TIMESTAMP >= to_timestamp('2023-10-07', 'yyyy-MM-dd') 
  {% if is_incremental() %}
  AND t.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
  {% endif %}
GROUP BY 1