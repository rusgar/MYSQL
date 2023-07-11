DELIMITER $$

-- -------------------------------------------------------------------------------------------------
#	El procedimiento CAJA_MOD, con parámetros de entrada P_ID_PRODUCTO y P_CANTIDAD,
#	es la versión encapsulada del procedimiento CAJA (ya preparado para la venta en diferentes
#	tiendas físicas)
#	Los procedimientos que utiliza están en el archivo MINI_PROCEDIMIENTOS_ENCAPSULADOS
-- -------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS CAJA_MOD$$
CREATE PROCEDURE CAJA_MOD(IN P_ID_PRODUCTO INT, 
							P_CANTIDAD INT)
	X:	BEGIN
			-- -----------------------------------------------------------------------------------------------
			-- -- 1.- Obtenermos el precio a partir de P_ID_PRODUCTO y lo almacenamos  en @PRECIO
			-- -----------------------------------------------------------------------------------------------            
            
			   CALL OBTENER_PRECIO(P_ID_PRODUCTO, @PRECIO, @ABANDONAR);    -- ENTRADA: P_ID_PRODUCTO
																	       -- SALIDA: P_PRECIO                    
       IF @ABANDONAR = 1 THEN
		            SELECT 'No existe ese producto';
		            LEAVE X;
	   END IF;	          
            
            
             -- ------------------------------------------------------------------------------------------------
            -- 2.  Guardamos la fecha y hora actual en @FECHAHORA
            -- ------------------------------------------------------------------------------------------------- 
            
            SELECT current_timestamp()
                   INTO @FECHAHORA;
				   SELECT @FECHAHORA;            
            
			-- --------------------------------------------------------------------------------------------------    
			-- 3.- Ahora LLAMAREMOS a una venta nueva con los parámetros de entrada:
            --     P_ID_PRODUCTO, P_CANTIDAD, P_PRECIO, P_FECHAHORA
			-- --------------------------------------------------------------------------------------------------
            
             CALL VENTA_NUEVA (  P_ID_PRODUCTO ,
								 P_CANTIDAD ,
                                 @PRECIO,
                                 @FECHAHORA,
                                 @ABANDONAR);
                                 
              IF @ABANDONAR = 1 THEN
					SELECT 'No existe ese producto';
					LEAVE X;
			  END IF;                   
			
			-- -----------------------------------------------------------------------------------------------
			-- 4.- Obtenemos la última venta y damos el valor de P_ID_ULTIMA_VENTA (el parámetro
            --     de salida que devuelve el procedimiento) a la variable @ID_ULTIMA_VENTA
			-- -----------------------------------------------------------------------------------------------
			
              CALL OBTENER_ULTIMA_VENTA(@ID_ULTIMA_VENTA);
              
              IF @ABANDONAR = 1 THEN
					SELECT 'No existe ese producto';
					LEAVE X;
			  END IF;
             
                    
			-- -----------------------------------------------------------------------------------------------
			-- 5.-  Obtenemos P_ID_TIENDA(lo guardamos en @ID_TIENDA) de la tienda donde trabaje el
            --     el empleado P_ID_EMPLEADO (le pasamos el valor @ID_EMPLEADO)
			-- -----------------------------------------------------------------------------------------------
            
			call OBTENER_ID_TIENDA(@ID_EMPLEADO, @ID_TIENDA, @ABANDONAR);
						
						
            
            -- -----------------------------------------------------------------------------------------------
			-- 6.- 6.- Actualizamos el campo STOCK de la tabla STOCK llamando al procedimiento
            --     ACTUALIZAR_STOCK con los parámetros de entrada P_CANTIDAD, P_ID_PRODUCTO y
            --     P_ID_TIENDA (al que le pasamos el valor almacenado en @ID_TIENDA
            -- --------------------------------------------------------------------------
            
               CALL ACTUALIZAR_STOCK(P_CANTIDAD, P_ID_PRODUCTO, @ID_TIENDA);
             
            -- ------------------------------------------------------------------------------------------------            
			-- -- 7.- Creamos la entrada en la tabla ASIGNACION que nos dice que  la última venta
            --     (@ID_ULTIMA_VENTA) fue realizada por el empleado cuyo ID es @ID_EMPLEADO
			-- -------------------------------------------------------------------------------------------------
            
             INSERT INTO ASIGNACION VALUES (@ID_EMPLEADO, @ID_ULTIMA_VENTA); 
             
             -- ------------------------------------------------------------------------------------------------
			--  Mostramos los datos de la venta que se acaba de realizar
            --     pasándole al parámetro P_ID_ULTIMA_VENTA el valor almacenado en @ID_ULTIMA_VENTA
			-- -------------------------------------------------------------------------------------------------
                        
			  CALL MOSTRAR_DATOS_VENTA(@ID_ULTIMA_VENTA);
              
			-- -----------------------------------------------------------------------------------------------            
            
			
			
			END
        $$