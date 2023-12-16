{{ config
(
    materialized = 'incremental',
    unique_key = 'HASH'
)
}}

SELECT
t.BLOCK_NUMBER,
t.BLOCK_TIMESTAMP,
t.HASH,
((GAS_PRICE * RECEIPT_GAS_USED)/1e18) as GAS_SPEND,
p.USD_PRICE * ((GAS_PRICE * RECEIPT_GAS_USED)/1e18) as GAS_SPEND_USD,
length(t.INPUT) as DATA_LENGTH,
RECEIPT_GAS_USED
FROM ETHEREUM.RAW.TRANSACTIONS t
INNER JOIN COMMON.PRICES.TOKEN_PRICES_HOURLY_EASY p
  ON p.HOUR = date_trunc('hour', t.BLOCK_TIMESTAMP)
  AND p.symbol = 'ETH'
  AND t.TO_ADDRESS = '0xa13baf47339d63b743e7da8741db5456dac1e556'
  AND  t.INPUT LIKE '0x1325aca0%' -- Commit Batch
  AND t.BLOCK_TIMESTAMP >= to_timestamp('2023-10-07', 'yyyy-MM-dd') 
  {% if is_incremental() %}
  AND t.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
  {% endif %}