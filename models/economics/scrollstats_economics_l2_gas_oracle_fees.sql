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
(RECEIPT_L1_FEE+RECEIPT_GAS_USED*GAS_PRICE)/1E18 as GAS_SPEND,
p.USD_PRICE * ((RECEIPT_L1_FEE+RECEIPT_GAS_USED*GAS_PRICE)/1E18) as GAS_SPEND_USD,
t.RECEIPT_GAS_USED
FROM SCROLL.RAW.TRANSACTIONS t
INNER JOIN COMMON.PRICES.TOKEN_PRICES_HOURLY_EASY p
  ON p.HOUR = date_trunc('hour', t.BLOCK_TIMESTAMP)
  AND t.TO_ADDRESS = '0x5300000000000000000000000000000000000002'
  AND (t.INPUT LIKE '0xbede39b5%' -- setL2BaseFee
  OR t.INPUT LIKE '0x39455d3a%' --setL1BaseFeeAndBlobBaseFee)
  AND t.BLOCK_TIMESTAMP >= to_timestamp('2023-10-07', 'yyyy-MM-dd') 
  AND p.symbol = 'ETH'
  {% if is_incremental() %}
  AND t.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
  {% endif %}