SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';
DROP SCHEMA IF EXISTS `productsdb`;
CREATE SCHEMA IF NOT EXISTS `productsdb` DEFAULT CHARACTER SET utf8;
SHOW WARNINGS;
USE `productsdb`;
CREATE TABLE IF NOT EXISTS PRODUCTS (
    PRODUCT_ID VARCHAR(512),
    PRODUCT_CODE VARCHAR(512),
    PRODUCT_NAME VARCHAR(512),
    PRODUCT_DESCRIPTION VARCHAR(512),
    PRODUCT_PRICE DECIMAL(10, 2)
) ENGINE = InnoDB;
ALTER TABLE PRODUCTS
ADD CONSTRAINT PK_IMG PRIMARY KEY (PRODUCT_ID);
ALTER TABLE PRODUCTS
ADD INDEX(PRODUCT_CODE);
-- 🚀 Script de inserción masiva para el taller (500 registros adicionales)
USE `productsdb`;
INSERT INTO PRODUCTS
VALUES (
        '3d703247-54bc-47ef-a69d-7531a638022e',
        'GQ1NGLK55K',
        'Laptop Samsung Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        3563000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1ad589d2-49b0-48a2-bed6-8e4bf1cd09c5',
        '1ES0HTRQVM',
        'Audio Bose Smart',
        'Experimenta una inmersión total con este dispositivo',
        223000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e0c7d078-7998-414b-b4cd-d4ac0116f466',
        'ZDGF7YJVO3',
        'TV Apple Eco',
        'Ideal para el hogar y la oficina moderna',
        2906000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'aec29a1d-f158-498a-a1c2-5f61dad1926d',
        'AKJ7KR42G1',
        'Audio JBL Max',
        'Optimizado para un consumo eficiente',
        680000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b3c0c24d-208f-4fa1-b938-99caabe4b8db',
        'Y2UK6DG3OO',
        'Laptop JBL Pocket',
        'Excelente calidad y rendimiento garantizado',
        3155000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '97852879-a683-4200-a6b6-793d4d3bd187',
        '7WXR9PK71K',
        'Electrodoméstico Dell Pocket',
        'Diseño elegante con potencia excepcional',
        542000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ad94ca4c-88e2-4742-a192-bfa8cff7ed87',
        '1FR701QNKD',
        'Laptop Apple Pro',
        'Optimizado para un consumo eficiente',
        3913000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9fba7c1b-5972-4309-88ce-4a9ead7995fa',
        'VO4XTSPR0G',
        'Audio Bose Smart',
        'Perfecto para llevar a todas partes',
        733000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '85eef19a-4bae-4a5e-8c2a-7c32a06032f4',
        '9WCZF54UFX',
        'Celular Nintendo Ultra',
        'Optimizado para un consumo eficiente',
        2130000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6d121b6b-bb8c-4069-88f6-837e661d51cf',
        'XUIY3QKVJC',
        'Electrodoméstico HP Pocket',
        'Optimizado para un consumo eficiente',
        807000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'daa2dcad-ff74-4544-907c-cf9143a5f467',
        '5YRL5QBRN4',
        'Electrodoméstico Microsoft Smart',
        'Experimenta una inmersión total con este dispositivo',
        523000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7db5ac2d-8e13-4dfc-bb60-f8c96621c012',
        'UTRFCJIH0S',
        'Audio Dell Gamer',
        'Disfruta de la mejor tecnología al mejor precio',
        566000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'adb8c965-9ac2-40b9-be3b-b8f2b6e30d1a',
        'H8C5FOCSN9',
        'Monitor HP Eco',
        'Disfruta de la mejor tecnología al mejor precio',
        2442000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '80dad0dc-39b7-4c7e-8519-c041ec36078c',
        'O3PAVZP4XA',
        'Smartwatch Xiaomi Premium',
        'Perfecto para llevar a todas partes',
        1155000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '99b35eb1-1ebf-41a9-9b1d-483f8ce507f5',
        'PANX9PIHMI',
        'TV Oster Ultra',
        'Vive el entretenimiento con una nitidez incomparable',
        3034000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5b5d4b20-d339-4f3d-9695-92036177078b',
        '1T3BY2QTVN',
        'Smartwatch Sony Ultra',
        'Alta durabilidad para superar tus expectativas',
        337000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '232b5101-4d1c-4bab-9821-eb50318b51be',
        'QN55TYCXPO',
        'Laptop JBL Premium',
        'Perfecto para llevar a todas partes',
        1897000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b30d3e0d-fe1a-489c-b989-eb95f147a1d1',
        '10GN0QKBE6',
        'Laptop ASUS Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        7014000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ed7523fc-7f9f-4fe7-a599-8c419f2052af',
        'T7TXURGW2T',
        'TV Microsoft Premium',
        'Vive el entretenimiento con una nitidez incomparable',
        4441000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'de7dbfc3-e970-4ff8-be60-f78c22ef4722',
        '6J26XB9E0D',
        'TV Whirlpool Max',
        'Optimizado para un consumo eficiente',
        3466000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8a6fbab7-65db-4b8a-abbb-d4f2bce7e272',
        '1GGMVICN9G',
        'Monitor Microsoft Premium',
        'Vive el entretenimiento con una nitidez incomparable',
        4158000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4b83bef0-31c9-4f35-82f6-cde4699d68db',
        'MJ8V8S3HUW',
        'Cámara Microsoft Ultra',
        'Disfruta de la mejor tecnología al mejor precio',
        2884000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'da8d1583-32f5-41d9-808e-a2f284f6ae2e',
        '09MYOCS4B1',
        'Monitor ASUS Slim',
        'La herramienta definitiva para potenciar tu productividad',
        2684000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '66f73644-f147-48f6-97a0-26624a572ada',
        'NHE0GJ0IVK',
        'Accesorios Samsung Ultra',
        'Ideal para el hogar y la oficina moderna',
        402000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '554833ef-89ee-4839-9fa5-ae9b49541912',
        'PH03ESDP3W',
        'Accesorios ASUS Elite',
        'Excelente calidad y rendimiento garantizado',
        759000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a517605e-4b92-46f0-965d-36acb57c1c27',
        'WCFYFZLTCJ',
        'Monitor ASUS Pro',
        'Experimenta una inmersión total con este dispositivo',
        1326000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '18bacde6-226d-4442-9692-26a398f3c0fa',
        'XCDXPZTU7R',
        'Smartwatch Bose Elite',
        'Excelente calidad y rendimiento garantizado',
        935000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cc823a91-0444-43dd-92cb-757fb3ea2f1f',
        'VVU3RDKBKR',
        'Smartwatch Apple Max',
        'Optimizado para un consumo eficiente',
        1079000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c424ee28-177b-4a0c-9ad4-f713d3bf7271',
        '7QCWLCCCNO',
        'Electrodoméstico JBL Elite',
        'Experimenta una inmersión total con este dispositivo',
        857000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4ac904b0-966c-48e0-a7d2-16e2aaf056d6',
        '3TXSP5NKU7',
        'Electrodoméstico HP Smart',
        'Perfecto para llevar a todas partes',
        673000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cc15470b-aca9-4541-b6f2-6eff28021f10',
        'RJA9DI9U7G',
        'Consola Oster Eco',
        'Optimizado para un consumo eficiente',
        7892000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b8711f95-65e2-4dd5-a38a-871ed8093baa',
        'TU9MDQY3AU',
        'Celular Oster Slim',
        'Ideal para el hogar y la oficina moderna',
        2745000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6679d794-eab2-441a-b056-2c3f2358b53f',
        'W8WW8ND96K',
        'TV ASUS Gamer',
        'Experimenta una inmersión total con este dispositivo',
        7899000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '25f06af1-dcd9-4803-a223-7b74172a3318',
        '1LOB51EXOH',
        'Smartwatch Oster Smart',
        'Excelente calidad y rendimiento garantizado',
        182000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '02761fe5-d345-414c-9e30-472f551e36f0',
        'YJBVN9SCX2',
        'Smartwatch Bose Smart',
        'La herramienta definitiva para potenciar tu productividad',
        1112000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e020e7f4-d18e-43fa-b88e-372100bc19ba',
        '0F1IPUD34O',
        'Monitor JBL Smart',
        'La herramienta definitiva para potenciar tu productividad',
        1518000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '463758fc-de42-4df4-83d2-026e251cedde',
        'FJKG0A6OJ1',
        'Accesorios Microsoft Pocket',
        'Diseño elegante con potencia excepcional',
        244000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9947ab05-e5f4-41e4-9517-fdeac84de362',
        'P1AQ0G7V3K',
        'Laptop JBL Pro',
        'Perfecto para llevar a todas partes',
        3424000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1b8141df-f2c9-43d4-b5a7-490203ce29e2',
        'GFDNCK1JFZ',
        'Laptop Oster Slim',
        'Optimizado para un consumo eficiente',
        7021000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fecd168e-4924-47fd-9050-d06bbf93420a',
        'OH7T9HR59J',
        'Audio Dell Smart',
        'Optimizado para un consumo eficiente',
        1194000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4b0dee73-1958-4e92-a6df-c1fc8ac21fa8',
        'RIQMTL9K49',
        'Laptop Bose Eco',
        'Experimenta una inmersión total con este dispositivo',
        6668000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1f04a03b-f937-4a1e-a0ab-2551a5af7586',
        '2RMSTWHMIZ',
        'TV LG Smart',
        'Excelente calidad y rendimiento garantizado',
        2181000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '18618a6e-e355-4531-b5f6-0a31239d462c',
        'NZQCDGJTRQ',
        'Laptop Lenovo Ultra',
        'Disfruta de la mejor tecnología al mejor precio',
        4990000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '368999cf-de20-4e1c-a940-5a1ea834e5d3',
        '3QKO0D2GOL',
        'TV Oster Pocket',
        'Experimenta una inmersión total con este dispositivo',
        5453000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '529e5f9f-ce41-4c1f-b5b8-2245c767b17a',
        '78F0SOBHYH',
        'Cámara Nintendo Max',
        'Experimenta una inmersión total con este dispositivo',
        3308000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '391579fb-9e3e-43d1-b4d2-d22c54e69e8a',
        'KM99JBC8D6',
        'Cámara Apple Premium',
        'Disfruta de la mejor tecnología al mejor precio',
        1839000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f6391f5d-12bd-4f07-b068-c275754f3e76',
        'MACGGSCMK6',
        'Celular Microsoft Ultra',
        'La herramienta definitiva para potenciar tu productividad',
        4318000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '001b365a-0c02-43fe-9a09-523b20681d71',
        '93LOGTO2PG',
        'Electrodoméstico Bose Slim',
        'Perfecto para llevar a todas partes',
        202000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5f6de4a0-4f11-4fd6-b5a8-12634283cbe9',
        'K18VOAG0B7',
        'Electrodoméstico Oster Pocket',
        'Ideal para el hogar y la oficina moderna',
        439000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '34d109ca-2c0d-481f-8c96-6d1c959711ca',
        'UY3X5R0J3U',
        'TV Nintendo Pocket',
        'Experimenta una inmersión total con este dispositivo',
        6972000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c222c951-b3bf-4478-93bb-564a500ff23e',
        'ITU3JHY5E7',
        'Accesorios Whirlpool Pro',
        'La herramienta definitiva para potenciar tu productividad',
        924000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '030f4e5c-8512-4884-bfb8-a9139744192d',
        '84FF9FI5LI',
        'Celular Oster Slim',
        'La herramienta definitiva para potenciar tu productividad',
        2817000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '45cc994c-aa6e-488b-bc61-2355ea79ebd1',
        'HQNBI7EZ4D',
        'Monitor Oster Max',
        'Ideal para el hogar y la oficina moderna',
        3044000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7d3e47bd-2f93-4df6-ac40-a524a100da5b',
        'DC43N2E0VF',
        'Electrodoméstico Xiaomi Premium',
        'Vive el entretenimiento con una nitidez incomparable',
        1128000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4c495e37-c14f-4b92-adf5-77f90a0b8034',
        '1OFSH9PRKP',
        'Consola Microsoft Premium',
        'Ideal para el hogar y la oficina moderna',
        6023000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1215f7a1-3ef9-4aa6-9fcc-ceb034d2e10a',
        '9OQDG8YLHX',
        'Electrodoméstico HP Slim',
        'La herramienta definitiva para potenciar tu productividad',
        618000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '425625d6-bd87-4597-9972-86850045b8c7',
        '624I6HTDHY',
        'Electrodoméstico Microsoft Smart',
        'La herramienta definitiva para potenciar tu productividad',
        387000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b964868b-6a51-4559-adf9-748fc417d1ce',
        '2WHWYRNXT3',
        'Cámara Bose Eco',
        'Ideal para el hogar y la oficina moderna',
        1790000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5c12c074-80f3-46cd-8232-cbee162e96dd',
        'UKDUOUIWDT',
        'Celular Dell Gamer',
        'Perfecto para llevar a todas partes',
        3180000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '285f3398-92b3-4161-9846-84b9ec05202c',
        'MYXCURRCRX',
        'Laptop JBL Elite',
        'Excelente calidad y rendimiento garantizado',
        7988000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4e95fbc4-274f-4a30-81b9-ea1483ffda0e',
        'IPCKKU0I9Q',
        'Laptop Bose Eco',
        'Alta durabilidad para superar tus expectativas',
        2051000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '142d3594-9981-468d-af84-836199a6da43',
        'T134TNWL69',
        'TV Lenovo Elite',
        'La herramienta definitiva para potenciar tu productividad',
        7960000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2dfd63c6-af4d-4215-99a9-467349e40278',
        'H276D3ITRY',
        'Consola ASUS Pro',
        'La herramienta definitiva para potenciar tu productividad',
        5686000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c3bdc1d6-34dc-4550-b5e4-072059bb47dc',
        'D1GNST2ZAH',
        'Monitor Nintendo Elite',
        'Ideal para el hogar y la oficina moderna',
        2332000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '770b7d91-76b6-488b-8889-d1454f1133f0',
        'CSN2CHM9A6',
        'Laptop Whirlpool Eco',
        'La herramienta definitiva para potenciar tu productividad',
        5754000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fdb6fec8-334a-406d-a807-141bc6d372e8',
        'NZA7TODA5Z',
        'Consola Oster Eco',
        'Excelente calidad y rendimiento garantizado',
        1540000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '62cde264-551f-4369-b158-7abfedcefe33',
        'ABL26IKXWH',
        'Audio Sony Max',
        'Diseño elegante con potencia excepcional',
        375000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd6b8f815-d13c-4712-a9d4-7203189a4da1',
        'XBHDF06PSQ',
        'Consola ASUS Gamer',
        'Experimenta una inmersión total con este dispositivo',
        2758000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7b7fc3ae-15c4-4b4a-9502-d06b6d3e58a6',
        'SWYNNTQ93O',
        'TV Sony Ultra',
        'Perfecto para llevar a todas partes',
        8096000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5f558ccc-b5e8-4865-afec-644bd9306096',
        'URVX64RS8W',
        'Monitor ASUS Eco',
        'La herramienta definitiva para potenciar tu productividad',
        1116000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1f3c87c5-0b84-4d95-a988-e1dd97aab60c',
        'YY9SZGTL1G',
        'Consola Dell Gamer',
        'Experimenta una inmersión total con este dispositivo',
        7561000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '16e1ff24-d6cc-4492-98a4-9b07b3c55d60',
        'Q5UPTJXVMQ',
        'Monitor HP Pocket',
        'La herramienta definitiva para potenciar tu productividad',
        3849000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7e61efe2-b29c-4065-a3bc-3a0788894ff5',
        'HNWJHMUC4P',
        'Consola Microsoft Eco',
        'Excelente calidad y rendimiento garantizado',
        5564000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e5ffe4a3-b4d9-45c3-938f-471c619e1466',
        '2H0VCNZNHC',
        'Cámara Apple Eco',
        'Alta durabilidad para superar tus expectativas',
        1691000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f3b4f8e1-3d47-4c50-b21f-37d10b06e574',
        '96NZKK3ZEV',
        'Laptop Bose Smart',
        'Diseño elegante con potencia excepcional',
        2786000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '36f11c76-5f71-457b-b1be-66a2f50df49c',
        'G390DARFB2',
        'Cámara LG Eco',
        'Alta durabilidad para superar tus expectativas',
        3165000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7674f48a-68a3-4a5f-9287-ada9a25b27f9',
        'Y75XMGKZ22',
        'Electrodoméstico LG Smart',
        'Perfecto para llevar a todas partes',
        778000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '144c997b-5ac3-4f57-81f9-e3576c352a32',
        'N42D2SWZJ9',
        'Electrodoméstico ASUS Pocket',
        'Perfecto para llevar a todas partes',
        1191000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a5e3f507-4db5-4039-a2b9-b4145e2da3d3',
        'ECSH0JC8BD',
        'Monitor Oster Elite',
        'Ideal para el hogar y la oficina moderna',
        4235000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '425c10df-49ad-4da2-82cf-ef31cadde9f1',
        'X4BTKHX8OP',
        'Monitor HP Eco',
        'Excelente calidad y rendimiento garantizado',
        3912000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a34cdc1e-96af-4c58-b0b8-b1f4cf775225',
        'APQX5DHW31',
        'Accesorios Nintendo Eco',
        'Experimenta una inmersión total con este dispositivo',
        735000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd5cee363-1740-4701-ab53-3ac4004346d6',
        'R6U547R365',
        'TV Xiaomi Gamer',
        'Excelente calidad y rendimiento garantizado',
        7198000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9a56102e-c198-4427-9ec5-6da3b8eb6eb6',
        '7IH08LXW7R',
        'Accesorios Whirlpool Ultra',
        'Optimizado para un consumo eficiente',
        1171000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '511482de-5442-4ce4-8828-93214eca6996',
        '6T8NRP208L',
        'Accesorios Oster Pro',
        'La herramienta definitiva para potenciar tu productividad',
        585000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0d4121b9-6fa3-4d7b-b02a-1389ee98e736',
        'RQN8TEC0SW',
        'Audio Apple Slim',
        'Vive el entretenimiento con una nitidez incomparable',
        580000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2192ab91-d5a5-4e6c-98bd-f82bdc462efb',
        '0F9L69UB0H',
        'Monitor Samsung Premium',
        'Disfruta de la mejor tecnología al mejor precio',
        3354000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2b354e22-e07d-47a2-af46-68bb2c062beb',
        'EZYFLVAK2I',
        'Celular Samsung Max',
        'La herramienta definitiva para potenciar tu productividad',
        1723000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '73a6b244-2616-4a03-a26d-b13b850978d4',
        'IR76W1ZQQE',
        'Electrodoméstico Xiaomi Slim',
        'Optimizado para un consumo eficiente',
        794000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd85b8228-33e3-439f-9040-495e6020931c',
        '6659BN16DW',
        'Consola Samsung Max',
        'Alta durabilidad para superar tus expectativas',
        3130000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '07045760-78dd-48e8-83c5-8bda81a42b1a',
        'IFYK48ZHCS',
        'Smartwatch Lenovo Smart',
        'La herramienta definitiva para potenciar tu productividad',
        109000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '140ebdbf-5fe1-4afd-9121-898e950758c7',
        'D3LBLVFK20',
        'Laptop LG Elite',
        'Experimenta una inmersión total con este dispositivo',
        2226000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd3a96b68-16a4-4ac5-975a-2ded27c0193a',
        'JUP90R70L8',
        'TV Whirlpool Elite',
        'Perfecto para llevar a todas partes',
        3793000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2d4096cf-53f3-4719-a68c-b8d85576a1f6',
        'XPSMOBIVAI',
        'Laptop Samsung Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        8264000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '596f1fa7-9d7e-4db4-b384-cc23cb845023',
        'U2P6K344AX',
        'Audio Samsung Ultra',
        'Disfruta de la mejor tecnología al mejor precio',
        564000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '76e6beef-60ef-4673-b009-44086af71e3a',
        'R1UZO3GD2X',
        'Audio LG Ultra',
        'Experimenta una inmersión total con este dispositivo',
        119000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '203acf6e-da09-4538-987b-9f2ed41bad24',
        'QM7TEBU67N',
        'Audio HP Slim',
        'Ideal para el hogar y la oficina moderna',
        400000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '16efbe1d-1bde-489b-94b2-52cfbc14c752',
        'R7ARVNYXBG',
        'Consola Lenovo Elite',
        'La herramienta definitiva para potenciar tu productividad',
        4852000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f241dcaf-61c0-487c-9af6-e2e8479163f9',
        'J2NVWC1659',
        'Consola Apple Max',
        'Perfecto para llevar a todas partes',
        5735000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f8fc53f4-a760-425b-b5f0-be16ca287a29',
        'NH9NTRN8UC',
        'Cámara Bose Smart',
        'Ideal para el hogar y la oficina moderna',
        2794000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fc6a1890-ddf4-4427-ad1b-72164a6674c7',
        'EKUJDGBG84',
        'Laptop Nintendo Premium',
        'Alta durabilidad para superar tus expectativas',
        6372000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '32be3442-e05f-454d-a9d6-20a7db51cb6d',
        'QVXYFOAVUE',
        'Audio Apple Pro',
        'Diseño elegante con potencia excepcional',
        698000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3d2078a4-9046-45eb-98bf-d5090819b911',
        'ESIK8DG4SE',
        'Monitor Nintendo Gamer',
        'La herramienta definitiva para potenciar tu productividad',
        895000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9510863b-b6e1-4c17-a885-cb6159396dbe',
        'NXX88Z9E7S',
        'Cámara Dell Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        3164000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5006f031-1de6-4ad0-a2f0-7a27bf64a639',
        'GODV2KX85P',
        'Monitor Samsung Elite',
        'Disfruta de la mejor tecnología al mejor precio',
        1552000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ca47b4a4-7bdd-410c-9a96-c6c88d6837c9',
        'A9FYTPA7V8',
        'Electrodoméstico Microsoft Smart',
        'Diseño elegante con potencia excepcional',
        105000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '20112b08-ed73-48f0-a805-5a66d0dfd027',
        'PMLS146R9G',
        'Cámara Bose Gamer',
        'La herramienta definitiva para potenciar tu productividad',
        3196000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd45982c6-0c09-4efe-992a-87843d2f2350',
        '74XTZOWH3E',
        'Monitor Whirlpool Max',
        'Alta durabilidad para superar tus expectativas',
        1278000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3a9f0125-978d-4aaf-a884-3ef428bcea6a',
        '27PW3QFWYH',
        'Accesorios Xiaomi Smart',
        'Vive el entretenimiento con una nitidez incomparable',
        1038000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bc220f72-8465-43f7-900e-ba82a431560f',
        'OIGS7JK712',
        'Consola Dell Premium',
        'La herramienta definitiva para potenciar tu productividad',
        5306000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6af76055-2369-40a5-98ef-5bb959bc0fb5',
        '9A80LFQWEU',
        'Consola Microsoft Premium',
        'La herramienta definitiva para potenciar tu productividad',
        4195000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3b685831-6ccd-4914-b82a-98d50d6a078e',
        'OZECGKN37R',
        'Laptop Oster Pro',
        'La herramienta definitiva para potenciar tu productividad',
        6355000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '22b9e0ba-1216-4071-a1bf-4f729c70506a',
        'Y0KVMAU0VC',
        'Electrodoméstico ASUS Max',
        'Ideal para el hogar y la oficina moderna',
        859000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '93914cf0-dda1-4b9c-8edd-0ab7c0b12d61',
        'DNR6B7ILZX',
        'Cámara ASUS Elite',
        'La herramienta definitiva para potenciar tu productividad',
        3952000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '35786ac0-565a-4f28-b2e3-4268a0470fad',
        'G7M248XM4E',
        'Consola Oster Slim',
        'Alta durabilidad para superar tus expectativas',
        7528000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '679ee8ae-c0ee-4b1e-a82f-a7c5f4756416',
        'C7B3X241YP',
        'TV Sony Pocket',
        'Alta durabilidad para superar tus expectativas',
        7309000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f8773c30-a785-4e19-a546-e6db70e692a8',
        'J30G87KB21',
        'Monitor Oster Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        1785000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4bdafe4d-64ec-4e05-a9f2-f9c83284dbc7',
        'OR4TIO244O',
        'Celular Sony Smart',
        'Ideal para el hogar y la oficina moderna',
        1861000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cd0568e4-793e-4397-8321-52c00d668969',
        'KZH28OGJ0E',
        'Monitor Lenovo Pro',
        'Perfecto para llevar a todas partes',
        3821000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4418ebd9-537e-4d3d-bf0d-21be9a0e7c04',
        'UUREPPPNT3',
        'Electrodoméstico Sony Pocket',
        'Perfecto para llevar a todas partes',
        275000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '70ab0212-7f1f-40c5-94ff-e574465ec33f',
        '1L9N8PP5J7',
        'Monitor Whirlpool Premium',
        'Ideal para el hogar y la oficina moderna',
        2908000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '76a4a58b-6a0c-4fbe-a334-d16ef83c21dc',
        'NVMI99HIE3',
        'Consola Sony Premium',
        'Ideal para el hogar y la oficina moderna',
        2083000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e45da7db-ebd2-4702-b88b-056a9d2ee3f2',
        'G0CUW8VUT6',
        'TV Sony Smart',
        'Perfecto para llevar a todas partes',
        2267000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7559690a-3020-444a-bef1-d8cccaccf83f',
        'WKRQTU5AC8',
        'Celular JBL Ultra',
        'Diseño elegante con potencia excepcional',
        4309000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e5701d36-8bb9-4168-901f-6f8ea6f4e047',
        '9U0NQV5TOM',
        'Monitor Oster Max',
        'La herramienta definitiva para potenciar tu productividad',
        3789000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0282b5f8-51d2-47b6-bb7b-293a08cbe4a4',
        'BFY64LWY6X',
        'Cámara Bose Pocket',
        'Alta durabilidad para superar tus expectativas',
        3910000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '78464357-8bc5-4b82-90cd-7bac2e699c04',
        '6175LW4WBC',
        'Cámara Samsung Max',
        'La herramienta definitiva para potenciar tu productividad',
        2011000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3e21cb28-5197-4cf8-ab67-321d54a227d7',
        'N0OWJAAX5D',
        'Cámara ASUS Eco',
        'Ideal para el hogar y la oficina moderna',
        881000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e73240d1-55e4-4998-a206-f6241cad4204',
        'UTUN46U7TP',
        'Consola Microsoft Smart',
        'Ideal para el hogar y la oficina moderna',
        5858000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e3189b99-a08c-4354-87ef-4098099b7e4e',
        'C7F4P553VD',
        'TV Whirlpool Pocket',
        'Optimizado para un consumo eficiente',
        5901000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '05fd2b72-b271-4e1c-a06c-14befc40c725',
        'PSSLV181O1',
        'Consola Microsoft Ultra',
        'Experimenta una inmersión total con este dispositivo',
        6204000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '24b8a7f9-a136-4ea5-a3ed-9050d6e85d59',
        '7FK1IG5DSJ',
        'Laptop HP Elite',
        'Optimizado para un consumo eficiente',
        7252000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a08b1d91-5069-4989-a46d-4dfa2a56d976',
        '5FIDRFLMC6',
        'TV Lenovo Pro',
        'Experimenta una inmersión total con este dispositivo',
        8231000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cbea819e-693c-4241-bd20-1cb0162340a1',
        '4VKVWSRYCJ',
        'Audio LG Slim',
        'Perfecto para llevar a todas partes',
        1000000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4dbddeba-c212-4905-9504-cd35d72e7cad',
        '50WNFV4FA2',
        'Celular Lenovo Pocket',
        'Diseño elegante con potencia excepcional',
        4231000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ff64d9db-6864-4f7f-8e57-2ed7f9179a78',
        'C3OA7DGPHO',
        'Laptop HP Ultra',
        'Experimenta una inmersión total con este dispositivo',
        5799000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ca864eba-6159-473c-a258-c02f1b2ff112',
        '0X9WEGN1LJ',
        'Consola Bose Premium',
        'Alta durabilidad para superar tus expectativas',
        5246000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ecd17dbf-df63-483d-9e6f-a987800c071e',
        'PUU5X702K1',
        'Cámara ASUS Ultra',
        'Vive el entretenimiento con una nitidez incomparable',
        3325000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '63238b12-9362-4e9b-be89-b45dd0d085f8',
        'EG8J6JOCUS',
        'Celular ASUS Ultra',
        'Alta durabilidad para superar tus expectativas',
        2843000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b2a864b3-80b4-4146-ae07-cd3e55b74eff',
        'YLCE25NYTW',
        'Laptop Nintendo Elite',
        'Vive el entretenimiento con una nitidez incomparable',
        7352000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cfd4b2a2-a3f9-4904-947d-2a82fb1dc5b4',
        'IS6JL7QEF5',
        'Laptop Oster Ultra',
        'Alta durabilidad para superar tus expectativas',
        6419000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1734581e-9ce2-4bbb-9798-3b2953087dcf',
        'J114SEX02J',
        'TV Dell Smart',
        'Perfecto para llevar a todas partes',
        3989000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a5aa14ce-f63b-4e58-8234-af00e3e42152',
        '9UU9OGMF8V',
        'TV JBL Gamer',
        'Excelente calidad y rendimiento garantizado',
        3786000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e8b63006-da3a-404a-b688-af2defe22718',
        '5CBMC84UCK',
        'Consola ASUS Elite',
        'Ideal para el hogar y la oficina moderna',
        5396000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e0a4c198-fd51-4031-ae1d-85c598b3bd46',
        'RRTB4BJVEH',
        'Accesorios ASUS Premium',
        'La herramienta definitiva para potenciar tu productividad',
        1013000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1a091805-e1e2-4e11-b5fa-0b61aecd0f69',
        'SDLIR91GPC',
        'Audio HP Pro',
        'Experimenta una inmersión total con este dispositivo',
        418000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a79506aa-b0d9-4fc8-801c-b629260c8550',
        '1Y56JUI069',
        'Monitor Sony Gamer',
        'Optimizado para un consumo eficiente',
        1344000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '87d7c264-e2fb-4563-81e3-44a5ce1a4848',
        'P3LYW1V20X',
        'Electrodoméstico Samsung Eco',
        'Ideal para el hogar y la oficina moderna',
        1172000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '859aabb2-8418-4539-9e9a-19791d63bb58',
        '0ZGAC88TY2',
        'Celular HP Max',
        'Excelente calidad y rendimiento garantizado',
        3992000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ea9f03d6-ccee-4e0d-bcca-01df4956edc0',
        'HGS9XDH9T7',
        'Celular ASUS Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        1729000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b7685715-8ab3-47e8-94df-d58ecb81799b',
        'LE2CUD3JMH',
        'Monitor Sony Slim',
        'Excelente calidad y rendimiento garantizado',
        2651000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cecb79d4-d44c-4b79-abbf-a5d6ebc0906d',
        'VONR8QFNOV',
        'Monitor Sony Slim',
        'Optimizado para un consumo eficiente',
        1903000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fbb1d8c9-f815-4064-a3f0-bf812aa6ed38',
        'VUD7DI08OD',
        'Consola Xiaomi Elite',
        'Disfruta de la mejor tecnología al mejor precio',
        7710000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7a9afcd8-0ebe-40f7-8a1c-40c212c0e551',
        '6CJ52ZNNR0',
        'Consola Xiaomi Eco',
        'La herramienta definitiva para potenciar tu productividad',
        8257000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7f2f94c0-e443-4bee-85db-7b73e5cde6ba',
        'WV5F0C0N23',
        'Accesorios Nintendo Premium',
        'Excelente calidad y rendimiento garantizado',
        189000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2d468e04-7ca8-457c-b666-5313cf3478cb',
        'JUVDIHVEPK',
        'Celular Oster Gamer',
        'Optimizado para un consumo eficiente',
        4318000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fcaf14f4-b7d8-40d2-99d4-56979449b69e',
        '3RRX00YFR4',
        'TV Bose Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        5865000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '786fc782-60ee-48c4-ad8d-c240407d2d65',
        'D6JH7MCPWH',
        'Electrodoméstico JBL Pro',
        'La herramienta definitiva para potenciar tu productividad',
        394000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd650ea89-a574-4674-8ad9-303b2519ab9e',
        'SWUJB8OE0L',
        'Monitor Sony Smart',
        'Diseño elegante con potencia excepcional',
        2150000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '67d416c8-1c09-4561-82ad-8f3ec08220b2',
        'MPS5I3B4GN',
        'Consola Samsung Pocket',
        'Vive el entretenimiento con una nitidez incomparable',
        6872000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '97ad37f0-c05a-4fe9-93e8-3347cadbc6d1',
        'QGMGIA96LZ',
        'TV Microsoft Eco',
        'Diseño elegante con potencia excepcional',
        7586000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '23a4b1e9-d028-43a9-89ff-6d0b79664cfb',
        '0EL67AX7LK',
        'TV Bose Smart',
        'Diseño elegante con potencia excepcional',
        4604000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8f97fa42-0201-4703-9755-07c0648a597e',
        'AV14QL6PJF',
        'Laptop Xiaomi Premium',
        'Perfecto para llevar a todas partes',
        6431000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '704f8cb8-1938-4718-b869-081d32e45fd6',
        'IN9J60596H',
        'Cámara Whirlpool Ultra',
        'La herramienta definitiva para potenciar tu productividad',
        2933000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1489b897-5d5f-405d-87fe-cab043c05069',
        'ZMNQFMATS4',
        'Laptop Samsung Elite',
        'Experimenta una inmersión total con este dispositivo',
        3446000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a03c51bb-e44f-4acb-8a30-ec00b771f980',
        'DGXFI7QPWW',
        'Celular HP Ultra',
        'Perfecto para llevar a todas partes',
        1113000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8eddbe44-d1be-48f7-8c72-1eeba19917b8',
        'EWS5SUAX63',
        'Audio JBL Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        298000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b97453c4-1940-4e2d-ae31-d9530ff8d54f',
        'YQENSSEHIW',
        'Smartwatch Dell Elite',
        'Ideal para el hogar y la oficina moderna',
        203000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '545bb072-d94b-4d65-a74e-1f2c2c9acf46',
        '9R8SYPNULL',
        'Consola Samsung Smart',
        'Optimizado para un consumo eficiente',
        1906000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9f3d83e1-5615-4798-ab11-400caef4a803',
        'HU3JMDL4XK',
        'Consola HP Gamer',
        'Ideal para el hogar y la oficina moderna',
        6387000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '551ee73c-ec81-4d30-a181-01cd3e18fd08',
        'DNV4RC4H83',
        'Consola Dell Pro',
        'Disfruta de la mejor tecnología al mejor precio',
        3389000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4db1298f-e457-4fff-8a8b-71a903dc61da',
        'KISQ4IMG5F',
        'Accesorios Oster Max',
        'Perfecto para llevar a todas partes',
        276000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '688fb5b0-fea3-45f0-8ec3-9b5ce864a057',
        '49PMCK5I2L',
        'Electrodoméstico HP Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        405000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '457d7e11-d9a6-4820-887d-0a95748efdaf',
        'TMEOUWEIZT',
        'Electrodoméstico Oster Slim',
        'Vive el entretenimiento con una nitidez incomparable',
        150000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '922194e8-1a9b-4cdc-973a-47e99520f5ae',
        'PGMWC484VE',
        'Consola LG Gamer',
        'Experimenta una inmersión total con este dispositivo',
        7924000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1412931d-59aa-4268-8b08-6c35c79c764f',
        '2F4JWYQ1XY',
        'Electrodoméstico Whirlpool Pocket',
        'Ideal para el hogar y la oficina moderna',
        615000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0f45c761-6189-421b-a395-7769d155dd0b',
        '8RGAFBDKKH',
        'Accesorios Nintendo Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        1082000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd824cffd-48f5-4825-99d4-8e644c9703bc',
        'PIVO6XD92S',
        'Celular Bose Pro',
        'Optimizado para un consumo eficiente',
        4077000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5e210551-ac7b-4d2c-9abc-2e0eedd70ed7',
        'K0WLEP5L5K',
        'Consola Oster Max',
        'Vive el entretenimiento con una nitidez incomparable',
        3408000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ef55bcb5-5948-4ae5-abb3-e2b76060925b',
        'IDVOA82YXX',
        'Laptop Microsoft Pro',
        'La herramienta definitiva para potenciar tu productividad',
        8122000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '365e8be6-71a2-4e7e-beda-113fa1596f8f',
        'KOEP3HVTEF',
        'Laptop Bose Pro',
        'Experimenta una inmersión total con este dispositivo',
        7043000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cc2257a8-0567-4fb8-8e61-bceec614a1cf',
        '2QYYH1OZUB',
        'TV Xiaomi Pocket',
        'Ideal para el hogar y la oficina moderna',
        3010000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3f7d93d7-fd71-4678-825e-8d3033265d60',
        'O7WKSG84GC',
        'Celular Sony Elite',
        'Perfecto para llevar a todas partes',
        1257000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5f66cff3-4c67-428d-9ec1-6523c346c036',
        '8SDIVAVXII',
        'Smartwatch Oster Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        158000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b5b76ff8-a0b2-40a7-b92e-2847dd228abb',
        'Z6KMT56ESH',
        'Cámara Sony Pro',
        'Disfruta de la mejor tecnología al mejor precio',
        1593000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '679913c0-ce5f-43d7-9015-8166bebee125',
        'KLSVONB9W1',
        'Smartwatch HP Slim',
        'La herramienta definitiva para potenciar tu productividad',
        795000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a67461ab-dbcb-4f62-a17d-a5720b964c00',
        'MQY55JVXSV',
        'Monitor Xiaomi Eco',
        'Experimenta una inmersión total con este dispositivo',
        3217000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2a6721d2-9de3-4dee-8b22-27db6b4faebb',
        'OZDRXMK1GW',
        'Cámara Nintendo Slim',
        'Excelente calidad y rendimiento garantizado',
        3734000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '39335f1e-e9f0-4416-bec5-65d79f271db0',
        '8OCD408PQX',
        'Celular Lenovo Elite',
        'Diseño elegante con potencia excepcional',
        1767000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0f131ac0-ea72-4209-be9a-e4768b890e2d',
        'Y451509VLO',
        'Cámara HP Max',
        'Experimenta una inmersión total con este dispositivo',
        2026000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6ebf9963-9e3e-41c2-8926-443cb780a777',
        '8RKUVXE5EB',
        'Smartwatch HP Gamer',
        'Alta durabilidad para superar tus expectativas',
        1200000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ff70eceb-17b1-4d22-9b19-068297a2a8ca',
        'WJ5SKOU40U',
        'Electrodoméstico LG Gamer',
        'Diseño elegante con potencia excepcional',
        1095000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '29cfd2ac-215e-4710-b156-99599b272633',
        'KUOPAUHTVQ',
        'Cámara JBL Slim',
        'Experimenta una inmersión total con este dispositivo',
        1051000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1eff8761-5de2-4834-b07e-b7a6fc2af2b9',
        'ETOQ9OZEUL',
        'Smartwatch Whirlpool Pocket',
        'Diseño elegante con potencia excepcional',
        162000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0c373b14-eba7-49ff-ac31-589c4964e5dc',
        'H9T1V424VQ',
        'Consola Bose Gamer',
        'La herramienta definitiva para potenciar tu productividad',
        4420000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'afa3ce98-1469-4334-915b-713a8bbe65cf',
        'WQWWGZ1W74',
        'Electrodoméstico HP Gamer',
        'Optimizado para un consumo eficiente',
        622000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '18ae5ae1-fe90-4ec6-a571-2353f47306b3',
        'I7DOLCQSAR',
        'Cámara Microsoft Pro',
        'Diseño elegante con potencia excepcional',
        3581000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7f8c2fc3-ffdc-4cbf-8a0c-1c26a5f1ad4d',
        '0854OMCRNR',
        'Cámara Oster Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        2798000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7872e06b-464a-4a8b-89f3-81fe4a5e6267',
        '78VRZTUGI9',
        'Audio Lenovo Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        1156000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ea620274-1caa-4025-8fa8-c68193470877',
        'OTW7Q2WNNG',
        'TV Microsoft Ultra',
        'Experimenta una inmersión total con este dispositivo',
        3216000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '35e36289-c3b6-4b4d-a499-5f530a7f1396',
        '4L4BGU0X89',
        'Cámara Oster Pro',
        'Excelente calidad y rendimiento garantizado',
        3207000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '13d13d66-f328-47cf-880b-9b4dca08f33d',
        '7VY85IA0SA',
        'Laptop Lenovo Ultra',
        'Ideal para el hogar y la oficina moderna',
        4476000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd47c89e9-0da2-410a-9637-5304100173dd',
        'G0145L658J',
        'Electrodoméstico Apple Gamer',
        'Vive el entretenimiento con una nitidez incomparable',
        928000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '21295a2b-d234-4398-880b-25808ae1d315',
        'L62GYT4RB4',
        'Smartwatch ASUS Smart',
        'Alta durabilidad para superar tus expectativas',
        621000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '884f4458-23bb-42c0-9080-6d8eee58c427',
        '4M2M1T7WB6',
        'Smartwatch Bose Pocket',
        'Ideal para el hogar y la oficina moderna',
        392000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '495575e8-ba0a-4320-9f53-67274d349676',
        'JTONEVVW6N',
        'Laptop Bose Gamer',
        'Excelente calidad y rendimiento garantizado',
        6262000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8644d6c7-2ebe-4710-8468-671c48b4aba8',
        'Y9TGGAL0KF',
        'Cámara Dell Slim',
        'Ideal para el hogar y la oficina moderna',
        4111000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'eca06043-c972-4011-8661-f3a13f3cf0d4',
        'AM9EQF003P',
        'Electrodoméstico Whirlpool Smart',
        'Perfecto para llevar a todas partes',
        110000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c83adf00-03b2-47c0-a37d-104f70477d57',
        'GUD1DMD2DZ',
        'TV Dell Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        4265000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8d9fb98c-9a64-49e1-a3b7-c32568782285',
        '3JED1MT12Z',
        'Cámara Xiaomi Ultra',
        'Alta durabilidad para superar tus expectativas',
        4011000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e7e0eadd-44d1-4cd9-a216-76b0c51db7ad',
        'OCG6FGZ3VY',
        'Laptop Bose Elite',
        'Experimenta una inmersión total con este dispositivo',
        2299000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '31f7145e-a28d-4ae7-9282-0b35cc280477',
        'G4YGAXWAM1',
        'Accesorios Apple Max',
        'Diseño elegante con potencia excepcional',
        953000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '97897135-97e0-44fd-ae8d-94e38d164197',
        'VI8FUJYVEX',
        'Smartwatch Apple Gamer',
        'La herramienta definitiva para potenciar tu productividad',
        877000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '19d18fd7-312f-4ada-9307-d43b2bb60f00',
        'R6SLQUF7C8',
        'Consola Microsoft Eco',
        'La herramienta definitiva para potenciar tu productividad',
        6693000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c0e7eb75-afd5-4999-937a-7e0eda385485',
        'H1ZW983F79',
        'Electrodoméstico Lenovo Slim',
        'La herramienta definitiva para potenciar tu productividad',
        965000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'df5d100e-f596-4463-a40b-38068608fb98',
        '4VMQW35VOF',
        'Electrodoméstico ASUS Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        902000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5b2f0483-6afe-402a-acf9-142c9aea8317',
        '45U6W4E4DX',
        'Electrodoméstico Lenovo Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        798000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c64d648e-a9df-45dc-9536-e0548b61f49f',
        '361T2WNOWS',
        'Monitor Dell Gamer',
        'Alta durabilidad para superar tus expectativas',
        3474000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f3811940-fc93-44e0-af54-322e0c176a92',
        'ZK48M8T4LF',
        'Monitor ASUS Eco',
        'Vive el entretenimiento con una nitidez incomparable',
        1372000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c9ffaee6-987c-4e92-844d-6e926678d456',
        'J7XAF7EIUO',
        'Smartwatch Lenovo Pro',
        'Disfruta de la mejor tecnología al mejor precio',
        160000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '70e6ef38-fd5d-4073-a3fe-60d6ac5debba',
        '3G5LCNX4GA',
        'Celular Dell Max',
        'Perfecto para llevar a todas partes',
        1864000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2eb6a3d3-5b60-4557-8b87-0f4aaa51bf02',
        'IJAUP4SRYU',
        'Electrodoméstico LG Max',
        'Vive el entretenimiento con una nitidez incomparable',
        858000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c3341211-45d9-4058-812d-2d887183fbbd',
        'VOJVDRW616',
        'Consola Whirlpool Max',
        'Experimenta una inmersión total con este dispositivo',
        4802000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '65d22ee3-cc49-4df6-8eb7-aad5e8bb3175',
        'GVYRV7XYK4',
        'Monitor Bose Premium',
        'Perfecto para llevar a todas partes',
        2265000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9c63be75-6524-4132-8c4f-10a8658a2536',
        'NJSQYZDVOH',
        'Smartwatch Sony Slim',
        'La herramienta definitiva para potenciar tu productividad',
        195000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9a727342-8a06-4c68-83f9-fcf67e375f16',
        'U8LBIRMJJ1',
        'Electrodoméstico Dell Pro',
        'Disfruta de la mejor tecnología al mejor precio',
        991000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd507f502-53a5-4a57-b15d-d61901312c0b',
        'WFDS1FJ1L2',
        'Audio Whirlpool Slim',
        'Experimenta una inmersión total con este dispositivo',
        779000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5b57899b-9c7e-401b-88a8-6acdf74831c5',
        'WRXE2HW6W0',
        'Cámara LG Max',
        'Optimizado para un consumo eficiente',
        853000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7c074c97-f67e-45a2-b88e-0bd289563781',
        'XAEAXF88YI',
        'Celular Samsung Gamer',
        'Ideal para el hogar y la oficina moderna',
        3097000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '88cbf74d-a440-4d52-a1ce-364fe253a18c',
        '8R2KT4W1RD',
        'Accesorios Microsoft Pro',
        'Excelente calidad y rendimiento garantizado',
        1035000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fd0ce25d-e25f-4ebf-acc7-4fa7a8375567',
        '3J79VDEV5O',
        'TV Nintendo Smart',
        'Vive el entretenimiento con una nitidez incomparable',
        6977000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd619055c-0f61-42e0-8d82-f6b62bf58f57',
        '5659XBKUL1',
        'Consola Lenovo Max',
        'Vive el entretenimiento con una nitidez incomparable',
        6461000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c2559a77-b415-4e6c-a7cf-6c291be77684',
        '2ERW2VX9V0',
        'TV Dell Pro',
        'Experimenta una inmersión total con este dispositivo',
        3909000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6ea9428a-73e8-4ae5-b6dd-03f8e7dda16f',
        'AJYA7BSVCI',
        'Audio Dell Elite',
        'Excelente calidad y rendimiento garantizado',
        601000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9613885b-03b9-410a-8045-cfeb4de0f32f',
        'KVUQMG2QO2',
        'Celular Apple Pocket',
        'Excelente calidad y rendimiento garantizado',
        4376000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '70d1b535-4310-49ec-b263-84aadb7d164c',
        '6DMV07BGM3',
        'Laptop Xiaomi Smart',
        'Experimenta una inmersión total con este dispositivo',
        1587000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9049b84e-1bc2-4bf7-9530-30b200878cbe',
        'XGBK5IS97B',
        'Monitor HP Ultra',
        'Disfruta de la mejor tecnología al mejor precio',
        1587000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3857084b-f5e1-4e10-981b-0d0c4afea621',
        'SR0VMJK5RW',
        'Monitor JBL Slim',
        'Excelente calidad y rendimiento garantizado',
        2343000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e59d093a-17b9-4973-b27f-abd11fe59965',
        'H2R636JUR9',
        'Audio LG Pocket',
        'Perfecto para llevar a todas partes',
        1058000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd3e740ce-1a57-4a52-9ae1-0b4a29997c49',
        '64BMHLM31I',
        'Audio Bose Smart',
        'Diseño elegante con potencia excepcional',
        680000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e1da2783-3e30-42b3-b66c-e821157d8ece',
        '9P09YDXMUA',
        'Monitor Microsoft Smart',
        'Ideal para el hogar y la oficina moderna',
        4180000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '956d6a77-1a86-4b74-bc57-3e9daf6786f4',
        '9TOC1MR1K1',
        'Consola Sony Eco',
        'Experimenta una inmersión total con este dispositivo',
        4696000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'da10a3d9-1290-4c2d-830c-315fa23dcc9c',
        'HT4T0GC95Z',
        'Laptop LG Gamer',
        'Experimenta una inmersión total con este dispositivo',
        6957000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a8fff009-aa9c-4c93-add9-36e657f1827a',
        'IQZU9VN8HH',
        'Monitor Microsoft Gamer',
        'Vive el entretenimiento con una nitidez incomparable',
        2136000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '973444f4-0ef8-4906-8e38-6b5f9d061567',
        'GCYID4DZWH',
        'Accesorios HP Premium',
        'Alta durabilidad para superar tus expectativas',
        942000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd18e6a1a-cb5d-485f-999b-6cbeba238959',
        '7ZLDE2KLEP',
        'TV Oster Eco',
        'Perfecto para llevar a todas partes',
        7657000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c42ed39f-fa92-4ce5-8a70-c7e401bdaa0f',
        '1Z8S02GBPT',
        'TV ASUS Eco',
        'Disfruta de la mejor tecnología al mejor precio',
        3211000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '89ab9e53-b34d-4ae9-87fb-be8a0e7572b9',
        'VQRCXJORZL',
        'Audio JBL Elite',
        'Optimizado para un consumo eficiente',
        106000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '70841cb7-722d-4d95-a86e-fa99b724b2b1',
        'OK9DZ4UU29',
        'Audio Bose Ultra',
        'Diseño elegante con potencia excepcional',
        1164000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'baf03432-7a13-48d4-a1dd-55de6166ff03',
        '6CDRTHEBTM',
        'Monitor Apple Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        2956000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bde78bc0-bd42-4065-99b2-fbf5b1896070',
        'KFGTR9QISW',
        'Audio JBL Max',
        'Perfecto para llevar a todas partes',
        372000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '80cdbb16-2dbf-4e7f-8670-c9c0b7bc157f',
        'I1S30TLPF9',
        'Cámara LG Premium',
        'Disfruta de la mejor tecnología al mejor precio',
        4403000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0d98557b-e30a-42b5-8689-29fbeefe40ee',
        'OUPSNFWGPA',
        'Laptop Microsoft Ultra',
        'Perfecto para llevar a todas partes',
        3321000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5ae85dfa-0976-4f10-9999-90460cd295ba',
        '2KCFEYD76X',
        'Cámara Dell Smart',
        'Excelente calidad y rendimiento garantizado',
        2698000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '95522d48-1438-4347-8356-98cdc568cee1',
        'ME50AJZU1C',
        'Monitor JBL Smart',
        'Alta durabilidad para superar tus expectativas',
        1644000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c78dad85-287a-4cba-b384-f4b16fbd8f06',
        '8WURW8HPP0',
        'Laptop LG Eco',
        'Perfecto para llevar a todas partes',
        2778000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd9add85d-36f4-4594-afab-6baf10fc4692',
        'QU9U2FWMMJ',
        'Consola LG Pocket',
        'Diseño elegante con potencia excepcional',
        5108000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '773f061e-28cc-44df-b541-e03f0c01e72a',
        'RX6LP88K8Y',
        'Accesorios LG Gamer',
        'Disfruta de la mejor tecnología al mejor precio',
        1025000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3025bc68-8345-4afe-9e9d-3e7f5a86363b',
        'TSXR4IFZ4B',
        'Consola Whirlpool Gamer',
        'Ideal para el hogar y la oficina moderna',
        3235000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '928be136-482d-4b41-aae8-e7ba06eb5b0a',
        '30ZKCDUZE4',
        'Consola Lenovo Smart',
        'Vive el entretenimiento con una nitidez incomparable',
        4295000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1100d456-9b3a-4034-8d7d-e940b1f0aa84',
        'F8PRULAMCD',
        'Monitor Apple Ultra',
        'Optimizado para un consumo eficiente',
        2113000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '27be1720-c1de-4a14-909c-b06df69cb5e0',
        '7G8PD9PKFK',
        'Smartwatch Bose Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        227000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '11169472-1df7-4271-9208-b603fc26a2d2',
        'PA8JX9H59P',
        'Audio Sony Max',
        'Disfruta de la mejor tecnología al mejor precio',
        784000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '93c0ede9-c67d-405c-b015-6a1b4da9246e',
        'XJAYXRUPHB',
        'Audio LG Max',
        'Optimizado para un consumo eficiente',
        868000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'adba48b2-a1b4-44fc-8600-b041685c4c69',
        'J9D41XYEJM',
        'TV Microsoft Elite',
        'Excelente calidad y rendimiento garantizado',
        8126000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2e6dcbfa-6eaa-425f-bebd-0a750add87f9',
        '3UL12JYCRO',
        'Audio Oster Slim',
        'Ideal para el hogar y la oficina moderna',
        888000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'de6ef502-c267-4732-aeac-1cd0c7cd5db7',
        'P4MYPW82YI',
        'Celular JBL Ultra',
        'Experimenta una inmersión total con este dispositivo',
        3735000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b044a10e-03aa-4b38-98bf-4bfa7db07746',
        '1ZKQPCXHOJ',
        'Audio LG Gamer',
        'Optimizado para un consumo eficiente',
        517000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '38a43037-3aff-40a3-953b-28caa5fa976f',
        'LTQD3BA78U',
        'Consola HP Elite',
        'Diseño elegante con potencia excepcional',
        2056000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f7893b02-0c98-41bf-957f-c69c8393ec05',
        'ASZUDJ25JR',
        'Electrodoméstico Oster Elite',
        'Disfruta de la mejor tecnología al mejor precio',
        244000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'de9b575c-8a04-4e70-9211-a92a09eb985a',
        'TXLQT0PZYX',
        'TV Lenovo Slim',
        'Perfecto para llevar a todas partes',
        1697000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b01611c6-246d-4557-88c5-b43e90b62ca8',
        '7G9VOUHVKZ',
        'Cámara Microsoft Smart',
        'Experimenta una inmersión total con este dispositivo',
        1228000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ef265e12-4903-4d2d-b6ab-7e1ae624b1ca',
        '52MVA1IVRT',
        'Consola Nintendo Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        6609000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '15323cb6-c3a3-4c7c-adb3-eac9bdeebb31',
        'U90N5C6W2D',
        'Cámara Oster Elite',
        'Excelente calidad y rendimiento garantizado',
        1586000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd88f5108-435d-4f5d-aa4a-4f5c50a742f7',
        'NA93FSGFME',
        'Electrodoméstico Nintendo Gamer',
        'Vive el entretenimiento con una nitidez incomparable',
        997000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a0dad2a7-9cc9-4724-800e-eb2b29d26135',
        'MJCSILOM1N',
        'Accesorios Lenovo Premium',
        'Perfecto para llevar a todas partes',
        1187000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ea789627-c8d7-478f-a980-319397afa395',
        '529RN8KA6R',
        'Smartwatch Oster Elite',
        'Perfecto para llevar a todas partes',
        183000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b586436c-b4cd-4a2c-a6b9-5ac36a95cbf6',
        '7NWCSA59P0',
        'Accesorios JBL Slim',
        'Vive el entretenimiento con una nitidez incomparable',
        1110000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7b5eb8dd-4031-42cc-8d4b-ec848a989fb9',
        'QKEM5QQDRE',
        'Audio HP Elite',
        'Diseño elegante con potencia excepcional',
        1160000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6b8b2b0e-f9f4-46fb-bbf8-1544280e5641',
        'PLLTOD1HPV',
        'Accesorios Nintendo Slim',
        'Perfecto para llevar a todas partes',
        1027000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1c3a881c-7f83-4846-95da-73e4802e78ec',
        'WPEG34MD6H',
        'Consola Microsoft Ultra',
        'Vive el entretenimiento con una nitidez incomparable',
        4792000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bc6e0fc8-8149-4c91-bf9c-458d1c09502a',
        'HTH42KUSU0',
        'Laptop Dell Elite',
        'Vive el entretenimiento con una nitidez incomparable',
        7156000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5a723aab-fd0d-423f-b2af-f9940cf1f8c3',
        'I3JXVOKLOH',
        'Electrodoméstico Sony Slim',
        'Ideal para el hogar y la oficina moderna',
        310000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f6f64c87-f1d7-4be2-9f73-4b4a911b200a',
        'SA8E2B2QEB',
        'Smartwatch Sony Pro',
        'Excelente calidad y rendimiento garantizado',
        324000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4cad7db0-6063-4cde-9a3f-0d584bfefebd',
        'OTG82OMKI5',
        'Laptop Xiaomi Premium',
        'Excelente calidad y rendimiento garantizado',
        4533000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0267951d-b3f7-4fac-84e9-928781714152',
        '8CF1PGPZFX',
        'Audio Samsung Gamer',
        'Optimizado para un consumo eficiente',
        885000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'df70d951-e306-4a74-9209-0b977f605d5b',
        'S2Y9RAJCGB',
        'Electrodoméstico Samsung Premium',
        'Perfecto para llevar a todas partes',
        594000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '02fc84c5-2cf1-4587-a905-045e22acc7d6',
        'O5ISSFCOWN',
        'TV Dell Ultra',
        'La herramienta definitiva para potenciar tu productividad',
        3712000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3ce86d88-a1a7-4316-b375-bfe46ea69125',
        'ZKBTYZJY3N',
        'Celular Whirlpool Pocket',
        'Perfecto para llevar a todas partes',
        1991000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '149f3833-45c1-4220-bab6-8ec221ad64a7',
        '29FYC25WCX',
        'Audio Apple Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        482000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a23a8101-c63a-419a-87d4-d4a12ffa567f',
        'MOXO5S32BI',
        'Cámara Dell Elite',
        'La herramienta definitiva para potenciar tu productividad',
        2694000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'df60badd-c5af-4b5a-a234-b4fad21361c2',
        'KYQWLEAU1Z',
        'Consola Samsung Elite',
        'Excelente calidad y rendimiento garantizado',
        2200000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f1f25b0e-405d-4a39-821a-9799e6e37c41',
        'OTHB0E3SE8',
        'Electrodoméstico LG Ultra',
        'Excelente calidad y rendimiento garantizado',
        541000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '24091224-845f-4e7b-96ec-5667bd0e025f',
        'E5NSJXPE09',
        'Celular ASUS Elite',
        'Alta durabilidad para superar tus expectativas',
        4412000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9f006ed0-048d-4460-bb67-fa3e09a8ec08',
        '9Z4EZ2RAKA',
        'Cámara Microsoft Elite',
        'Optimizado para un consumo eficiente',
        833000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '029c204c-53b6-4763-99ca-8fe572f3f55c',
        'G4D0ZKPP2D',
        'Celular ASUS Slim',
        'Perfecto para llevar a todas partes',
        3635000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8d04f418-e97d-44fb-8795-86ad0969c8cb',
        'NL2K40G1LC',
        'Smartwatch ASUS Smart',
        'Optimizado para un consumo eficiente',
        243000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e43c1cfd-039b-4b79-8190-957ba12c43c8',
        'B9QDVTW0M7',
        'Laptop Apple Smart',
        'Excelente calidad y rendimiento garantizado',
        5970000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5a5d0694-4c3f-42da-bd2d-5bc826044a12',
        '7AZG8AYO4N',
        'Accesorios Lenovo Pocket',
        'Vive el entretenimiento con una nitidez incomparable',
        1140000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b44324bf-4332-48df-91ef-c18bd66c6109',
        'O9F7CM9KQO',
        'Audio LG Pocket',
        'Ideal para el hogar y la oficina moderna',
        816000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0628edf4-1fa7-4386-a528-da5fbea7b1ea',
        'X3520AEBC3',
        'Accesorios Oster Gamer',
        'Disfruta de la mejor tecnología al mejor precio',
        984000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'eeb1cbb2-be03-4fc8-a603-5cf92cba3a69',
        '8BL6XBIIJ4',
        'Laptop Oster Premium',
        'Disfruta de la mejor tecnología al mejor precio',
        5251000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1a9b0aab-f438-41a7-baab-0a65c5f38287',
        'MNIWY5YU89',
        'Consola ASUS Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        2185000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cc040609-8870-4ff4-bfa0-92563ef07a39',
        'UACPM0M8C4',
        'Cámara LG Ultra',
        'Vive el entretenimiento con una nitidez incomparable',
        1659000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd1988b75-bd68-4893-bc58-bb5ab14cb7ce',
        'Z7OXTJT4TH',
        'Accesorios Bose Smart',
        'Excelente calidad y rendimiento garantizado',
        421000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4e942d71-00e3-4f37-bce4-2b93c7ccaed5',
        'SA12JIYVME',
        'Celular Apple Ultra',
        'Excelente calidad y rendimiento garantizado',
        4434000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f7f3da89-49f5-4811-a427-2463507dbc3e',
        'AIYHZV4IU9',
        'Monitor Sony Slim',
        'Perfecto para llevar a todas partes',
        3231000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4d3e54ad-739c-4bc1-b537-213b7753e623',
        'FQ3KOG98H9',
        'Laptop Sony Slim',
        'Excelente calidad y rendimiento garantizado',
        3220000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0532b378-c09c-4e25-a5d4-ecc69b980442',
        'G0VORY2GV7',
        'TV JBL Elite',
        'Excelente calidad y rendimiento garantizado',
        2142000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '74c9c842-bbb9-4a52-8d44-ef706658ac22',
        '3UWQLXC15T',
        'TV LG Gamer',
        'Experimenta una inmersión total con este dispositivo',
        6493000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f09e45c8-2263-4000-913e-e99a8612c043',
        'F84T38TPCU',
        'Monitor Microsoft Gamer',
        'Excelente calidad y rendimiento garantizado',
        2992000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b644f349-367c-404c-8f90-0b354e0783bb',
        'UM8E3GQ9SE',
        'Laptop Lenovo Pocket',
        'Alta durabilidad para superar tus expectativas',
        7609000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f04dd5a9-4998-432f-8ba1-39b2d4d65067',
        '89WAYULAM5',
        'Celular Apple Max',
        'Ideal para el hogar y la oficina moderna',
        4453000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'beb9766e-ad1c-4cd3-b470-0158c92011ae',
        'V49F8RIDU0',
        'Celular Microsoft Pocket',
        'Perfecto para llevar a todas partes',
        3891000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '27c9ea00-3314-440e-9167-541137635ef8',
        'GXWQWR3V47',
        'Celular Dell Slim',
        'Diseño elegante con potencia excepcional',
        1485000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2668f28a-be31-4496-bc6c-3403a5587c05',
        '47JS1V8FAF',
        'Laptop Xiaomi Slim',
        'Perfecto para llevar a todas partes',
        7216000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cfe38a84-52ce-45d5-857d-49e1799134eb',
        'CK2WLY42X1',
        'Audio Oster Eco',
        'Experimenta una inmersión total con este dispositivo',
        1176000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7f5825e0-91c7-41b5-a46d-cc338a8d144c',
        '0H2MZPUXW2',
        'Monitor Whirlpool Eco',
        'Disfruta de la mejor tecnología al mejor precio',
        1689000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '610d6413-d661-4ad5-af57-e5ecf9413ee7',
        'JAQZCFLKEE',
        'Laptop Xiaomi Pro',
        'Experimenta una inmersión total con este dispositivo',
        7318000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5a7577ae-c327-4e19-b397-ac9b40fd5833',
        '3TW0MR6RN8',
        'Smartwatch Sony Premium',
        'Ideal para el hogar y la oficina moderna',
        273000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2931d562-d929-4ecd-906e-8979e5ab5c27',
        'Q3EMZI31ND',
        'Celular Bose Premium',
        'Vive el entretenimiento con una nitidez incomparable',
        3405000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd30969fb-0d2e-4f7d-a5be-ee6679188ca2',
        '3TASHWJ7QE',
        'Monitor Nintendo Smart',
        'Excelente calidad y rendimiento garantizado',
        3701000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f3a12400-642e-4560-8482-5f6177e6e422',
        'TB5HJHFO9T',
        'Smartwatch LG Ultra',
        'Excelente calidad y rendimiento garantizado',
        1019000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '288994a7-3558-403a-b7b2-ff85216954eb',
        '08RFS589NA',
        'Cámara Microsoft Premium',
        'Vive el entretenimiento con una nitidez incomparable',
        2515000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0b700181-0998-4ebb-b357-2f572165eecb',
        'A317D2C2H8',
        'Laptop HP Pocket',
        'Alta durabilidad para superar tus expectativas',
        7831000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '44a1bee2-f291-4e78-9ee3-b4ae2083ff15',
        '5YZO1QSBCS',
        'Monitor Microsoft Gamer',
        'Alta durabilidad para superar tus expectativas',
        2787000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f5427f51-6740-43ee-88a3-77d875d90eef',
        'G3V1QL8214',
        'TV Oster Pocket',
        'Experimenta una inmersión total con este dispositivo',
        4515000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bd7e9b43-5665-4e92-95d5-44624d812880',
        'P6APNZ2668',
        'Accesorios Sony Ultra',
        'Optimizado para un consumo eficiente',
        325000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ef5feef2-f78d-4d03-a229-d20182c732dc',
        '4Q93B9S4R7',
        'Cámara Sony Slim',
        'Diseño elegante con potencia excepcional',
        3107000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '94596424-44bf-4e8b-beda-46ecf31a810c',
        '8HE0I25Z3E',
        'Laptop Microsoft Max',
        'La herramienta definitiva para potenciar tu productividad',
        5902000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c763e937-7b25-41ea-9a0a-89024a187d83',
        '39YMLJECQG',
        'Audio Oster Smart',
        'Diseño elegante con potencia excepcional',
        1127000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'eb90db03-743d-423f-8fa4-7e234df245e2',
        'B7Y6V1TDUP',
        'Accesorios Microsoft Slim',
        'Optimizado para un consumo eficiente',
        453000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1b44fef4-9743-450b-96fe-76aad037a900',
        'I5M7NYO2V4',
        'Audio HP Premium',
        'Ideal para el hogar y la oficina moderna',
        751000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fc8ec866-55a2-41bb-9652-6ba91dbb2a1d',
        '7EFQXP1SI7',
        'TV Lenovo Max',
        'Perfecto para llevar a todas partes',
        1833000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c741861a-1f25-4dec-8a43-c520608f58b0',
        'F1XDYN6VKR',
        'Audio Sony Gamer',
        'Ideal para el hogar y la oficina moderna',
        584000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '717443e4-da58-4b07-a17b-f607cde421e6',
        '9O3P31EZAN',
        'Monitor Lenovo Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        1989000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9d185d40-9e51-4d1a-a486-83112cdefb30',
        '8CFMM7G6CD',
        'Cámara HP Gamer',
        'Ideal para el hogar y la oficina moderna',
        3359000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '35b3f106-b62d-4c24-bc41-84a29a87f316',
        '8LGVM4VLB6',
        'TV Sony Eco',
        'Alta durabilidad para superar tus expectativas',
        6175000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1bc1cf9b-a320-42d6-b240-1e597af6a963',
        '59HYOIFU8T',
        'TV JBL Slim',
        'Alta durabilidad para superar tus expectativas',
        3860000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'cfe2c765-81ea-4f37-a5e2-256f3dce6b8b',
        'P0PMD4W41J',
        'TV LG Max',
        'La herramienta definitiva para potenciar tu productividad',
        3718000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '289a2ed2-f5cb-4d3c-88d5-4e1abac23ff2',
        'DOUWQ1T6L0',
        'TV HP Slim',
        'Excelente calidad y rendimiento garantizado',
        8285000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e11522ac-a476-4bb8-a46b-14efca6880a9',
        'QOE6OHT014',
        'Celular ASUS Max',
        'Vive el entretenimiento con una nitidez incomparable',
        1506000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e0011470-826a-4c7d-8473-b4c3ab365674',
        'FS9N3X2G9Q',
        'Monitor Xiaomi Gamer',
        'Optimizado para un consumo eficiente',
        3069000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '59eb4fd9-3616-470a-9934-74646e1e865d',
        'FNBXMKF0LY',
        'Laptop JBL Elite',
        'Diseño elegante con potencia excepcional',
        5479000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8f4167e6-7572-4445-adda-052c22416fdf',
        '3ECU8JA944',
        'Audio Microsoft Eco',
        'Excelente calidad y rendimiento garantizado',
        642000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bfb8d9c8-e662-435a-81ef-27baa07088c7',
        'L346GZZT20',
        'Electrodoméstico Dell Pocket',
        'Diseño elegante con potencia excepcional',
        589000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1c40b378-bddd-4a22-9861-e0e6a3a0742e',
        'YQKJHBA9FD',
        'Smartwatch Oster Premium',
        'Excelente calidad y rendimiento garantizado',
        630000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2b22400c-3309-45e3-9979-4fc682362679',
        'M984YJZKZU',
        'Laptop Xiaomi Smart',
        'Vive el entretenimiento con una nitidez incomparable',
        8400000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0d3c32e1-59f0-4096-9c9b-24db492b5a71',
        '8SQJCT75Z7',
        'Consola Dell Elite',
        'La herramienta definitiva para potenciar tu productividad',
        8247000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'fd3fff04-b4c6-4fe8-8128-c7c5bee6007e',
        'YOZHHNFOBT',
        'Accesorios Nintendo Max',
        'Disfruta de la mejor tecnología al mejor precio',
        238000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '45f5bb98-682b-4877-a27c-1d52662197b8',
        'BVSD8N74L3',
        'TV Lenovo Ultra',
        'Perfecto para llevar a todas partes',
        8001000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5c6eb85f-4a41-490c-bb72-6328db231d19',
        '35665H6IIH',
        'Smartwatch Sony Max',
        'Perfecto para llevar a todas partes',
        1073000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '53567fcd-b1ec-4572-8a5b-9d600f19758c',
        'YM64CYNV6C',
        'Celular Sony Elite',
        'Alta durabilidad para superar tus expectativas',
        3770000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '35c9cc17-d84f-4489-bd39-27889d7a2066',
        '1OHZKLXHEE',
        'Smartwatch Oster Gamer',
        'Alta durabilidad para superar tus expectativas',
        1105000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9e3ae558-a69c-4153-883b-1b6c6b2bee22',
        'P1W0YX2782',
        'Smartwatch ASUS Elite',
        'Vive el entretenimiento con una nitidez incomparable',
        1093000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '65c88ae7-c10d-44ae-9755-d29ae4bf88fe',
        'DZIJJXNVIU',
        'TV Oster Premium',
        'Diseño elegante con potencia excepcional',
        3116000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e872958b-aa42-4da1-9667-3f050ce1c4ca',
        '4E4BHDQK7X',
        'Smartwatch HP Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        909000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '13c8d559-e19f-4f3a-8cbb-ee43a067ad19',
        'V4BJJQCQDG',
        'Laptop HP Pocket',
        'Experimenta una inmersión total con este dispositivo',
        1899000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2e3bf90a-5905-422b-89af-1a404721f587',
        '5DARXDHN9B',
        'Smartwatch Dell Elite',
        'Perfecto para llevar a todas partes',
        1109000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b1dd2306-5fe0-4b66-bce1-8443bc3b9e85',
        'EXCLMZI711',
        'Accesorios Oster Ultra',
        'Excelente calidad y rendimiento garantizado',
        344000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a49f7f92-dd97-436b-9c20-e2a85d37c5b1',
        '60ZFKHZGBS',
        'Monitor Oster Pro',
        'Ideal para el hogar y la oficina moderna',
        2737000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '465c1c2a-07b8-4f46-948d-6eb9d94796c2',
        '9TA72EVJU5',
        'Electrodoméstico LG Pro',
        'Excelente calidad y rendimiento garantizado',
        985000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a06014eb-cd75-43ef-a284-a40c2218483a',
        '257024WR3N',
        'Electrodoméstico HP Gamer',
        'Experimenta una inmersión total con este dispositivo',
        735000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'af2c0b45-ff6e-4185-a940-e4e7fbff27f6',
        'O7VXLP396C',
        'Cámara Dell Ultra',
        'Disfruta de la mejor tecnología al mejor precio',
        4044000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e6870c2c-4c0e-40cf-919f-aa62bba417a2',
        'C3FT1HOLLR',
        'TV Whirlpool Slim',
        'La herramienta definitiva para potenciar tu productividad',
        3010000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e5235140-16b0-4430-a32c-6fb063f78005',
        'DEWR7P5KZC',
        'Audio Samsung Gamer',
        'Vive el entretenimiento con una nitidez incomparable',
        929000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '43ae2437-7d38-4078-a81d-01755e81ad8c',
        '0QH9I9NI39',
        'Cámara Sony Eco',
        'Experimenta una inmersión total con este dispositivo',
        3348000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8c71c421-17d3-406c-999d-6a35ce6ef180',
        'KMUPHX8XAA',
        'Consola Nintendo Smart',
        'Perfecto para llevar a todas partes',
        3240000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '508cc8d4-cb15-4128-83d8-caa72d4902f6',
        'L8D3FEJYVU',
        'Audio Xiaomi Premium',
        'Optimizado para un consumo eficiente',
        362000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8d50f9f2-98f9-45c6-add0-cb51bd13dfc2',
        '71X7WFQZ42',
        'Celular ASUS Ultra',
        'Optimizado para un consumo eficiente',
        2215000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7be90c4a-d8a0-4b27-9989-d9c8ed4827bc',
        '7ORLS7YOCL',
        'Consola Oster Pocket',
        'Optimizado para un consumo eficiente',
        1888000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bfcd246d-7714-4515-93b3-97e97e004528',
        'KU4QYO9MMO',
        'Smartwatch Microsoft Gamer',
        'La herramienta definitiva para potenciar tu productividad',
        631000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a065c335-1fda-47b8-a844-4afe9f7589fe',
        '5PJNXRJRIH',
        'Audio LG Premium',
        'Optimizado para un consumo eficiente',
        861000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ad16a7fd-26bb-434f-a757-6474b66317d0',
        'I4A240NNJ5',
        'Celular HP Ultra',
        'Experimenta una inmersión total con este dispositivo',
        2938000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8b6a1dcc-92e6-4eaa-8ea8-0c22ed10d349',
        'HCW7YM3MZJ',
        'Cámara LG Max',
        'Disfruta de la mejor tecnología al mejor precio',
        2620000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a9d70816-041c-4387-abd5-9d30fe414af7',
        '643UXXEI9I',
        'Consola Apple Premium',
        'Optimizado para un consumo eficiente',
        7695000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd975c2cd-acbc-495c-ba82-cc9fd4912f9d',
        'RFMLCJ4MLP',
        'Celular Bose Ultra',
        'Alta durabilidad para superar tus expectativas',
        3074000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd637256b-b621-4799-afb2-325973072bbf',
        '99FE3DU0SR',
        'TV Bose Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        1802000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd7a8c0d4-173c-4f6c-9c19-fe367bf629cf',
        'W6M1SRYIL7',
        'Monitor Oster Smart',
        'Optimizado para un consumo eficiente',
        2366000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd882cf59-abaf-40ba-a281-573e8efef46e',
        'MXB6V9BPIM',
        'Consola Apple Slim',
        'Disfruta de la mejor tecnología al mejor precio',
        6865000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '09090815-1274-4242-b859-b38cea41d39a',
        '18Z4QJUV7A',
        'Celular Lenovo Max',
        'Disfruta de la mejor tecnología al mejor precio',
        1167000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '42360813-9cdd-434d-9cfe-297d42c45268',
        '6EJCJHJ858',
        'TV Sony Gamer',
        'Alta durabilidad para superar tus expectativas',
        5481000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c7c3584e-ea24-4ed1-8817-9ca56b49bce2',
        'DOL1W8CLXC',
        'Accesorios Lenovo Ultra',
        'Alta durabilidad para superar tus expectativas',
        891000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a025ede5-8b93-4a03-877b-7361bca3f871',
        '82WCR6W5ZJ',
        'Monitor Nintendo Elite',
        'Alta durabilidad para superar tus expectativas',
        3005000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a50daca9-d57b-488d-a20a-19bb6bf79b66',
        'UCDT2EKYQE',
        'TV Apple Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        7316000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'afe3e41f-a660-4a78-9dfb-b934c6f7b76c',
        '2QBBD3YQQC',
        'Laptop Samsung Gamer',
        'Ideal para el hogar y la oficina moderna',
        1955000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4a97e78a-d47a-45b2-ae0d-abd115bf09a5',
        '55AA7MV698',
        'Smartwatch Xiaomi Slim',
        'Ideal para el hogar y la oficina moderna',
        1001000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'babd7d68-33fb-4e07-8cf1-26e0f021ccd7',
        'O3HERZIAWZ',
        'Electrodoméstico Apple Elite',
        'Ideal para el hogar y la oficina moderna',
        294000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ce48b1fb-8199-487b-a4fa-1e95643d030a',
        'IWJPUHZEFN',
        'Electrodoméstico Whirlpool Max',
        'Vive el entretenimiento con una nitidez incomparable',
        470000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9120a877-dd7d-461e-9d4a-c292264ca206',
        'XIMAPP368A',
        'Audio Xiaomi Pocket',
        'Alta durabilidad para superar tus expectativas',
        790000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2f0e6c5d-de2c-4425-92bd-f8780d596fab',
        'W3ZNE91ZDK',
        'Laptop Samsung Pro',
        'Perfecto para llevar a todas partes',
        5082000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0062ca5d-a6c5-40ef-a3f2-4dbb8fb44231',
        'WCTBU9DDPH',
        'Laptop Microsoft Premium',
        'Perfecto para llevar a todas partes',
        5747000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '42501449-2853-4831-b918-f55c3528a52a',
        'VATM66EJUQ',
        'Audio Xiaomi Smart',
        'La herramienta definitiva para potenciar tu productividad',
        285000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e04cf490-a769-462f-b1ce-86b490858729',
        '2MJD3QDM14',
        'TV Bose Gamer',
        'Ideal para el hogar y la oficina moderna',
        6192000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6115d9bf-8022-420c-bd62-9bf02148f20e',
        'W87OM88ZS7',
        'Audio JBL Gamer',
        'Excelente calidad y rendimiento garantizado',
        1022000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a3553817-1c18-4668-ae10-ca84c08bfd65',
        'TGUBTWW7N0',
        'Audio ASUS Elite',
        'Disfruta de la mejor tecnología al mejor precio',
        843000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8af76d82-5240-4b6b-bd11-fab33851c324',
        'I2R2KXLCBA',
        'Electrodoméstico LG Pro',
        'Diseño elegante con potencia excepcional',
        456000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '112d60a7-c7b4-4236-bc7f-fdfd78682191',
        '5XIXPLMAF0',
        'Consola Whirlpool Max',
        'Alta durabilidad para superar tus expectativas',
        6830000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '25d7e116-06ee-4529-8c2b-148056be3c21',
        'B5YSDEQFNB',
        'TV Oster Smart',
        'Diseño elegante con potencia excepcional',
        7786000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '72691d73-381b-4816-9ce8-097554b4b07b',
        'YNEJVIPFKH',
        'Audio LG Eco',
        'La herramienta definitiva para potenciar tu productividad',
        642000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '11edd4b0-361b-4beb-9557-f476aa666286',
        'S18S83VWZE',
        'Audio Lenovo Gamer',
        'Optimizado para un consumo eficiente',
        873000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'b3d97345-b64f-4ff7-8f6f-737ade2dc60f',
        'ZVLYXYMJPB',
        'TV Xiaomi Max',
        'Optimizado para un consumo eficiente',
        2909000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '65f796a5-d8ed-4da2-9427-0e8bec58035a',
        'DQ6F26VX50',
        'Audio Whirlpool Pocket',
        'Diseño elegante con potencia excepcional',
        534000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '88fe750b-7ff3-4735-b528-87228cb7e031',
        'TXMBFUXK9Z',
        'TV Nintendo Max',
        'Disfruta de la mejor tecnología al mejor precio',
        6916000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e879cb23-c081-43e4-8085-f75c0e4057e7',
        'S9ASRITJTA',
        'Celular Dell Gamer',
        'Experimenta una inmersión total con este dispositivo',
        4184000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '59636ba3-3b8a-4517-bdcd-ac1fb1e7c23e',
        'ONWJBN3W19',
        'Smartwatch Whirlpool Eco',
        'Ideal para el hogar y la oficina moderna',
        359000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e1ba8e15-ef9f-4e17-833f-cbfc1afb0818',
        'UN0QTXR7KR',
        'Audio Whirlpool Gamer',
        'Ideal para el hogar y la oficina moderna',
        150000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '67ed9378-62e6-4a70-bcce-1b55a4e6114b',
        'D29NAUN0KG',
        'Celular Xiaomi Pro',
        'Ideal para el hogar y la oficina moderna',
        1259000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a2822c0c-6e7a-43a3-ab06-4ac006015360',
        '1UKDVYT075',
        'TV ASUS Pocket',
        'Excelente calidad y rendimiento garantizado',
        4963000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'db824379-dc25-4170-9b07-c42af39c337d',
        'I3T92D93JH',
        'Consola Lenovo Gamer',
        'Diseño elegante con potencia excepcional',
        4407000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c9a92a10-7c85-4a91-9ab6-b1ef9501de47',
        'EIVLAOESGH',
        'Smartwatch Whirlpool Ultra',
        'Experimenta una inmersión total con este dispositivo',
        900000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6231baf5-f7a3-4178-92f1-081353d4b5b7',
        'ITJ32IX1SJ',
        'Laptop ASUS Smart',
        'Optimizado para un consumo eficiente',
        4586000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '50ab59d9-9c91-4e50-8500-297571c43cd0',
        '0JM1WZQKJN',
        'Consola Whirlpool Eco',
        'Optimizado para un consumo eficiente',
        4933000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'aaebbe23-38a1-4d82-93f2-5ff6db0b0646',
        'FP4HY9FCV3',
        'TV Bose Max',
        'Vive el entretenimiento con una nitidez incomparable',
        2402000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '639e5a5e-c9ed-44ce-875f-b9b52c363699',
        'VNWYKJI85H',
        'Cámara Samsung Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        2107000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bcd8d72d-4279-43b9-9438-45ac470d1a4c',
        '4YP4S0RXLW',
        'Celular Bose Slim',
        'Excelente calidad y rendimiento garantizado',
        3792000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '9254d12c-314e-41e2-8dbc-eda94e17c556',
        'IY676E0FST',
        'Accesorios LG Eco',
        'La herramienta definitiva para potenciar tu productividad',
        285000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'da99e9e6-663a-4d54-bf20-538edb800b14',
        '2FHGF2CSAA',
        'Audio Xiaomi Elite',
        'Alta durabilidad para superar tus expectativas',
        531000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '79767373-7b10-41a7-b2b3-193df841d422',
        'Q8NLN88T2B',
        'Consola HP Slim',
        'Alta durabilidad para superar tus expectativas',
        5014000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5930f621-a41f-47d0-a71d-b880470f0f74',
        'FV3Y9OIZSB',
        'TV HP Smart',
        'Alta durabilidad para superar tus expectativas',
        7454000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8cfab757-fe5d-49c5-acd1-0a8c6cfcf840',
        '19CFQB124N',
        'Smartwatch Bose Pro',
        'La herramienta definitiva para potenciar tu productividad',
        960000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6898cce6-6d72-4748-9f09-a55014f91ff1',
        '5HC0JE2UE4',
        'Smartwatch Oster Pro',
        'Disfruta de la mejor tecnología al mejor precio',
        1131000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1e3017c7-8fa6-47ff-867a-cd0a3f5c419e',
        'AXVX22FKHD',
        'TV Bose Max',
        'Alta durabilidad para superar tus expectativas',
        3745000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '666f1548-9fb9-462e-a66e-24f4456b47a3',
        'LAX4B78622',
        'Accesorios Samsung Smart',
        'Disfruta de la mejor tecnología al mejor precio',
        278000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '290ebfe6-a488-4d07-adee-66e54d80f194',
        '6JPLD4LX3C',
        'Monitor ASUS Pocket',
        'Disfruta de la mejor tecnología al mejor precio',
        1340000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '376fa299-085c-4eac-8d93-295c689b0d16',
        '8G2D6VXX5G',
        'Smartwatch Bose Premium',
        'Alta durabilidad para superar tus expectativas',
        492000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '62968490-2233-45ce-81bf-bfd04063dea2',
        'DIH3L6FO87',
        'Laptop Oster Eco',
        'Disfruta de la mejor tecnología al mejor precio',
        2516000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '556330b3-c90c-4cc7-a4f6-65720f962e09',
        'RV6LHIBAAT',
        'Laptop HP Premium',
        'Perfecto para llevar a todas partes',
        4230000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '391e7f32-09be-4b7c-9665-ad988a0c874e',
        'P8Q5O5UH0X',
        'TV Whirlpool Max',
        'Alta durabilidad para superar tus expectativas',
        5694000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ead0e331-aff5-4f76-84c2-9db58cf630c1',
        'GWNSDGZC34',
        'Consola Microsoft Slim',
        'Perfecto para llevar a todas partes',
        4903000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '13545bf4-b506-4672-b25d-29931c5c26f1',
        'MB3398LVBS',
        'TV Whirlpool Gamer',
        'Diseño elegante con potencia excepcional',
        5901000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'eff764d8-191f-43e1-89ca-6b8e6aba7dcf',
        '868M0RT2VN',
        'Smartwatch Sony Pro',
        'Perfecto para llevar a todas partes',
        773000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2797a875-925a-458a-90de-be27bedab8f5',
        'KLQJD81YDX',
        'Cámara HP Smart',
        'Ideal para el hogar y la oficina moderna',
        3843000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '37ebcef2-3b10-4dc1-ba5e-9dc985998086',
        '40WJP7L1Y6',
        'Monitor Whirlpool Elite',
        'Diseño elegante con potencia excepcional',
        1298000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a54a85f8-0a2c-4644-a018-086a61d43d0d',
        'MOGU6FFVWH',
        'Celular ASUS Max',
        'Perfecto para llevar a todas partes',
        3655000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0b3e9c04-8bba-4a84-be41-7c85e663db68',
        'L1LLLKLEB7',
        'Celular ASUS Elite',
        'Perfecto para llevar a todas partes',
        3191000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd331ab2f-4a9a-4a2d-b54e-241350527e8f',
        'L5G5K2HFDZ',
        'Consola Microsoft Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        4334000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3e953464-f622-4e3d-a4fd-71e40ed1e88d',
        'Z16WD64CT5',
        'Laptop Apple Ultra',
        'Diseño elegante con potencia excepcional',
        5351000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '58759c3f-66f0-4941-a98a-33843bbf047f',
        'P3ZN82CKN3',
        'TV Oster Pocket',
        'Optimizado para un consumo eficiente',
        6344000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bd65746c-6f1d-4789-8f53-a4cd31bd8f51',
        'YO56KB6F59',
        'Laptop Oster Smart',
        'Vive el entretenimiento con una nitidez incomparable',
        8360000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '75daa9e2-a6da-46cf-a2fc-1d99002da86f',
        'MDRER3VVAD',
        'Consola LG Ultra',
        'Excelente calidad y rendimiento garantizado',
        4707000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6a18a5cd-95b4-4bb3-9cd5-0676cf18e729',
        'QCHWJ7L5JO',
        'Electrodoméstico Samsung Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        591000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '3b306e0f-219b-4ad3-b071-3aabd92069f3',
        'W28EABJ63P',
        'Electrodoméstico Sony Elite',
        'Diseño elegante con potencia excepcional',
        718000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '6ba4e097-ef2c-43f7-81d2-c69d7a67aaa8',
        'D8PZ9B75YJ',
        'Audio LG Premium',
        'Excelente calidad y rendimiento garantizado',
        555000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '13b076ef-a8b5-48d6-bcaa-de0e53a210f0',
        'KD51NHHDL3',
        'Cámara Xiaomi Eco',
        'Alta durabilidad para superar tus expectativas',
        3572000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '1d8f36ea-f2cf-4eec-b660-fef0417b69f2',
        'PDCR9EKWWG',
        'Cámara Lenovo Eco',
        'Perfecto para llevar a todas partes',
        2662000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '701729d3-f270-47a7-9034-7c94f1629a30',
        'W1TLZDEEKM',
        'Laptop Bose Premium',
        'Diseño elegante con potencia excepcional',
        3115000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'dcb1f3f6-ce4b-461d-8b55-83721157354d',
        'AWZ1LS7XW1',
        'Accesorios JBL Slim',
        'Diseño elegante con potencia excepcional',
        223000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4a5515a5-3776-4933-aa86-7f3872f05522',
        '6Z5OIJK7S0',
        'Celular Whirlpool Eco',
        'Alta durabilidad para superar tus expectativas',
        997000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '38229804-be92-491d-8f18-5f4f47042e58',
        'PPBW49KTXC',
        'Accesorios LG Elite',
        'Excelente calidad y rendimiento garantizado',
        961000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8681a032-db72-4dbe-a44a-9d4077b52604',
        '3LEL0RUARG',
        'Audio HP Max',
        'Ideal para el hogar y la oficina moderna',
        1050000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '04fd0e89-eaf0-4e47-ad3f-e8939b318bea',
        'UNHKJCKIJB',
        'Cámara Microsoft Eco',
        'Ideal para el hogar y la oficina moderna',
        1258000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '350d8d49-7513-4d6e-a797-822801b86a22',
        '7YU4H7BUU5',
        'Accesorios Bose Premium',
        'Ideal para el hogar y la oficina moderna',
        981000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'be7e324c-b455-474d-ad0f-cd5b60f538f7',
        '2OHHFBU1BI',
        'Cámara Lenovo Max',
        'Optimizado para un consumo eficiente',
        3890000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '98e1560c-c30a-45ba-92f4-173194c8446d',
        '2OPASFTHR0',
        'TV JBL Pro',
        'La herramienta definitiva para potenciar tu productividad',
        4287000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '29a304c9-9bb1-46fa-8589-5bd1f6835185',
        'FDR9P9YXR7',
        'Cámara JBL Premium',
        'Excelente calidad y rendimiento garantizado',
        3572000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '94881671-2c28-4997-937d-c3aa0ac12543',
        'ELUDOWHUX3',
        'Celular ASUS Elite',
        'La herramienta definitiva para potenciar tu productividad',
        1666000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'dc777907-640f-4fde-911c-ad72638b469a',
        'EB2ETKCLJM',
        'Electrodoméstico HP Pocket',
        'Ideal para el hogar y la oficina moderna',
        1090000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4191226f-65a4-4def-9279-1bc8567dbe0c',
        'FVOOALE9T2',
        'Laptop Whirlpool Max',
        'Optimizado para un consumo eficiente',
        5487000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ac1e4a81-e12e-4b97-8ea8-feec0b92c7ca',
        'LPSNNPXOHH',
        'Laptop Dell Max',
        'Diseño elegante con potencia excepcional',
        4417000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c307ef4b-3a08-4ef2-8e27-e410f0dde630',
        'Z0EUJ4YOZV',
        'Smartwatch Xiaomi Pocket',
        'Optimizado para un consumo eficiente',
        945000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f22beff8-f8f4-45c8-b4c4-2eb878c9f3c5',
        'IQUMWA3U6V',
        'Electrodoméstico Xiaomi Eco',
        'Ideal para el hogar y la oficina moderna',
        865000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '16b0a28f-aa1b-4a6a-bb87-a0247b6fbf53',
        '4KMCR12IHC',
        'Cámara Xiaomi Smart',
        'Alta durabilidad para superar tus expectativas',
        3087000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4cdcee3d-371f-4628-a3f9-b0248f24216d',
        '0S23KN82AB',
        'Accesorios Lenovo Ultra',
        'Alta durabilidad para superar tus expectativas',
        158000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'de8d352f-cd6b-4741-a908-d3ea102a224b',
        'L3E7UP23CJ',
        'TV ASUS Ultra',
        'Excelente calidad y rendimiento garantizado',
        6571000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f696307e-1148-4d6a-a0bc-957e8fdf0bba',
        '32GUL3E3Q1',
        'Smartwatch LG Gamer',
        'Excelente calidad y rendimiento garantizado',
        714000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '071b21fa-3f1a-49ab-9ef6-a2edc16e0a5b',
        'YXZ192RLKQ',
        'Accesorios Xiaomi Elite',
        'Experimenta una inmersión total con este dispositivo',
        773000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'ce3d8f75-203e-4d9a-ba47-60f60b2f8b08',
        'EWJQ8N7E94',
        'Electrodoméstico Whirlpool Max',
        'Excelente calidad y rendimiento garantizado',
        124000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'e121ea16-4b8d-413a-9161-b2baf48103bf',
        'PNSJQJ187W',
        'Audio Lenovo Pocket',
        'Experimenta una inmersión total con este dispositivo',
        655000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '0557701d-257f-4e61-a8c3-20660882f2e9',
        'ZWPZTUQ5FN',
        'TV Dell Max',
        'Excelente calidad y rendimiento garantizado',
        7969000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '79df2db9-cc0e-4d63-bbca-6354a017c784',
        'S8NEWLYVA1',
        'Celular Nintendo Max',
        'Perfecto para llevar a todas partes',
        1123000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'c64f9046-4f9d-4d75-992b-c8bc20ccd101',
        'K8IT31H855',
        'Electrodoméstico Whirlpool Premium',
        'Perfecto para llevar a todas partes',
        185000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2180fd85-dcd1-4176-869a-74448bfba397',
        '4GA2S70J36',
        'Celular Apple Pocket',
        'Vive el entretenimiento con una nitidez incomparable',
        2697000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bc6c8958-73c6-4191-8f89-0012aeba5a60',
        'MY4UMFSHM2',
        'Electrodoméstico Apple Elite',
        'Disfruta de la mejor tecnología al mejor precio',
        850000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a86668a3-3abb-4c53-b172-404f4dff4052',
        'YT63O9R5KC',
        'Monitor Whirlpool Pro',
        'Alta durabilidad para superar tus expectativas',
        1323000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'dd4e4c64-b199-4162-9963-fa4871c47209',
        '76UI7TLKQ9',
        'Laptop Microsoft Pro',
        'Perfecto para llevar a todas partes',
        7156000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '88678124-27cd-49b4-846a-8e9a43f11980',
        'MHIZXYNH8E',
        'Celular Bose Max',
        'Excelente calidad y rendimiento garantizado',
        1253000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '7edf9584-da6d-48cc-8bf8-7658f066c6bc',
        'DDCCYEUEEF',
        'Cámara Lenovo Pocket',
        'Experimenta una inmersión total con este dispositivo',
        1155000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4bbd4245-5750-4d47-abc8-1260bbe6f4ef',
        'E6UCB8TEEQ',
        'Consola Lenovo Elite',
        'Excelente calidad y rendimiento garantizado',
        7016000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '07d2845b-bf24-4033-944c-d7a910d847aa',
        'XV47FHTZ1M',
        'Monitor Microsoft Gamer',
        'Alta durabilidad para superar tus expectativas',
        2651000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '188f59b6-af22-4c4a-9bb2-dff9330b0835',
        '2VI477ZNFO',
        'TV Nintendo Pro',
        'Experimenta una inmersión total con este dispositivo',
        5103000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd76c0578-3b7e-4118-a24a-69f4a4b8c046',
        'EG0YVNUTKL',
        'Smartwatch ASUS Pro',
        'La herramienta definitiva para potenciar tu productividad',
        583000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'd997394b-9319-4015-8de3-9f01ee134dd7',
        'F0T8GGFFEV',
        'Cámara Nintendo Ultra',
        'La herramienta definitiva para potenciar tu productividad',
        4149000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f94f9472-39b9-47a6-afe9-a3971b443c25',
        '07AZW4RH1D',
        'Audio Samsung Smart',
        'Optimizado para un consumo eficiente',
        486000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4d729717-6150-4084-a180-c8fbdc144cfe',
        'C45OSF1VIS',
        'Monitor ASUS Premium',
        'Disfruta de la mejor tecnología al mejor precio',
        3812000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'f67d451c-27d0-4b5f-988c-1c64f8f91c3c',
        '7E289JVB3J',
        'Smartwatch LG Slim',
        'Experimenta una inmersión total con este dispositivo',
        553000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '5a59ecf1-fe86-49f6-9104-2b18b4177689',
        'ESXXPVWFOV',
        'Cámara Oster Pocket',
        'Alta durabilidad para superar tus expectativas',
        2148000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '90d847ba-b636-45e3-a383-5437d1abdb1a',
        'GTE1N34APL',
        'Cámara Lenovo Gamer',
        'Perfecto para llevar a todas partes',
        4073000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '37a8340c-f631-4330-a462-f38e5b1662a3',
        'N0QL3MA1Y9',
        'Smartwatch Microsoft Pro',
        'Vive el entretenimiento con una nitidez incomparable',
        130000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '40f3a543-7bd3-45e4-90c7-b68140d7903a',
        'W3U1DQJNNO',
        'Audio Apple Max',
        'Optimizado para un consumo eficiente',
        356000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'bc54f563-77c8-468b-a1d4-3f6b765dfdf2',
        'LQEQ17U1GN',
        'Audio Lenovo Slim',
        'Vive el entretenimiento con una nitidez incomparable',
        124000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '00c9c182-b555-432a-bcc3-a6ef669af92e',
        '9H9VY3NLJZ',
        'Cámara Nintendo Premium',
        'Experimenta una inmersión total con este dispositivo',
        3527000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '00155c4d-2877-4cc7-a571-212649469290',
        'PDDLPQ8SVS',
        'Celular Dell Max',
        'Diseño elegante con potencia excepcional',
        2770000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '8ff0d901-7266-4c58-969d-e6aafe676fa0',
        'SCU2M2T45K',
        'Celular ASUS Ultra',
        'Alta durabilidad para superar tus expectativas',
        2607000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '2eb43639-b9c2-4005-82ad-be53ec72d324',
        '3ECODTCXAB',
        'Celular Sony Pro',
        'Diseño elegante con potencia excepcional',
        2424000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '29b66665-4a8b-4fd4-937c-2e79ce17ed14',
        'GRG0UDY174',
        'Consola Microsoft Pocket',
        'Diseño elegante con potencia excepcional',
        1666000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '81ce4f36-e0da-44d3-914c-0860309c6d51',
        'NE7Z8HBWGV',
        'Accesorios Lenovo Elite',
        'La herramienta definitiva para potenciar tu productividad',
        866000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '33ba521e-ae0b-46f4-a095-248c53f4b9be',
        'SW7Z4M62MZ',
        'Audio Nintendo Ultra',
        'Disfruta de la mejor tecnología al mejor precio',
        1061000.00
    );
INSERT INTO PRODUCTS
VALUES (
        'a6de3210-8d8f-4c76-a2dc-335cbee0ac35',
        'CW27Q8XYVC',
        'Consola Oster Smart',
        'Diseño elegante con potencia excepcional',
        4909000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '07c8d3b9-3d21-41d0-b998-bd8c86b7b41d',
        'XAZLFRCX1I',
        'Laptop Oster Elite',
        'Perfecto para llevar a todas partes',
        7712000.00
    );
INSERT INTO PRODUCTS
VALUES (
        '4da1feb6-e19c-448b-bd82-dc3036e0ff58',
        '5TNGBT1LC5',
        'Laptop Dell Slim',
        'La herramienta definitiva para potenciar tu productividad',
        4692000.00
    );
ALTER USER 'root' @'%' IDENTIFIED BY 'workshop2026++';
ALTER USER 'workshop' @'%' IDENTIFIED BY 'workshop2026';
GRANT ALL PRIVILEGES ON productsdb.* TO 'root' @'%';
GRANT ALL PRIVILEGES ON productsdb.* TO 'workshop' @'%';
FLUSH PRIVILEGES;
DELIMITER // CREATE PROCEDURE sp_listar_nombres_productos(OUT p_lista_nombres TEXT) BEGIN -- 1. Declarar variables locales
DECLARE v_finalizado INT DEFAULT 0;
DECLARE v_nombre VARCHAR(512);
-- 2. Declarar el cursor con la consulta
DECLARE cursor_productos CURSOR FOR
SELECT PRODUCT_NAME
FROM PRODUCTS;
-- 3. Declarar el manejador de fin de registros
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET v_finalizado = 1;
-- Inicializar la variable de salida
SET p_lista_nombres = '';
-- 4. Abrir el cursor
OPEN cursor_productos;
-- 5. Bucle para recorrer los registros
bucle_lectura: LOOP FETCH cursor_productos INTO v_nombre;
-- Si ya no hay más filas, salir del bucle
IF v_finalizado = 1 THEN LEAVE bucle_lectura;
END IF;
-- Concatenar el nombre actual a la lista
IF p_lista_nombres = '' THEN
SET p_lista_nombres = v_nombre;
ELSE
SET p_lista_nombres = CONCAT(p_lista_nombres, ' | ', v_nombre);
END IF;
END LOOP bucle_lectura;
-- 6. Cerrar el cursor
CLOSE cursor_productos;
END // DELIMITER;
-- 1. Llamar al procedimiento pasando una variable vacía
CALL sp_listar_nombres_productos(@resultado);
-- 2. Ver el contenido de la variable
SELECT @resultado AS lista_de_productos;