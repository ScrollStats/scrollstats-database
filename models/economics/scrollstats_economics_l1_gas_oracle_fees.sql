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
t.RECEIPT_GAS_USED
FROM ETHEREUM.RAW.TRANSACTIONS t
INNER JOIN COMMON.PRICES.TOKEN_PRICES_HOURLY_EASY p
  ON p.HOUR = date_trunc('hour', t.BLOCK_TIMESTAMP)
  AND t.TO_ADDRESS IN ('0x987e300fdfb06093859358522a79098848c33852', '0x0d7e906bd9cafa154b048cfa766cc1e54e39af9b')
  AND t.INPUT LIKE '0xd99bc80e%' -- setL2BaseFee
  AND t.BLOCK_TIMESTAMP >= to_timestamp('2023-10-07', 'yyyy-MM-dd') 
  AND p.symbol = 'ETH'
  {% if is_incremental() %}
  AND t.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
  {% endif %}