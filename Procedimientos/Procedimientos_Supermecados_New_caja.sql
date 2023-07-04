DELIMITER $$
DROP PROCEDURE IF EXISTS New_CAJA$$
CREATE PROCEDURE New_CAJA(IN P_ID_PRODUCTO INT, 
						 P_CANTIDAD INT)
	BEGIN
			-- -----------------------------------------------------------------------------------------------
			-- 1.- Seleccionamos los datos del producto cuyo ID_PRODUCTO es igual al parámetro P_ID_PRODUCTO
			-- -----------------------------------------------------------------------------------------------
			   SELECT  PRECIO
					FROM PRODUCTO
						WHERE ID_PRODUCTO = P_ID_PRODUCTO
						INTO @PRECIO;                        
                        
			
            -- -------------------------------------------------------------------------------------------------            
            -- 2. METEMOS LA VARIABLE DEL TIEMPÒ DE LA VENTA 
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
            
            -- -----------------------------------------------------------------------------------------------
			-- 6.- Ahora vamos a acceder a la tabla empleado para sacar el ID_empleado, que es otro campo que necesitamos para acceder a la tabña stock
            -- -----------------------------------------------------------------------------------------------
            SELECT id_tienda
            FROM empleado
            WHERE ID_EMPLEADO = @id_empleado
            INTO @id_tienda;
            -- ------------------------------------------------------------------------------------------------
			-- 7.- Actualizar el STOCK en la tabla stock restando al campo STOCK la cantidad P_CANTIDAD que
			--     hemos vendido.
			-- -------------------------------------------------------------------------------------------------
            
            UPDATE stock
					SET STOCK = STOCK - P_CANTIDAD 
						WHERE ID_PRODUCTO = P_ID_PRODUCTO and id_tienda = @id_tienda;
            
            
			-- -----------------------------------------------------------------------------------------------
			--  9 Mostramos al CAJERO la venta que acaba de realizar
			-- -----------------------------------------------------------------------------------------------
				SELECT *
					FROM PRODUCTO INNER JOIN VENTA ON PRODUCTO.ID_PRODUCTO = VENTA.ID_PRODUCTO
					WHERE VENTA.ID_VENTA = @ID_ULTIMA_VENTA;
			-- -----------------------------------------------------------------------------------------------
			END
        $$