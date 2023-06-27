DROP DATABASE IF EXISTS SUPERMERCADO;
CREATE DATABASE SUPERMERCADO;
USE SUPERMERCADO;

CREATE TABLE PRODUCTO (
	ID_PRODUCTO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE CHAR(50),
    DESCRIPCION CHAR(200),
    PRECIO FLOAT,
    STOCK INT
    );
        
CREATE TABLE VENTA (
	ID_VENTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PRODUCTO INT,
    CANTIDAD INT,
    PRECIO FLOAT,
    TOTAL FLOAT,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
    );
    
CREATE TABLE EMPLEADO (
	ID_EMPLEADO INT PRIMARY KEY AUTO_INCREMENT,
	NOMBRE CHAR(50),
	APELLIDOS CHAR(200)
	);

CREATE TABLE ASIGNACION (
	ID_EMPLEADO INT, 
    ID_VENTA INT, 
    FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO (ID_EMPLEADO),
    FOREIGN KEY (ID_VENTA) REFERENCES VENTA (ID_VENTA)
    );
    
    INSERT INTO PRODUCTO VALUES (DEFAULT, 'Baguette', 'Baguette 80% trigo 20% centeno', 1.00, 100);
    INSERT INTO PRODUCTO VALUES (DEFAULT, 'Coca-cola 2', 'Botella de Coca-cola de 2L', 1.50, 1000);
    INSERT INTO PRODUCTO VALUES (DEFAULT, 'Cheese Burger', 'Comida basura', 3.00, 2000);
    INSERT INTO EMPLEADO VALUES (DEFAULT, 'Ángeles', 'De Charlie');
    INSERT INTO EMPLEADO VALUES (DEFAULT, 'Luck', 'Skywalker');
    
    DELETE FROM PRODUCTO WHERE ID_PRODUCTO BETWEEN 1 AND 300;
    -- Imaginamos que el usuario CAJERO1 acaba de atender a un cliente que se acerca a la caja con
    -- 3 botellas de cocacola de 2L. El CAJERO1 ejecuta el procedimiento CAJA1, escanea el artículo
    -- "Coca-cola 2" (PARÁMETRO DE ENTRADA DEL PROCEDIMIENTO Nº1) e indica la cantidad de artículos
    -- con este código que compra el cliente (=3, PARÁMETRO DE ENTRADA DEL PROCEDIMIENTO Nº2)
UPDATE PRODUCTO
	SET ID_PRODUCTO = 1
	WHERE ID_PRODUCTO = 153; -- En mi tabla, metí a mano el producto 150; ahora, quiero cambiar los
							 -- productos 153-155 a 1-3, y para ello uso el UPDATE
UPDATE PRODUCTO
	SET ID_PRODUCTO = 2
	WHERE ID_PRODUCTO = 154; -- el 154 pasa a ser el 2
UPDATE PRODUCTO
	SET ID_PRODUCTO = 3
	WHERE ID_PRODUCTO = 155; -- el 155 pasa a ser el 3
-- -------------------------------------------------------------------------------------------------------------------   
-- AHORA, VAMOS A SIMULAR QUE "SOMOS" EL PROCEDIMIENTO "CAJERO" Y VAMOS A SEGUIR LOS PASOS QUE
-- DEBE SEGUIR EL PROCEDIMIENTO QUE ESTAMOS TRATANDO DE CONSTRUIR
-- -------------------------------------------------------------------------------------------------------------------
-- SIMULAMOS QUE EL CAJERO1 vende 3 unidades del producto 2
-- -------------------------------------------------------------------------------------------------------------------
   -- En primer lugar, el procedimiento debe extraer los datos del producto
   -- cuyo ID_PRODUCTO sea el PARÁMETRO DE ENTRADA Nº1 (en este caso el 2)
   SELECT *
		FROM PRODUCTO
			WHERE ID_PRODUCTO = 2;            
-- -----------------------------------------------------------------------------------------------------------------
	-- En segundo lugar, actualizamos el campo STOCK de la tabla PRODUCTO para el producto nº2
    UPDATE PRODUCTO
		SET STOCK = STOCK - 3 /*PARÁMETRO DE ENTRADA "CANTIDAD" = 3*/
			WHERE ID_PRODUCTO = 2;
-- -----------------------------------------------------------------------------------------------------------------------    
INSERT INTO VENTA VALUES (DEFAULT,  -- Añadirá 1 al último ID_VENTA que haya sido facturado
								2,  -- Parámetro de entrada ID_PRODUCTO
                                3,  -- Parámetro de entrada CANTIDAD
                                1.5, -- El precio lo saco del campo PRECIO del SELECT que acabo de hacer
                                3*1.5); -- El total se calcula multiplicando CANTIDAD*PRECIO
-- -----------------------------------------------------------------------------------------------------------------------
SELECT ID_VENTA							-- Selecciono el campo ID_VENTA 
	FROM VENTA							-- De la tabla VENTA
    ORDER BY ID_VENTA DESC LIMIT 1;		-- Lo ordeno de mayor a menor y lo limito a 1 para obtener el de mayor valor; es decir,
									    -- el que acabo de insertar
-- --------------------------------------------------------
INSERT INTO ASIGNACION VALUES (1, 1);	-- Añado un registro a la tabla ASIGNACION que me indique qué empleado a realizado cada venta
										-- (en este caso, el empleado 1 realizó la venta 1)
-- -------------------------------------------------------------   
-- SIMULAMOS QUE EL CAJERO2 vende 33 unidades del producto 3
-- -------------------------------------------------------------
   SELECT *
		FROM PRODUCTO
			WHERE ID_PRODUCTO = 3
            into @ID_PRODUCTO, @NOMBRE, @DESCRIPCION, @PRECIO,@STOCK;            
-- -----------------------------------------------------------------------------------------------------------------
	-- En segundo
    UPDATE PRODUCTO
		SET STOCK = @STOCK - 33 /*PARÁMETRO DE ENTRADA*/
			WHERE ID_PRODUCTO = @ID_PRODUCTO;
-- -----------------------------------------------------------------------------------------------------------------------    
INSERT INTO VENTA VALUES (DEFAULT, 
							@ID_PRODUCTO/*ID_PRODUCTO*/, 
                            33/*CANTIDAD*/, 
                            @PRECIO/*El precio lo saco del campo PRECIO del SELECT que acabo de hacer*/, 
                            33*@PRECIO);
-- -----------------------------------------------------------------------------------------------------------------------
SELECT ID_VENTA
	FROM VENTA
    ORDER BY ID_VENTA DESC LIMIT 1
    INTO @ID_ULTIMA_VENTA;
    
    SELECT  @ID_ULTIMA_VENTA;
-- --------------------------------------------------------
INSERT INTO ASIGNACION VALUES (1, @ID_ULTIMA_VENTA);
-- -------------------------------------------------------------     
-- SIMULAMOS QUE EL CAJERO1 vende 11 unidades del producto 1
-- -----------------------------------------------------------------------------------------------------------------------
   SELECT *
		FROM PRODUCTO
			WHERE ID_PRODUCTO = 1;            
-- ----------------------------------------------------------------------------------------------------------------------
	-- En segundo
    UPDATE PRODUCTO
		SET STOCK = STOCK - 11 /*PARÁMETRO DE ENTRADA*/
			WHERE ID_PRODUCTO = 1;
-- -----------------------------------------------------------------------------------------------------------------------    
INSERT INTO VENTA VALUES (DEFAULT, 
							1/*ID_PRODUCTO*/, 
                            11/*CANTIDAD*/, 
                            1/*El precio lo saco del campo PRECIO del SELECT que acabo de hacer*/, 
                            11*1);
-- -----------------------------------------------------------------------------------------------------------------------
SELECT ID_VENTA
	FROM VENTA
    ORDER BY ID_VENTA DESC ;
-- --------------------------------------------------------
INSERT INTO ASIGNACION VALUES (2, 3);
-- -------------------------------------------------------------     
-- SIMULAMOS QUE EL CAJERO1 vende 7 unidades del producto 3
-- -------------------------------------------------------------
   SELECT *
		FROM PRODUCTO
			WHERE ID_PRODUCTO = 3;            
-- -----------------------------------------------------------------------------------------------------------------
	-- En segundo
    UPDATE PRODUCTO
		SET STOCK = STOCK - 7 /*PARÁMETRO DE ENTRADA*/
			WHERE ID_PRODUCTO = 3;
-- -----------------------------------------------------------------------------------------------------------------------    
INSERT INTO VENTA VALUES (DEFAULT, 
							3/*ID_PRODUCTO*/, 
                            7/*CANTIDAD*/, 
                            3/*El precio lo saco del campo PRECIO del SELECT que acabo de hacer*/, 
                            7*3);
-- -----------------------------------------------------------------------------------------------------------------------
SELECT ID_VENTA
	FROM VENTA
    ORDER BY ID_VENTA DESC ;
-- --------------------------------------------------------
INSERT INTO ASIGNACION VALUES (2, 4);
-- -------------------------------------------------------------  




