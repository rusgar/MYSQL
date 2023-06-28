DELIMITER $$
DROP PROCEDURE IF EXISTS CAJA$$
CREATE PROCEDURE CAJA(IN P_ID_PRODUCTO INT, 
						 P_CANTIDAD INT)
	BEGIN
			-- -----------------------------------------------------------------------------------------------
			-- 1.- Seleccionamos los datos del producto cuyo ID_PRODUCTO es igual al parámetro P_ID_PRODUCTO
			-- -----------------------------------------------------------------------------------------------
			   SELECT  PRECIO
					FROM PRODUCTO
						WHERE ID_PRODUCTO = P_ID_PRODUCTO
						INTO @PRECIO;
                        
                        
			-- ------------------------------------------------------------------------------------------------
			-- 2.- Actualizar el STOCK en la tabla PRODUCTO restando al campo STOCK la cantidad P_CANTIDAD que
			--     hemos vendido.
			-- -------------------------------------------------------------------------------------------------
			UPDATE PRODUCTO
					SET STOCK = STOCK - P_CANTIDAD 
						WHERE ID_PRODUCTO = P_ID_PRODUCTO;
            -- -------------------------------------------------------------------------------------------------            
            -- 2.BIS METEMOS LA VARIABLE DEL TIEMPÒ DE LA VENTA 
            -- ------------------------------------------------------------------------------------------------- 
            SELECT current_timestamp()
                   INTO @FECHAHORA;
				   SELECT @FECHAHORA;            
            
			-- --------------------------------------------------------------------------------------------------    
			-- 3.- Creamos un registro nuevo en VENTA para hacer constar la venta que acabamos de realizar
			-- --------------------------------------------------------------------------------------------------
			INSERT INTO VENTA VALUES 	(DEFAULT,
                                        P_ID_PRODUCTO, 
										P_CANTIDAD, 
										@PRECIO, 
										P_CANTIDAD*@PRECIO, 
                                        @FECHAHORA);
			-- -----------------------------------------------------------------------------------------------
			-- 4.- Seleccionamos el ID_VENTA de la venta que acabamos de insertar y la guardamos en una
			--     variable llamada @ID_ULTIMA_VENTA
			-- -----------------------------------------------------------------------------------------------
			SELECT ID_VENTA
				FROM VENTA
				ORDER BY ID_VENTA DESC LIMIT 1 
					INTO @ID_ULTIMA_VENTA;
			-- -----------------------------------------------------------------------------------------------
			-- 5.- Insertamos un nuevo registro en la tabla ASIGNACION que deja constancia del qué empleado
			--     realizó esta venta.
			-- -----------------------------------------------------------------------------------------------
			SELECT USER() 								 INTO @USUARIO;				-- Guardamos el usuario
																					-- que llamó al procedimiento																		
			SELECT POSITION('@' IN @USUARIO) 			 INTO @POSITION;			-- Buscamos la posición de la @
			SELECT SUBSTRING(@USUARIO, 1, @POSITION - 1) INTO @USUARIO_SIN_ARROBA;	-- Seleccionamos lo que va antes
			
			SELECT ID_EMPLEADO
				FROM EMPLEADO
					WHERE USUARIO = @USUARIO_SIN_ARROBA
						INTO @ID_EMPLEADO;					-- Seleccionamos el ID de empleado que corresponde con
															-- el usuario
						
			INSERT INTO ASIGNACION VALUES (@ID_EMPLEADO, @ID_ULTIMA_VENTA); -- Hacemos la asignación
			-- -----------------------------------------------------------------------------------------------
			-- Mostramos al CAJERO la venta que acaba de realizar
			-- -----------------------------------------------------------------------------------------------
				SELECT *
					FROM PRODUCTO INNER JOIN VENTA ON PRODUCTO.ID_PRODUCTO = VENTA.ID_PRODUCTO
					WHERE VENTA.ID_VENTA = @ID_ULTIMA_VENTA;
			-- -----------------------------------------------------------------------------------------------
			END
        $$
 
 
 -- ------------------Creamos los privilegios de otra tabla para mis empleados--------------------------------------------------
 
 grant execute on procedure SUPERMERCADO_1.caja to 'empleado1'@'localhost';
 grant execute on procedure SUPERMERCADO_1.caja to 'empleado2'@'localhost';
  
  flush privileges;
  
-- ----------------Modificamos la tabla venta, para saber la hora de la venta, con la funbcion Timestamp------------------------	
 SELECT * FROM supermercado_1.venta;
alter table venta add FECHAHORA TIMESTAMP;
SELECT current_timestamp()
                   INTO @FECHAHORA;
				   SELECT @FECHAHORA;      
-- ------------- Añadimos dos campos mas de Unidades como la moneda------------------------------------------------------------    
SELECT * FROM supermercado_1.producto;
alter table producto  add UD_VENTA char(10);

UPDATE PRODUCTO
SET UD_VENTA = 'Ud.'
WHERE ID_PRODUCTO BETWEEN 1 AND 1000;


UPDATE PRODUCTO
SET UD_VENTA = 'KG'
WHERE ID_PRODUCTO IN(4,5);

alter table producto  add MONEDA char(3);

UPDATE PRODUCTO
SET MONEDA = 'EUR'
WHERE ID_PRODUCTO BETWEEN 1 AND 1000;