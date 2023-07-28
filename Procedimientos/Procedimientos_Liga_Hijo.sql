
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
CREATE PROCEDURE ACTUALIZAR_EQUIPOS(IN PE_ID_LOCAL INT,
                                   IN PE_ID_VISITANTE INT,
                                   IN PE_MARCADOR_LOCAL INT,
                                   IN PE_MARCADOR_VISITANTE INT)
BEGIN
 UPDATE EQUIPOS    
             SET 
                 P_GANADOS = P_GANADOS + 0,
                 P_EMPATADOS = P_EMPATADOS + 1,
                 P_PERDIDOS = P_PERDIDOS + 0,
                 G_FAVOR = G_FAVOR + PE_MARCADOR_LOCAL,
                 G_CONTRA = G_CONTRA + PE_MARCADOR_VISITANTE, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +1
                 WHERE ID_EQUIPO = PE_ID_LOCAL;
        UPDATE EQUIPOS    
             SET P_GANADOS = P_GANADOS + 0,
                 P_EMPATADOS = P_EMPATADOS + 1,
                 P_PERDIDOS = P_PERDIDOS + 0,
                 G_FAVOR = G_FAVOR + PE_MARCADOR_VISITANTE,
                 G_CONTRA = G_CONTRA + PE_MARCADOR_LOCAL, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +1 
                 WHERE ID_EQUIPO = PE_ID_VISITANTE;  
END
//

 