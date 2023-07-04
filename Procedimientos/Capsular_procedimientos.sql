DELIMITER $$
DROP PROCEDURE IF EXISTS CAJA_MOD$$
CREATE PROCEDURE CAJA_MOD(IN P_ID_PRODUCTO INT, 
						 P_CANTIDAD INT)
	BEGIN
			-- -----------------------------------------------------------------------------------------------
			-- 1.- Ahora llamamos al procedimiento mediante una llamada a la obtener_precios
			-- -----------------------------------------------------------------------------------------------            
            
			   call OBTENER_PRECIOS(P_ID_PRODUCTO, @PRECIO);                       
              		          
            
            
             -- ------------------------------------------------------------------------------------------------
            -- 2. METEMOS LA VARIABLE DEL TIEMPÒ DE LA VENTA 
            -- ------------------------------------------------------------------------------------------------- 
            
            SELECT current_timestamp()
                   INTO @FECHAHORA;
				   SELECT @FECHAHORA;            
            
			-- --------------------------------------------------------------------------------------------------    
			-- 3.- Ahora llamamos al procedimiento mediante una llamada a la venta_nueva
			-- --------------------------------------------------------------------------------------------------
            
             CALL VENTA_NUEVA (  P_ID_PRODUCTO ,
								 P_CANTIDAD ,
                                 @PRECIO,
                                 @FECHAHORA);
			
			-- -----------------------------------------------------------------------------------------------
			-- 4.- Ahora llamamos al procedimiento mediante una llamada a la ULTIMA_VENTA
			-- -----------------------------------------------------------------------------------------------
			
              CALL OBTENER_ULTIMA_VENTA(@ID_ULTIMA_VENTA);
             
                    
			-- -----------------------------------------------------------------------------------------------
			-- 5.-  Ahora llamamos al procedimiento mediante una llamada a la OBTENER_ID_EMPLEADO
			-- -----------------------------------------------------------------------------------------------
            
			CALL OBTENER_ID_EMPLEADO(@ID_EMPLEADO);
						
			INSERT INTO ASIGNACION VALUES (@ID_EMPLEADO, @ID_ULTIMA_VENTA); -- Hacemos la asignación			
            
            -- -----------------------------------------------------------------------------------------------
			-- 6.- Ahora llamamos al procedimiento mediante una llamada a la OBTENER_ID_TIENDA
            -- --------------------------------------------------------------------------
            
             call OBTENER_ID_TIENDA(@ID_EMPLEADO, @ID_TIENDA);
             
            -- ------------------------------------------------------------------------------------------------            
			-- Ahora llamamos al procedimiento mediante una llamada a la ACTUALIZAR_STOCK
			-- -------------------------------------------------------------------------------------------------
            
             call ACTUALIZAR_STOCK( P_CANTIDAD,P_ID_PRODUCTO,@ID_TIENDA);
             
             -- ------------------------------------------------------------------------------------------------
			-- DEJAMOS LA ASIGNACION IGUALMENTE
			-- -------------------------------------------------------------------------------------------------
                        
			  INSERT INTO ASIGNACION VALUES (@ID_EMPLEADO, @ID_ULTIMA_VENTA);
              
			-- -----------------------------------------------------------------------------------------------            
            
				SELECT *
					FROM PRODUCTO INNER JOIN VENTA ON PRODUCTO.ID_PRODUCTO = VENTA.ID_PRODUCTO
					WHERE VENTA.ID_VENTA = @ID_ULTIMA_VENTA;
                    
			-- -----------------------------------------------------------------------------------------------
			END
        $$