use viogen;
DELIMITER $$
DROP  PROCEDURE IF EXISTS ALTA_VIOGEN$$
CREATE  PROCEDURE ALTA_VIOGEN( IN P_DNI CHAR(9),
							  IN P_NOMBRE VARCHAR(100),
                              IN P_APELLIDO1 VARCHAR(100),
							  IN P_APELLIDO2 VARCHAR(100),
							  IN P_TELEFONO VARCHAR(12),
							  IN P_DIRECCION VARCHAR(200),
							  IN P_CP CHAR(5),
                              IN P_COD_RIESGO CHAR(1),
                              IN P_SOLICITA_OP CHAR(1))
BEGIN

         INSERT INTO USUARIAS VALUES (DEFAULT,
                                      P_DNI ,
							          P_NOMBRE,
									  P_APELLIDO1 ,
									  P_APELLIDO2 ,
									  P_TELEFONO ,
									  P_DIRECCION,
									  P_CP,
                                      P_COD_RIESGO, 
                                      P_SOLICITA_OP);

END

$$