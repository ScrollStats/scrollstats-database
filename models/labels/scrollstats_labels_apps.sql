{{ config
(
    materialized = 'table'
)
}}

SELECT name, address, category, slug
FROM (VALUES
-- ('Burn Address', '0x0000000000000000000000000000000000000001', 'burn address', null), 
('USDC', '0x06efdbff2a14a7c8e15944d1f4a48f9f95f663a4', 'ERC20', null),
('Rhino.fi', '0x87627c7e586441eef9ee3c28b66662e897513f33', 'bridge', null),
('Rhino.fi Scroll Hunter NFT', '0x0332fce92897679e97620a097aa515f5d7cf4034', 'NFT', null),
('Rhino.fi Scroll Pro Hunter NFT', '0x4be1136247cdeca3775a7a32aff6a621c1c149eb', 'NFT', null),
('SyncSwap', '0x80e38291e06339d10aab483c65695d004dbd5c69', 'dex', 'syncswap'),
('Dmail', '0x47fbe95e981c0df9737b6971b451fb15fdc989d9', 'messaging', null),
('LayerZero', '0xa658742d33ebd2ce2f0bdff73515aa797fd161d9', 'bridge', null),
('LayerZero', '0xcb566e3b6934fa77258d68ea18e931fa75e1aaaa', 'bridge', null),
('LayerZero', '0x1a44076050125825900e736c501f859c50fe728c', 'bridge', null),
('LayerZero', '0xb6319cc6c8c27a8f5daf0dd3df91ea35c4720dd7', 'bridge', null),
('USDT', '0xf55bec9cafdbe8730f096aa55dad6d22d44099df', 'ERC20', null),
('iZiSwap', '0x2db0afd0045f3518c77ec6591a542e326befd3d7', 'dex', 'iziswap'),
('KyberSwap', '0x6131b5fae19ea4f9d964eac0408e4408b66337b5', 'dex', 'kyberswap'),
('Scroll Bridge', '0x781e90f1c8fc4611c9b7497c3b47f99ef6969cbc', 'bridge', null),
('Skydrome', '0xaa111c62cdeef205f70e6722d1e22274274ec12f', 'dex', 'skydrome'),
('Scrolling Mainnet NFT', '0xc6a0807cc28ae3fc0af0ff5489dafff7d3b111a9', 'NFT', null),
('Thirdweb ERC20 Factory', '0x76f948e5f13b9a84a81e5681df8682bbf524805e', 'factory', null),
('SpaceFi', '0x18b71386418a9fca5ae7165e31c385a5130011b6', 'dex', 'spacefi-scroll'),
('Ambient', '0xaaaaaaaacb71bf2c8cae522ea5fa455571a74106', 'dex', 'ambient'),
('LayerBank', '0xec53c830f4444a8a56455c6836b5d2aa794289aa', 'lending', 'layerbank'),
('PunkSwap', '0x26cb8660eefcb2f7652e7796ed713c9fb8373f8e', 'dex', 'punkswap'),
('Merkly ONFT', '0x6e55472109e6abe4054a8e8b8d9edffcb31032c5', 'NFT', null),
('Merkly OFT', '0x1a7206f9c315720d1e5b536b492c448863eb298a', 'ERC20', null),
('Omnisea Drop', '0xf28e0318887fb73ec0d9feeb6f89cea347ef775d', 'NFT drop', null),
('NFTs2Me Owners', '0x2269bceb3f4e0aa53d2fc43b1b7c5c5d13b119a5', 'NFT', null),
('SecondLive', '0xac1f9fadc33cc0799cf7e3051e5f6b28c98966ee', 'metaverse', null),
('SXG', '0xe1045afc3abd65bb728a90a011924b0d64c6bf86', 'ERC20', null),
('Element', '0x0cab6977a9c70e04458b740476b498b214019641', 'NFT market', null),
('Scroll Name Service', '0xe2e1d82b050bb5bfec776b2653a72f093a8373ab', 'NFT', null),
('ZebraSwap', '0x0122960d6e391478bfe8fb2408ba412d5600f621', 'dex', 'zebra'),
('ZebraSwap', '0xca9fbef94d7cc8662f4711a8612ff9dc1526e650', 'dex', 'zebra'),
('XY Finance', '0x778c974568e376146dbc64ff12ad55b2d1c4133f', 'dex', 'xy-finance'),
('Zonic', '0x1a7b46c660603ebb5fbe3ae51e80ad21df00bdd1', 'NFT market', null),
('ScrollSwap', '0xefeb222f8046aaa032c56290416c3192111c0085', 'dex','scroll-swap'),
('zKDoge', '0x36f983124b027781216adc94c4d81ef4026ffcdd', 'ERC20', null),
('KyberSwap LP NFT', '0xe222fbe074a436145b255442d919e4e3a6c6a480', 'NFT', null),
('SushiSwap', '0xca6fe749878841b96f620ec79638b13daad3d320', 'dex', 'sushi'),
('Scroll Bridge', '0x4c0926ff5252a435fd19e10ed15e5a249ba19d79', 'bridge', null),
('iZiSwap LP NFT', '0x1502d025bfa624469892289d45c0352997251728', 'NFT', null),
('Zonic', '0x211e278bc28dc9d452ee0fd86bddb4bc849cdc5d', 'NFT', null),
('OARTONFT', '0x48cd969dafa95a48c0b827998158a42b9819e417', 'NFT', null),
('KyberSwap', '0xf9c2b5746c946ef883ab2660bbbb1f10a5bdeab4', 'dex', 'kyberswap'),
('KyberSwap', '0x7d5ba536ab244aaa1ea42ab88428847f25e3e676', 'dex', 'kyberswap'),
('Meson.fi', '0x25ab3efd52e6470681ce037cd546dc60726948d3', 'bridge', null),
('QuestNFT', '0xaa4cd05cf4755075c415ab05bcea5cf9bf3971b2', 'NFT', null),
('AI Degen', '0x6f93962d0ff4509cf35801697cfb259a86180c82', 'NFT', null),
('Scroll Origins NFT', '0x74670a3998d9d6622e32d0847ff5977c37e0ec91', 'NFT', null),
('Scroll Name Service', '0x9592af1844e7d267d20eeb1a7f0f3da514918462', 'identity', null),
('Safe', '0xa6b71e26c5e0845f74c812102ca7114b6a896ab2', 'factory', null),
('Merkly Gas Refuel', '0x7dfb5e7808b5eb4fb8b9e7169537575f6ff1a218', 'bridge', null),
('DODO', '0x4e998615ad430c1ca46a69d813ede6eb3ec55edb', 'dex', 'dodo'),
('ScrollMigos', '0x9b1840ff7c05e27ecc8663689f7c8e7748bac62b', 'NFT drop', null),
('OpenOcean', '0x6352a56caadc4f1e25cd6c75970fa768a3304e64', 'dex', null),
('Symbiosis', '0xf02bbc9de6e443efdf3fc41851529c2c3b9e5e0c', 'bridge', 'symbiosis'),
('Zerius ONFT', '0xeb22c3e221080ead305cae5f37f0753970d973cd', 'NFT', null),
('Interport', '0x7b2e3fc7510d1a51b3bef735f985446589219354', 'bridge', null),
('WETH', '0x5300000000000000000000000000000000000004', 'ERC20', null),
('Rubyscore', '0xe10add2ad591a7ac3ca46788a06290de017b9fb4', 'vote', null),
('Aave', '0x11fcfe756c05ad438e312a7fd934381537d3cffe', 'lending', 'aave-v3'),
('Metavault', '0x646aaff875bd16d2c3777f3f6e1599eebf1e2137', 'dex', 'metavault-v3'),
('Metavault', '0xc6433c65ed684e987287d4de87869a0a7cc4c2eb', 'dex', 'metavault-v3'),
('Cog', '0xc6433c65ed684e987287d4de87869a0a7cc4c2eb', 'lending', 'cog'),
('Symmetry', '0x4b9de260e4283feeb53f785aabeaa895ec5d46f9', 'derivatives', 'symmetry-trade'),
('Symmetry', '0x177fa9fc89c438bae630695797181331d6d8a056', 'derivatives', 'symmetry-trade'),
('Symmetry', '0x52dbf3cbc2622ec75252e7877d8f343049b83910', 'derivatives', 'symmetry-trade'),
('PunkSwap', '0x26cb8660eefcb2f7652e7796ed713c9fb8373f8e', 'dex', 'punkswap'),
('Uniswap', '0xfc30937f5cde93df8d48acaf7e6f5d8d8a31f636', 'dex', 'uniswap-v3'),
('Router', '0xfc30937f5cde93df8d48acaf7e6f5d8d8a31f636', 'bridge', 'router-protocol'),
('SushiSwap', '0x93c31c9c729a249b2877f7699e178f4720407733', 'dex', 'sushi'),
('Owlto', '0xe6feca764b7548127672c189d303eb956c3ba372', 'bridge', null),
('XY Finance', '0x22bf2a9fcaab9dc96526097318f459ef74277042', 'dex', 'xy-finance'),
('SushiSwap', '0x734583f62bb6ace3c9ba9bd5a53143ca2ce8c55a', 'dex', 'sushi'),
('Aave', '0xff75a4b698e3ec95e608ac0f22a03b8368e05f5d', 'lending', 'aave-v3'),
('Merkly Hyperlane NFT', '0x7dac480d20f322d2ef108a59a465ccb5749371c4', 'NFT', null),
('Layer3 Cube', '0x1195cf65f83b3a5768f3c496d3a05ad6412c64b7', 'NFT', null),
('LayerZero', '0x3c2269811836af69497e5f486a85d7316753cf62', 'bridge', null),
('zkMerkly', '0x61bb3852947a370946abdba8fa9cf45ec472f83f', 'NFT', null),
('LayerZero', '0xbe0d08a85eebfcc6eda0a843521f7cbb1180d2e2', 'bridge', null),
('Hyperlane', '0x2f2afae1139ce54fefc03593fee8ab2adf4a85a7', 'bridge', null),
('Cog', '0x63fdafa50c09c49f594f47ea7194b721291ec50f', 'lending', 'cog'),
('wstETH', '0xf610a9dfb7c89644979b4a0f27063e9e7d7cda32', 'ERC20', null),
('Merkly Hyperlane FT', '0x904550e0d182cd4aee0d305891c666a212ec8f01', 'ERC20', null),
('SyncSwap', '0xfd541d0e2773a189450a70f06bc7edd3c1dc9115', 'dex', 'syncswap'),
('Lifi', '0x1231deb6f5749ef6ce6943a275a1d3e7486f4eae', 'bridge', null),
('Scroll Pump Airdrop', '0xce64da1992cc2409e0f0cdcaad64f8dd2dbe0093', 'airdrop', null),
('EAS', '0xc47300428b6ad2c7d03bb76d05a176058b47e6b0', 'attestation', null),
('Scroll Canvas', '0xb23af8707c442f59bdfc368612bd8dbcca8a7a5a', 'attest', null),
('Scroll Canvas', '0x4560fecd62b14a463be44d40fe5cfd595eec0113', 'attest', null),
('Ethereum Year Badge Attester', '0x39fb5e85c7713657c2d9e869e974ff1e0b06f20c', 'attest', null),
('Pencils SOUL Drop Attester', '0x546f7e7257963dcfc3a7885e911e47b76c05bb76', 'bridge', null)
) AS x (name, address, category, slug)