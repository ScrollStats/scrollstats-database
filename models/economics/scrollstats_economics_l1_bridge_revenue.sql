{{ config
(
    materialized = 'incremental',
    unique_key = ['HASH','LOG_INDEX']
)
}}

SELECT
l.BLOCK_NUMBER,
l.BLOCK_TIMESTAMP,
l.LOG_INDEX,
l.TRANSACTION_HASH AS HASH,
TO_NUMBER(l.PARAMS:"value"::STRING)/1e18 AS  BRIDGE_FEE,
p.USD_PRICE * (TO_NUMBER(l.PARAMS:"value"::STRING)/1e18) AS BRIDGE_FEE_USD
FROM ETHEREUM.DECODED.LOGS l
INNER JOIN COMMON.PRICES.TOKEN_PRICES_HOURLY_EASY p
    ON l.ADDRESS = '0x8fa3b4570b4c96f8036c13b64971ba65867eeb48'  
    AND l.TOPIC0 = '0x3d0ce9bfc3ed7d6862dbb28b2dea94561fe714a1b4d019aa8af39730d1ad7c3d' --SafeReceived
    AND l.PARAMS:"sender"::STRING = '0x6774bcbd5cecef1336b5300fb5186a12ddd8b367' -- L1ScrollMessenger
    AND TO_NUMBER(l.PARAMS:"value"::STRING) < 1000000000000000000
    AND p.HOUR = date_trunc('hour', L.BLOCK_TIMESTAMP)
    AND p.symbol = 'ETH'
    AND l.BLOCK_TIMESTAMP >= to_timestamp('2023-10-07', 'yyyy-MM-dd') 
    {% if is_incremental() %}
    AND l.BLOCK_TIMESTAMP >= CURRENT_TIMESTAMP() - interval '3 day' 
    {% endif %}