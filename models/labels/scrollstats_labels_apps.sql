{{ config
(
    materialized = 'table'
)
}}

SELECT name, address, category
FROM (VALUES
('Burn Address', '0x0000000000000000000000000000000000000001', 'burn address'), 
('USDC', '0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4', 'ERC20')
) AS x (name, address, category)