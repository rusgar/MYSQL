USE VUELOS;


-- ------------------------------------------------RELLENAR VIAJES DESTINO------------------------------------------------
delimiter //
DROP PROCEDURE IF EXISTS RELLENAR_VIAJES_DESN//
CREATE PROCEDURE RELLENAR_VIAJES_DESN( )

BEGIN
	DECLARE V_CONTADOR           INT;
    DECLARE V_ID_VUELO           INT;
    DECLARE V_A_ORIGEN     TEXT (50);
    DECLARE V_PAIS_ORIGEN  TEXT (50);
    DECLARE V_A_DESTINO    TEXT (50);
    DECLARE V_PAIS_DESTINO TEXT (50);
    DECLARE V_COMPANIA     TEXT (50);
    DECLARE V_TIPO_VUELO   TEXT (50);
    DECLARE V_DURACION     TEXT (50);
    DECLARE V_HORA              TIME;
    DECLARE V_FECHA             DATE;
    
    
    SET V_CONTADOR =0;
    WHILE V_CONTADOR <30 DO
    SELECT * FROM VIAJES
    WHERE ID_VUELO = V_CONTADOR +1
    
                                INTO    
								 V_ID_VUELO,    
								 V_A_ORIGEN,										
								 V_PAIS_ORIGEN,  										
								 V_A_DESTINO,   										 
								 V_PAIS_DESTINO,										 
								 V_COMPANIA,    										 
							     V_TIPO_VUELO,  
								 V_DURACION, 										     
								 V_HORA, 										         
								 V_FECHA;										                              
                                                         
   INSERT INTO VIAJES VALUES (V_ID_VUELO, V_A_ORIGEN,V_PAIS_ORIGEN, V_A_DESTINO, V_PAIS_DESTINO,V_COMPANIA, V_TIPO_VUELO,  V_DURACION,V_HORA, V_FECHA + 2 );
   
   
    SET V_CONTADOR = V_CONTADOR +1;                         
    END WHILE;                                         
                                                       
                                                       
END                                                    
                                                       
//          

                                          
 -- -----------------------------------------ACTUALIZAR VUELOS--------------------------------------------------                                                      
                                                       
USE VUELOS;

DELIMITER //
DROP PROCEDURE IF EXISTS ACTUALIZAR_IDS//
CREATE PROCEDURE ACTUALIZAR_IDS()
BEGIN
-- Declaración de variables
    DECLARE v_posicion INT;
    DECLARE V_OFFSET INT;
-- Inicialización de variablies
    SET v_posicion = 1;
    SET V_OFFSET = 0;
-- Mientras la variable posición sea menor o igual que 20...
    WHILE v_posicion <= 60 DO
			SET V_OFFSET = V_POSICION - 1; 
			SELECT A_ORIGEN,A_DESTINO, FECHA
				FROM VIAJES
				ORDER BY  FECHA ASC,
                          HORA ASC,
                          A_ORIGEN ASC,
                         A_DESTINO DESC,
						 FECHA ASC
					LIMIT 1 OFFSET V_OFFSET 
								INTO @A_ORIGEN,@A_DESTINO, @FECHA; 
			
			UPDATE VIAJES
				SET ID_VUELO = v_posicion
					WHERE A_ORIGEN = @A_ORIGEN
                    AND A_DESTINO = @A_DESTINO
                    AND FECHA = @FECHA; 
			
			SET v_posicion = V_posicion + 1; 
    END WHILE;
END //
DELIMITER ;

-- ----------------------------Rellenar Vuelos--------------------------------------------
      
      
DELIMITER $$
	DROP PROCEDURE IF EXISTS RELLENAR_DETALLES_VUELO$$
    CREATE PROCEDURE RELLENAR_DETALLES_VUELO()
		BEGIN
		   DECLARE V_CONTADOR INT; 
            SET V_CONTADOR = 1;
            WHILE V_CONTADOR <= 60 DO
            
				SELECT COMPANIA.ID_COMPANIA 
				FROM VIAJES
                INNER JOIN COMPANIA ON VIAJES.COMPANIA = COMPANIA.NOMBRE
                WHERE ID_VUELO = V_CONTADOR
                INTO @ID_COMPANIA;
                
                 SELECT A_ORIGEN, A_DESTINO,ID_TIPO_VUELO, FECHA,HORA,DURACION
                FROM VIAJES
                WHERE ID_VUELO = V_CONTADOR
                INTO @A_ORIGEN, @A_DESTINO, @ID_TIPO, @FECHA, @HORA,@DURACION;
                
                SELECT TRAYECTO.ID_TRAYECTO
                FROM TRAYECTO INNER JOIN AEROPUERTOS ORIGEN ON ORIGEN.ID_AEROPUERTO = TRAYECTO.ID_ORIGEN
                              INNER JOIN AEROPUERTOS DESTINO ON DESTINO.ID_AEROPUERTO = TRAYECTO.ID_DESTINO
                              WHERE ORIGEN.NOMBRE =@A_ORIGEN AND DESTINO.NOMBRE = @A_DESTINO
                               INTO @ID_TRAYECTO;
                
               
                
				INSERT INTO DETALLES_VUELO VALUES(DEFAULT,
														@ID_TRAYECTO,
														@ID_COMPANIA,
                                                        @ID_TIPO,
                                                        @DURACION,
														@FECHA,
                                                        @HORA);
				SET V_CONTADOR = V_CONTADOR + 1;
	                			
            END WHILE;
            
        END
$$          