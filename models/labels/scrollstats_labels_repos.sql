{{ config
(
    materialized = 'table'
)
}}

SELECT name, owner, url
FROM (VALUES
('SwiftGate', '0x73696d616f', 'https://github.com/0x73696d616f/SwiftGate'), 
('caravan', '0xabh', 'https://github.com/0xabh/caravan'),
('OneSave', '0xabh', 'https://github.com/0xabh/OneSave')
) AS x (name, owner, url)