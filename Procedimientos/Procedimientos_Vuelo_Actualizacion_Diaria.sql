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

call vuelos.RELLENAR_VIAJES_DESN();                                           
                                                       
                                                       
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
				ORDER BY A_ORIGEN ASC,
                         A_DESTINO ASC,
						 FECHA DESC
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
                                                       