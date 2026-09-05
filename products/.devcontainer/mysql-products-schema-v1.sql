SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `productsdb` ;

CREATE SCHEMA IF NOT EXISTS `productsdb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;

USE `productsdb` ;

CREATE TABLE IF NOT EXISTS PRODUCTS (
    PRODUCT_ID          VARCHAR(512),
    PRODUCT_CODE        VARCHAR(512),
    PRODUCT_NAME        VARCHAR(512),
    PRODUCT_DESCRIPTION VARCHAR(512),
    PRODUCT_PRICE       DECIMAL(10,2)
) ENGINE = InnoDB;

ALTER TABLE PRODUCTS ADD CONSTRAINT PK_IMG PRIMARY KEY (PRODUCT_ID);
ALTER TABLE PRODUCTS ADD INDEX(PRODUCT_CODE);

-- 🚀 Script de inserción masiva para el taller (500 registros adicionales)
USE `productsdb` ;

INSERT INTO PRODUCTS VALUES ('3d703247-54bc-47ef-a69d-7531a638022e','GQ1NGLK55K','Laptop Samsung Pocket','Disfruta de la mejor tecnología al mejor precio',3563000.00);
INSERT INTO PRODUCTS VALUES ('1ad589d2-49b0-48a2-bed6-8e4bf1cd09c5','1ES0HTRQVM','Audio Bose Smart','Experimenta una inmersión total con este dispositivo',223000.00);
INSERT INTO PRODUCTS VALUES ('e0c7d078-7998-414b-b4cd-d4ac0116f466','ZDGF7YJVO3','TV Apple Eco','Ideal para el hogar y la oficina moderna',2906000.00);
INSERT INTO PRODUCTS VALUES ('aec29a1d-f158-498a-a1c2-5f61dad1926d','AKJ7KR42G1','Audio JBL Max','Optimizado para un consumo eficiente',680000.00);
INSERT INTO PRODUCTS VALUES ('b3c0c24d-208f-4fa1-b938-99caabe4b8db','Y2UK6DG3OO','Laptop JBL Pocket','Excelente calidad y rendimiento garantizado',3155000.00);
INSERT INTO PRODUCTS VALUES ('97852879-a683-4200-a6b6-793d4d3bd187','7WXR9PK71K','Electrodoméstico Dell Pocket','Diseño elegante con potencia excepcional',542000.00);
INSERT INTO PRODUCTS VALUES ('ad94ca4c-88e2-4742-a192-bfa8cff7ed87','1FR701QNKD','Laptop Apple Pro','Optimizado para un consumo eficiente',3913000.00);
INSERT INTO PRODUCTS VALUES ('9fba7c1b-5972-4309-88ce-4a9ead7995fa','VO4XTSPR0G','Audio Bose Smart','Perfecto para llevar a todas partes',733000.00);
INSERT INTO PRODUCTS VALUES ('85eef19a-4bae-4a5e-8c2a-7c32a06032f4','9WCZF54UFX','Celular Nintendo Ultra','Optimizado para un consumo eficiente',2130000.00);
INSERT INTO PRODUCTS VALUES ('6d121b6b-bb8c-4069-88f6-837e661d51cf','XUIY3QKVJC','Electrodoméstico HP Pocket','Optimizado para un consumo eficiente',807000.00);
INSERT INTO PRODUCTS VALUES ('daa2dcad-ff74-4544-907c-cf9143a5f467','5YRL5QBRN4','Electrodoméstico Microsoft Smart','Experimenta una inmersión total con este dispositivo',523000.00);
INSERT INTO PRODUCTS VALUES ('7db5ac2d-8e13-4dfc-bb60-f8c96621c012','UTRFCJIH0S','Audio Dell Gamer','Disfruta de la mejor tecnología al mejor precio',566000.00);
INSERT INTO PRODUCTS VALUES ('adb8c965-9ac2-40b9-be3b-b8f2b6e30d1a','H8C5FOCSN9','Monitor HP Eco','Disfruta de la mejor tecnología al mejor precio',2442000.00);
INSERT INTO PRODUCTS VALUES ('80dad0dc-39b7-4c7e-8519-c041ec36078c','O3PAVZP4XA','Smartwatch Xiaomi Premium','Perfecto para llevar a todas partes',1155000.00);
INSERT INTO PRODUCTS VALUES ('99b35eb1-1ebf-41a9-9b1d-483f8ce507f5','PANX9PIHMI','TV Oster Ultra','Vive el entretenimiento con una nitidez incomparable',3034000.00);
INSERT INTO PRODUCTS VALUES ('5b5d4b20-d339-4f3d-9695-92036177078b','1T3BY2QTVN','Smartwatch Sony Ultra','Alta durabilidad para superar tus expectativas',337000.00);
INSERT INTO PRODUCTS VALUES ('232b5101-4d1c-4bab-9821-eb50318b51be','QN55TYCXPO','Laptop JBL Premium','Perfecto para llevar a todas partes',1897000.00);
INSERT INTO PRODUCTS VALUES ('b30d3e0d-fe1a-489c-b989-eb95f147a1d1','10GN0QKBE6','Laptop ASUS Pro','Vive el entretenimiento con una nitidez incomparable',7014000.00);
INSERT INTO PRODUCTS VALUES ('ed7523fc-7f9f-4fe7-a599-8c419f2052af','T7TXURGW2T','TV Microsoft Premium','Vive el entretenimiento con una nitidez incomparable',4441000.00);
INSERT INTO PRODUCTS VALUES ('de7dbfc3-e970-4ff8-be60-f78c22ef4722','6J26XB9E0D','TV Whirlpool Max','Optimizado para un consumo eficiente',3466000.00);
INSERT INTO PRODUCTS VALUES ('8a6fbab7-65db-4b8a-abbb-d4f2bce7e272','1GGMVICN9G','Monitor Microsoft Premium','Vive el entretenimiento con una nitidez incomparable',4158000.00);
INSERT INTO PRODUCTS VALUES ('4b83bef0-31c9-4f35-82f6-cde4699d68db','MJ8V8S3HUW','Cámara Microsoft Ultra','Disfruta de la mejor tecnología al mejor precio',2884000.00);
INSERT INTO PRODUCTS VALUES ('da8d1583-32f5-41d9-808e-a2f284f6ae2e','09MYOCS4B1','Monitor ASUS Slim','La herramienta definitiva para potenciar tu productividad',2684000.00);
INSERT INTO PRODUCTS VALUES ('66f73644-f147-48f6-97a0-26624a572ada','NHE0GJ0IVK','Accesorios Samsung Ultra','Ideal para el hogar y la oficina moderna',402000.00);
INSERT INTO PRODUCTS VALUES ('554833ef-89ee-4839-9fa5-ae9b49541912','PH03ESDP3W','Accesorios ASUS Elite','Excelente calidad y rendimiento garantizado',759000.00);
INSERT INTO PRODUCTS VALUES ('a517605e-4b92-46f0-965d-36acb57c1c27','WCFYFZLTCJ','Monitor ASUS Pro','Experimenta una inmersión total con este dispositivo',1326000.00);
INSERT INTO PRODUCTS VALUES ('18bacde6-226d-4442-9692-26a398f3c0fa','XCDXPZTU7R','Smartwatch Bose Elite','Excelente calidad y rendimiento garantizado',935000.00);
INSERT INTO PRODUCTS VALUES ('cc823a91-0444-43dd-92cb-757fb3ea2f1f','VVU3RDKBKR','Smartwatch Apple Max','Optimizado para un consumo eficiente',1079000.00);
INSERT INTO PRODUCTS VALUES ('c424ee28-177b-4a0c-9ad4-f713d3bf7271','7QCWLCCCNO','Electrodoméstico JBL Elite','Experimenta una inmersión total con este dispositivo',857000.00);
INSERT INTO PRODUCTS VALUES ('4ac904b0-966c-48e0-a7d2-16e2aaf056d6','3TXSP5NKU7','Electrodoméstico HP Smart','Perfecto para llevar a todas partes',673000.00);
INSERT INTO PRODUCTS VALUES ('cc15470b-aca9-4541-b6f2-6eff28021f10','RJA9DI9U7G','Consola Oster Eco','Optimizado para un consumo eficiente',7892000.00);
INSERT INTO PRODUCTS VALUES ('b8711f95-65e2-4dd5-a38a-871ed8093baa','TU9MDQY3AU','Celular Oster Slim','Ideal para el hogar y la oficina moderna',2745000.00);
INSERT INTO PRODUCTS VALUES ('6679d794-eab2-441a-b056-2c3f2358b53f','W8WW8ND96K','TV ASUS Gamer','Experimenta una inmersión total con este dispositivo',7899000.00);
INSERT INTO PRODUCTS VALUES ('25f06af1-dcd9-4803-a223-7b74172a3318','1LOB51EXOH','Smartwatch Oster Smart','Excelente calidad y rendimiento garantizado',182000.00);
INSERT INTO PRODUCTS VALUES ('02761fe5-d345-414c-9e30-472f551e36f0','YJBVN9SCX2','Smartwatch Bose Smart','La herramienta definitiva para potenciar tu productividad',1112000.00);
INSERT INTO PRODUCTS VALUES ('e020e7f4-d18e-43fa-b88e-372100bc19ba','0F1IPUD34O','Monitor JBL Smart','La herramienta definitiva para potenciar tu productividad',1518000.00);
INSERT INTO PRODUCTS VALUES ('463758fc-de42-4df4-83d2-026e251cedde','FJKG0A6OJ1','Accesorios Microsoft Pocket','Diseño elegante con potencia excepcional',244000.00);
INSERT INTO PRODUCTS VALUES ('9947ab05-e5f4-41e4-9517-fdeac84de362','P1AQ0G7V3K','Laptop JBL Pro','Perfecto para llevar a todas partes',3424000.00);
INSERT INTO PRODUCTS VALUES ('1b8141df-f2c9-43d4-b5a7-490203ce29e2','GFDNCK1JFZ','Laptop Oster Slim','Optimizado para un consumo eficiente',7021000.00);
INSERT INTO PRODUCTS VALUES ('fecd168e-4924-47fd-9050-d06bbf93420a','OH7T9HR59J','Audio Dell Smart','Optimizado para un consumo eficiente',1194000.00);
INSERT INTO PRODUCTS VALUES ('4b0dee73-1958-4e92-a6df-c1fc8ac21fa8','RIQMTL9K49','Laptop Bose Eco','Experimenta una inmersión total con este dispositivo',6668000.00);
INSERT INTO PRODUCTS VALUES ('1f04a03b-f937-4a1e-a0ab-2551a5af7586','2RMSTWHMIZ','TV LG Smart','Excelente calidad y rendimiento garantizado',2181000.00);
INSERT INTO PRODUCTS VALUES ('18618a6e-e355-4531-b5f6-0a31239d462c','NZQCDGJTRQ','Laptop Lenovo Ultra','Disfruta de la mejor tecnología al mejor precio',4990000.00);
INSERT INTO PRODUCTS VALUES ('368999cf-de20-4e1c-a940-5a1ea834e5d3','3QKO0D2GOL','TV Oster Pocket','Experimenta una inmersión total con este dispositivo',5453000.00);
INSERT INTO PRODUCTS VALUES ('529e5f9f-ce41-4c1f-b5b8-2245c767b17a','78F0SOBHYH','Cámara Nintendo Max','Experimenta una inmersión total con este dispositivo',3308000.00);
INSERT INTO PRODUCTS VALUES ('391579fb-9e3e-43d1-b4d2-d22c54e69e8a','KM99JBC8D6','Cámara Apple Premium','Disfruta de la mejor tecnología al mejor precio',1839000.00);
INSERT INTO PRODUCTS VALUES ('f6391f5d-12bd-4f07-b068-c275754f3e76','MACGGSCMK6','Celular Microsoft Ultra','La herramienta definitiva para potenciar tu productividad',4318000.00);
INSERT INTO PRODUCTS VALUES ('001b365a-0c02-43fe-9a09-523b20681d71','93LOGTO2PG','Electrodoméstico Bose Slim','Perfecto para llevar a todas partes',202000.00);
INSERT INTO PRODUCTS VALUES ('5f6de4a0-4f11-4fd6-b5a8-12634283cbe9','K18VOAG0B7','Electrodoméstico Oster Pocket','Ideal para el hogar y la oficina moderna',439000.00);
INSERT INTO PRODUCTS VALUES ('34d109ca-2c0d-481f-8c96-6d1c959711ca','UY3X5R0J3U','TV Nintendo Pocket','Experimenta una inmersión total con este dispositivo',6972000.00);

ALTER USER 'root'@'%' IDENTIFIED BY 'products2026++';
ALTER USER 'products'@'%' IDENTIFIED BY 'products2026';
GRANT ALL PRIVILEGES ON productsdb.* TO 'products'@'%';
FLUSH PRIVILEGES;

DELIMITER //

CREATE PROCEDURE sp_listar_nombres_productos(OUT p_lista_nombres VARCHAR(2000))
BEGIN
    -- 1. Declarar variables locales
    DECLARE v_finalizado INT DEFAULT 0;
    DECLARE v_nombre VARCHAR(512);

    -- 2. Declarar el cursor con la consulta
    DECLARE cursor_productos CURSOR FOR
        SELECT PRODUCT_NAME FROM PRODUCTS;

    -- 3. Declarar el manejador de fin de registros
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finalizado = 1;

    -- Inicializar la variable de salida
    SET p_lista_nombres = '';

    -- 4. Abrir el cursor
    OPEN cursor_productos;

    -- 5. Bucle para recorrer los registros
    bucle_lectura: LOOP
        FETCH cursor_productos INTO v_nombre;

        -- Si ya no hay más filas, salir del bucle
        IF v_finalizado = 1 THEN
            LEAVE bucle_lectura;
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
END //

DELIMITER ;

-- 1. Llamar al procedimiento pasando una variable vacía
CALL sp_listar_nombres_productos(@resultado);

-- 2. Ver el contenido de la variable
SELECT @resultado AS lista_de_productos;