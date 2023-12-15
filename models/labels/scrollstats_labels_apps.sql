{{ config
(
    materialized = 'table'
)
}}

SELECT name, address, category
FROM (VALUES
('Burn Address', '0x0000000000000000000000000000000000000001', 'burn address'), 
('USDC', '0x06efdbff2a14a7c8e15944d1f4a48f9f95f663a4', 'ERC20'),
('Rhino.fi', '0x87627c7e586441eef9ee3c28b66662e897513f33', 'bridge'),
('SyncSwap', '0x80e38291e06339d10aab483c65695d004dbd5c69', 'dex'),
('Dmail', '0x47fbe95e981c0df9737b6971b451fb15fdc989d9', 'messaging'),
('LayerZero', '0xa658742d33ebd2ce2f0bdff73515aa797fd161d9', 'bridge'),
('LayerZero', '0xcb566e3b6934fa77258d68ea18e931fa75e1aaaa', 'bridge'),
('USDT', '0xf55bec9cafdbe8730f096aa55dad6d22d44099df', 'ERC20'),
('iZiSwap', '0x2db0afd0045f3518c77ec6591a542e326befd3d7', 'dex'),
('KyberSwap', '0x6131b5fae19ea4f9d964eac0408e4408b66337b5', 'dex'),
('Scroll Bridge', '0x781e90f1c8fc4611c9b7497c3b47f99ef6969cbc', 'bridge'),
('Skydrome', '0xaa111c62cdeef205f70e6722d1e22274274ec12f', 'dex'),
('Scrolling Mainnet NFT', '0xc6a0807cc28ae3fc0af0ff5489dafff7d3b111a9', 'ERC721'),
('Thirdweb ERC20 Factory', '0x76f948e5f13b9a84a81e5681df8682bbf524805e', 'factory'),
('SpaceFi', '0x18b71386418a9fca5ae7165e31c385a5130011b6', 'dex'),
('Ambient', '0xaaaaaaaacb71bf2c8cae522ea5fa455571a74106', 'dex'),
('LayerBank', '0xec53c830f4444a8a56455c6836b5d2aa794289aa', 'lending'),
('PunkSwap', '0x26cb8660eefcb2f7652e7796ed713c9fb8373f8e', 'dex'),
('Merkly ONFT', '0x6e55472109e6abe4054a8e8b8d9edffcb31032c5', 'ERC721'),
('Merkly OFT', '0x1a7206f9c315720d1e5b536b492c448863eb298a', 'ERC20'),
('Omnisea Drop', '0xf28e0318887fb73ec0d9feeb6f89cea347ef775d', 'NFT Drop'),
('NFTs2Me Owners', '0x2269bceb3f4e0aa53d2fc43b1b7c5c5d13b119a5', 'ERC721'),
('SecondLive', '0xac1f9fadc33cc0799cf7e3051e5f6b28c98966ee', 'metaverse'),
('SXG', '0xe1045afc3abd65bb728a90a011924b0d64c6bf86', 'ERC20'),
('Element', '0x0cab6977a9c70e04458b740476b498b214019641', 'NFT market'),
('Scroll Name Service', '0xe2e1d82b050bb5bfec776b2653a72f093a8373ab', 'ERC721'),
('ZebraSwap', '0x0122960d6e391478bfe8fb2408ba412d5600f621', 'dex'),
('XY Finance', '0x778c974568e376146dbc64ff12ad55b2d1c4133f', 'dex'),
('Zonic', '0x1a7b46c660603ebb5fbe3ae51e80ad21df00bdd1', 'NFT market'),
('ScrollSwap', '0xefeb222f8046aaa032c56290416c3192111c0085', 'dex'),
('zKDoge', '0x36f983124b027781216adc94c4d81ef4026ffcdd', 'ERC20'),
('KyberSwap LP NFT', '0xe222fbe074a436145b255442d919e4e3a6c6a480', 'NFT'),
('SushiSwap', '0xca6fe749878841b96f620ec79638b13daad3d320', 'dex'),
('Scroll Bridge', '0x4c0926ff5252a435fd19e10ed15e5a249ba19d79', 'bridge'),
('iZiSwap LP NFT', '0x1502d025bfa624469892289d45c0352997251728', 'NFT'),
('Zonic', '0x211e278bc28dc9d452ee0fd86bddb4bc849cdc5d', 'NFT'),
('OARTONFT', '0x48cd969dafa95a48c0b827998158a42b9819e417', 'NFT'),
('KyberSwap', '0xf9c2b5746c946ef883ab2660bbbb1f10a5bdeab4', 'dex'),
('KyberSwap', '0x7d5ba536ab244aaa1ea42ab88428847f25e3e676', 'dex'),
('Meson.fi', '0x25ab3efd52e6470681ce037cd546dc60726948d3', 'bridge'),
('QuestNFT', '0xaa4cd05cf4755075c415ab05bcea5cf9bf3971b2', 'NFT'),
('AI Degen', '0x6f93962d0ff4509cf35801697cfb259a86180c82', 'NFT'),
('Scroll Origins NFT', '0x74670a3998d9d6622e32d0847ff5977c37e0ec91', 'NFT')
) AS x (name, address, category)