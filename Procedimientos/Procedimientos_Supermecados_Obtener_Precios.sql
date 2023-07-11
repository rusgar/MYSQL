DELIMITER //
DROP PROCEDURE IF EXISTS OBTENER_PRECIOS//
CREATE PROCEDURE OBTENER_PRECIOS( IN P_ID_PRODUCTO INT,
                                  OUT P_PRECIO FLOAT,
                                  OUT P_ABANDONAR INT)
OP:BEGIN
   SELECT  PRECIO     		
            FROM PRODUCTO
			WHERE ID_PRODUCTO = P_ID_PRODUCTO
			INTO  P_PRECIO;
            
    IF FOUND_ROWS() = 0 THEN
        SET P_ABANDONAR = 1;
        LEAVE OP;
    END IF;        

END

//



-- -----------------------------------------------------------------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS VENTA_NUEVA//
CREATE PROCEDURE VENTA_NUEVA( IN P_ID_PRODUCTO INT,
								 P_CANTIDAD INT,
                                 P_PRECIO FLOAT,
                                 P_FECHAHORA timestamp,
                                 OUT P_ABANDONAR INT)
                             
BEGIN
 INSERT INTO VENTA VALUES 	(DEFAULT,
                             P_ID_PRODUCTO, 
							 P_CANTIDAD, 
							 P_PRECIO, 
							 P_CANTIDAD * P_PRECIO, 
                             P_FECHAHORA);
   SELECT LAST_INSERT_ID() INTO @ULTIMA_INSERCION;   -- Obtengo la última inserción 
   
   
   SELECT ID_VENTA 
        FROM VENTA ORDER BY ID_VENTA DESC 
        LIMIT 1 
        INTO @ULTIMO_INSERT; -- Obtengo el último registro
        
        IF @ULTIMO_INSERT <> @ULTIMA_INSERCION THEN
              SET P_ABANDONAR = 1;
        END IF; 

END

//




-- -----------------------------------------------------------------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS OBTENER_ULTIMA_VENTA//
CREATE PROCEDURE OBTENER_ULTIMA_VENTA( OUT P_ID_ULTIMA_VENTA INT )
BEGIN
  SELECT ID_VENTA
		FROM VENTA
		ORDER BY ID_VENTA DESC LIMIT 1 
		INTO P_ID_ULTIMA_VENTA;
                    

END

//

set @P_ID_ULTIMA_VENTA = 0;
call supermercado_1.OBTENER_ULTIMA_VENTA(@P_ID_ULTIMA_VENTA);
select @P_ID_ULTIMA_VENTA;

-- -----------------------------------------------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS OBTENER_ID_EMPLEADO//
CREATE PROCEDURE OBTENER_ID_EMPLEADO(  OUT P_ID_EMPLEADO INT,
									   OUT P_ABANDONAR INT)
OP:BEGIN
 	         SELECT USER() 		        				  INTO @USUARIO;			-- Guardamos el usuario
																					-- que llamó al procedimiento																		
			 SELECT POSITION('@' IN @USUARIO) 			  INTO @POSITION;			-- Buscamos la posición de la @
		     SELECT SUBSTRING(@USUARIO, 1, @POSITION - 1) INTO @USUARIO_SIN_ARROBA;	-- Seleccionamos lo que va antes
			
			SELECT ID_EMPLEADO
				FROM EMPLEADO
					WHERE USUARIO = @USUARIO_SIN_ARROBA
						INTO P_ID_EMPLEADO;					-- Seleccionamos el ID de EMPLEADO que corresponde con
															-- el usuario
			 	IF FOUND_ROWS() = 0 THEN
                            SET P_ABANDONAR = 1;
                            LEAVE OP;
                END IF;		
		
                    

END

//




-- -----------------------------------------------------------------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS OBTENER_ID_TIENDA//
CREATE PROCEDURE OBTENER_ID_TIENDA(IN P_ID_EMPLEADO INT,
                                   OUT P_ID_TIENDA INT,
                                   OUT P_ABANDONAR INT)
OP:BEGIN
 	 SELECT ID_TIENDA
            FROM EMPLEADO
            WHERE ID_EMPLEADO = P_ID_EMPLEADO
            INTO  P_ID_TIENDA;
            
            IF FOUND_ROWS() = 0 THEN
            SET P_ABANDONAR = 1;
            SELECT 'El empleado', P_ID_EMPLEADO, 'no tiene ninguna tienda asociada';
            LEAVE OP;
        END IF;
						
		
                    

END

//



-- -----------------------------------------------------------------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS ACTUALIZAR_STOCK//
CREATE PROCEDURE ACTUALIZAR_STOCK(IN P_CANTIDAD INT,
                                  IN P_ID_PRODUCTO INT,
                                  IN P_ID_TIENDA INT)
BEGIN
 	  UPDATE stock
		    SET STOCK = STOCK - P_CANTIDAD 
			WHERE ID_PRODUCTO = P_ID_PRODUCTO and ID_TIENDA = P_ID_TIENDA;
						
		
                    

END

//


-- -----------------------------------------------------------------------------------


DELIMITER //
DROP PROCEDURE IF EXISTS MOSTRAR_DATOS_VENTA//
CREATE PROCEDURE MOSTRAR_DATOS_VENTA(IN P_ID_ULTIMA_VENTA INT)
    BEGIN
        SELECT *
        FROM PRODUCTO 
        INNER JOIN VENTA ON PRODUCTO.ID_PRODUCTO = VENTA.ID_PRODUCTO
        WHERE VENTA.ID_VENTA = P_ID_ULTIMA_VENTA;
    END
//

-- -----------------------------------------------------------------------------------