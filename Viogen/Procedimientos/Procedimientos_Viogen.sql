use viogen;
DELIMITER $$
DROP  PROCEDURE IF EXISTS ALTA_USUARIA$$
CREATE PROCEDURE ALTA_USUARIA(IN PE_DNI CHAR(9),
                              IN PE_NIE CHAR(9), 
							  IN PE_NOMBRE VARCHAR(100),
                              IN PE_APELLIDO1 VARCHAR(100),
							  IN PE_APELLIDO2 VARCHAR(100),
							  IN PE_TELEFONO VARCHAR(12),
							  IN PE_DIRECCION VARCHAR(200),
							  IN PE_CP CHAR(5),
                              IN PE_COD_RIESGO CHAR(1),
                              IN PE_SOLICITA_OP CHAR(1),
                              OUT PS_REGISTRO VARCHAR(500)
                              )
BEGIN

 -- EN CASO DE QUE NI dni NI bie TUVIESE INFORMACION LANZARIAMOS UNA EXCEPCION PERSONALIZADA
    
    IF PE_DNI = '' AND PR_NIE = '' THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ES NECESARIO TERNE CORRECTAMENTE LOS CAMPOS VALIDOS ';
    
    
    END IF;
         
              
         INSERT INTO USUARIAS VALUES (DEFAULT,
                                      PE_DNI ,
                                      PE_NIE,
							          PE_NOMBRE,
									  PE_APELLIDO1 ,
									  PE_APELLIDO2 ,
									  PE_TELEFONO ,
									  PE_DIRECCION,
									  PE_CP,
                                      PE_COD_RIESGO, 
                                      PE_SOLICITA_OP,
                                      DEFAULT,
                                      DEFAULT,
                                      DEFAULT,
                                      DEFAULT);
                                      
                                      
         SELECT CONCAT_WS( ' / ', DNI ,  NOMBRE,  APELLIDO1 ,					         
									  APELLIDO2 ,
									  TELEFONO ,
									  DIRECCION,
									  CP,
                                      COD_RIESGO, 
                                      SOLICITA_OP)
                                      FROM USUARIAS
                                       ORDER BY COD_USUARIA DESC LIMIT 1 INTO PS_REGISTRO;
                                       
                                    
                                      
       
END

$$

DELIMITER $$
DROP  PROCEDURE IF EXISTS ALTA_OBSERVACION$$
CREATE PROCEDURE ALTA_OBSERVACION(IN PE_COD_USUARIA INT,
                                  IN PE_OBSERVACION TEXT,
                                  OUT PS_ALTA_OBS VARCHAR(500) )
BEGIN

       INSERT INTO OBSERVACIONES VALUES(DEFAULT, PE_COD_USUARIA,PE_OBSERVACION);
	   SELECT OBSERVACIONES
       FROM OBSERVACIONES
       WHERE OBSERVACIONES = PE_OBSERVACION
       INTO PS_ALTA_OBS ;
       
     
      

END;
$$