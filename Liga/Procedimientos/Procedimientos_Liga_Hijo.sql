
use liga;
-- ------------------------------- PRIMER HIJO-PROCEDIMIENTO-----------------------------------------------
DELIMITER // 
DROP PROCEDURE IF EXISTS COMPROBAR_RESULTADO// 
CREATE PROCEDURE COMPROBAR_RESULTADO(IN PE_ID_LOCAL INT,
                                        PE_ID_VISITANTE INT,
									OUT PS_RESULTADO CHAR(1))
BEGIN
SELECT RESULTADO
	FROM PARTIDOS
    WHERE ID_LOCAL=  PE_ID_LOCAL AND ID_VISITANTE = PE_ID_VISITANTE
    INTO PS_RESULTADO;
END
//

-- call liga.COMPROBAR_RESULTADO(3, 13, @RESULTADO);
-- select @RESULTADO;

-- --------------------------------------- SEGUNDO-HIJO-PROCEDIMIENTO----------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS INFORMAR_MARCADOR// 
CREATE PROCEDURE INFORMAR_MARCADOR(IN PE_ID_LOCAL INT,
                                   IN PE_ID_VISITANTE INT,
								   IN PE_MARCADOR_LOCAL INT,
                                   IN PE_MARCADOR_VISITANTE INT)
BEGIN
UPDATE PARTIDOS
            SET MARCADOR_LOCAL = PE_MARCADOR_LOCAL,
                MARCADOR_VISITANTE= PE_MARCADOR_VISITANTE
                WHERE ID_LOCAL = PE_ID_LOCAL AND ID_VISITANTE = PE_ID_VISITANTE;
END
//

-- --------------------------------------- TERCER-HIJO-PROCEDIMIENTO----------------------------

DELIMITER //
DROP PROCEDURE IF EXISTS INFORMAR_RESULTADO// 
CREATE PROCEDURE INFORMAR_RESULTADO(IN PE_ID_LOCAL INT,
                                   IN PE_ID_VISITANTE INT,
                                   IN PE_RESULTADO CHAR(1))
BEGIN
UPDATE PARTIDOS
               SET RESULTADO = PE_RESULTADO
               WHERE ID_LOCAL = PE_ID_LOCAL AND ID_VISITANTE = PE_ID_VISITANTE;
END
//
-- --------------------------------------- CUARTO-HIJO-PROCEDIMIENTO----------------------------


DELIMITER //
DROP PROCEDURE IF EXISTS ACTUALIZAR_EQUIPOS// 
CREATE PROCEDURE ACTUALIZAR_EQUIPOS(IN PE_GANADOS INT,
                                   IN PE_EMPATADOS INT,
                                   IN PE_PERDIDOS INT,
                                   IN PE_FAVOR INT,
                                   IN PE_CONTRA INT,
                                   IN PE_JUGADOS INT,
                                   IN PE_PUNTOS INT,
                                   IN PE_ID_EQUIPO INT)
BEGIN
 UPDATE EQUIPOS    
             SET 
                 P_GANADOS = P_GANADOS + PE_GANADOS,
                 P_EMPATADOS = P_EMPATADOS + PE_EMPATADOS,
                 P_PERDIDOS = P_PERDIDOS + PE_PERDIDOS,
                 G_FAVOR = G_FAVOR + PE_FAVOR,
                 G_CONTRA = G_CONTRA + PE_CONTRA, 
                 P_JUGADOS = P_JUGADOS + PE_JUGADOS,
                 PUNTOS = PUNTOS + PE_PUNTOS
                 WHERE ID_EQUIPO = PE_ID_EQUIPO;
 END       
//

-- -------------------------------------------QUINTO HIJO-PROCEDIMIENTOS----------------------------
 