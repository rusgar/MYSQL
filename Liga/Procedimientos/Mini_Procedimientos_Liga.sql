use liga;
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