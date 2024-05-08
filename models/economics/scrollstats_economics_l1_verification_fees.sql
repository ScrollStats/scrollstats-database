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
((RECEIPT_EFFECTIVE_GAS_PRICE * RECEIPT_GAS_USED)/1e18) as GAS_SPEND,
p.USD_PRICE * ((RECEIPT_EFFECTIVE_GAS_PRICE * RECEIPT_GAS_USED)/1e18) as GAS_SPEND_USD,
768 / 1024 / 1024 AS PROOF_SIZE_MB,
t.RECEIPT_GAS_USED
FROM ETHEREUM.RAW.TRANSACTIONS t
INNER JOIN COMMON.PRICES.TOKEN_PRICES_HOURLY_EASY p
  ON p.HOUR = date_trunc('hour', t.BLOCK_TIMESTAMP)
  AND t.TO_ADDRESS = '0xa13baf47339d63b743e7da8741db5456dac1e556'
  AND t.INPUT LIKE '0x31fa742d%' -- finalizeBatchWithProof
  AND t.BLOCK_TIMESTAMP >= to_timestamp('2023-10-07', 'yyyy-MM-dd') 
  AND p.symbol = 'ETH'
  {% if is_incremental() %}
  AND t.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
  {% endif %}