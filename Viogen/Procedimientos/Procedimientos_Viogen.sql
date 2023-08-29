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

-- ---------------------------------------------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS ALTA_AGRESOR$$
CREATE PROCEDURE ALTA_AGRESOR(IN PE_DNI CHAR(9),
                              IN PE_NIE CHAR(9),
                              IN PE_NOMBRE VARCHAR(100),
                              IN PE_APELLIDO1 VARCHAR(100),
                              IN PE_APELLIDO2 VARCHAR(100))
BEGIN
	
	INSERT INTO AGRESORES VALUES(DEFAULT,
								 PE_DNI,
                                 PE_NIE,
                                 PE_NOMBRE,
                                 PE_APELLIDO1,
                                 PE_APELLIDO2);

END
$$
-- -------------------------------------------------------------------------------------------------

DELIMITER $$
	DROP PROCEDURE IF EXISTS ALTA_MEDIDA$$
    CREATE PROCEDURE ALTA_MEDIDA(PE_COD_ORDEN INT, 
								 PE_COD_JURISDICCION CHAR(1), 
								 PE_CONTENIDO VARCHAR(3000), 
								 PE_FECHA_INICIO DATE,
								 PE_FECHA_FIN DATE)
	BEGIN
		SELECT COD_ORDEN
			FROM ORDEN_PROTEC
            WHERE COD_ORDEN = PE_COD_ORDEN;
		IF (row_count()) <= 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aún no ha sido creada la OP asociada
													   a esta medida.';
        ELSE
			INSERT INTO MEDIDAS VALUES(DEFAULT,
									   PE_COD_ORDEN,
									   PE_COD_JURISDICCION,
                                       PE_CONTENIDO,
                                       PE_FECHA_INICIO,
                                       PE_FECHA_FIN);
        END IF;
    
    END
$$
-- --------------------------------------------------------------------------------------------
DELIMITER $$
	DROP PROCEDURE IF EXISTS ALTA_OP$$
    CREATE PROCEDURE ALTA_OP(IN PE_COD_USUARIA INT,
							 IN	PE_COD_AGRESOR INT,
							 IN	PE_EXPEDIENTE CHAR(20),
							 IN PE_FECHA_INICIO DATE,
							 IN PE_FECHA_FIN DATE)
	BEGIN
		SELECT *
			FROM VINCULOS
				WHERE COD_USUARIA = PE_COD_USUARIA
			      AND COD_AGRESOR = PE_COD_AGRESOR
                  INTO @COD_USUARIA, @COD_AGRESOR;
			IF @COD_USUARIA IS NULL AND @COD_AGRESOR IS NULL THEN
				CALL ALTA_VINCULO(PE_COD_USUARIA, PE_COD_AGRESOR);
            END IF;
		INSERT INTO ORDEN_PROTEC VALUES (DEFAULT,
										 PE_COD_USUARIA,
                                         PE_COD_AGRESOR,
                                         PE_EXPEDIENTE,
                                         PE_FECHA_INICIO,
                                         PE_FECHA_FIN);
    END
$$
-- --------------------------------------------------------------------------------------------------------
DELIMITER $$
	DROP PROCEDURE IF EXISTS ALTA_VINCULO$$
    CREATE PROCEDURE ALTA_VINCULO(IN PE_COD_USUARIA INT,
							      IN PE_COD_AGRESOR INT)
	BEGIN
		SELECT COD_USUARIA, COD_AGRESOR
			FROM VINCULOS
			WHERE COD_USUARIA = PE_COD_USUARIA 
              AND COD_AGRESOR = PE_COD_AGRESOR
				INTO @COD_USUARIA, @COD_AGRESOR;
		IF @COD_USUARIA IS NULL AND @COD_AGRESOR IS NULL THEN
			INSERT INTO VINCULOS VALUES (PE_COD_USUARIA, PE_COD_AGRESOR);
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe este vínculo.';
		END IF;
    END
$$
-- --------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS MOD_INFO_USUARIA$$
CREATE PROCEDURE MOD_INFO_USUARIA( IN PE_COD_USUARIA INT,
                                   IN PE_INFO_RAI  CHAR (1),
                                   IN PE_INFO_PAGO_UNICO CHAR(1),
                                   IN PE_INFO_VIPASA CHAR (1),
                                   IN PE_INFO_AYUDA_EMERGENCIA CHAR(1))
BEGIN
	   SELECT INFO_RAI, 
			  INFO_PAGO_UNICO, 
              INFO_VIPASA, 
              INFO_AYUDA_EMERGENCIA
		FROM USUARIAS
		   WHERE COD_USUARIA = PE_COD_USUARIA
			   INTO @INFO_RAI,
					@INFO_PAGO_UNICO,
					@INFO_VIPASA,
					@INFO_AYUDA_EMERGENCIA;
        
	IF @INFO_RAI = '' THEN 
		UPDATE USUARIAS
			SET INFO_RAI = PE_INFO_RAI
				WHERE COD_USUARIA =  PE_COD_USUARIA;
   END IF; 
   -- --------------------------------------------------------------------------------------------------------- 
  IF @INFO_PAGO_UNICO = '' THEN 
	UPDATE USUARIAS
		SET INFO_PAGO_UNICO = PE_INFO_PAGO_UNICO
			WHERE COD_USUARIA =  PE_COD_USUARIA;
   END IF; 
  -- ----------------------------------------------------------------------------------------------------------      
	IF @INFO_VIPASA = '' THEN 
		UPDATE USUARIAS
			SET INFO_VIPASA = PE_INFO_VIPASA
				WHERE COD_USUARIA =  PE_COD_USUARIA;
	END IF;
  -- --------------------------------------------------------------------------------------------------------  
    IF @INFO_AYUDA_EMERGENCIA = '' THEN 
		UPDATE USUARIAS
			SET INFO_AYUDA_EMERGENCIA = PE_INFO_AYUDA_EMERGENCIA
				WHERE COD_USUARIA = PE_COD_USUARIA;
   END IF;
   
   

END

$$   

-- ------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS ALTA_OBSERVACIONES$$
CREATE PROCEDURE ALTA_OBSERVACIONES(IN PE_COD_USUARIA INT,
									IN PE_OBSERVACION TEXT,
                                    OUT PS_ALTA_OBS VARCHAR(500))
BEGIN
	INSERT INTO OBSERVACIONES VALUES (DEFAULT,
									  PE_COD_USUARIA,
                                      PE_OBSERVACION,
                                      DEFAULT);
    SELECT OBSERVACION
		FROM OBSERVACIONES
		WHERE OBSERVACION = PE_OBSERVACION
			INTO PS_ALTA_OBS;
END
$$
-- ------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS MOD_MEDIDA$$
CREATE PROCEDURE MOD_MEDIDA(IN PE_COD_MEDIDA INT,
							IN PE_FECHA_FIN DATE)
BEGIN
	DECLARE V_COD_MEDIDA INT;
    SELECT COD_MEDIDA
		FROM MEDIDAS
        WHERE COD_MEDIDA = PE_COD_MEDIDA
			INTO V_COD_MEDIDA;
	IF V_COD_MEDIDA IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La medida que intenta modificar no existe';
	ELSE
		UPDATE MEDIDAS
			SET FECHA_FIN = PE_FECHA_FIN
            WHERE COD_MEDIDA = PE_COD_MEDIDA;
    END IF;
END
$$
-- ------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS MOD_USUARIA$$
CREATE PROCEDURE MOD_USUARIA(IN PE_COD_USUARIA INT,
							 IN PE_DNI CHAR(9),
							 IN PE_NIE CHAR(9),
							 IN PE_NOMBRE VARCHAR(100),
							 IN PE_APELLIDO1 VARCHAR(100),
							 IN PE_APELLIDO2 VARCHAR(100),
							 IN PE_NACIONALIDAD VARCHAR(40),
							 IN PE_TELEFONO VARCHAR(12),
							 IN PE_DIRECCION VARCHAR(200),
							 IN PE_CP VARCHAR(5),
							 IN PE_COD_RIESGO VARCHAR(1),
							 IN PE_SOLICITA_OP CHAR(1))
BEGIN
	
	IF PE_DNI <> '' THEN
		SELECT DNI
			FROM USUARIAS
				WHERE COD_USUARIA = PE_COD_USUARIA
                INTO @DNI;
		IF @DNI = '' THEN
				UPDATE USUARIAS
					SET DNI = PE_DNI
					WHERE COD_USUARIA = PE_COD_USUARIA;
			 ELSEIF @DNI = PE_DNI THEN
				SET @DNI = @DNI;-- No hacemos nada porque el DNI introducido ya está grabado
			 ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La usuaria ya tiene un DNI en esta BD.
															Consulte al administrador.';
		END IF;
    END IF;
	
	IF PE_NIE <> '' THEN
		SELECT NIE
			FROM USUARIAS
				WHERE COD_USUARIA = PE_COD_USUARIA
                INTO @NIE;
			 IF @NIE IS NULL THEN
				UPDATE USUARIAS
					SET NIE = PE_NIE
					WHERE COD_USUARIA = PE_COD_USUARIA;
			 ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La usuaria ya tiene un NIE en esta BD.
															Consulte al administrador.';
			 END IF;
    END IF;
	IF PE_NOMBRE <> '' THEN
		UPDATE USUARIAS
			SET NOMBRE = PE_NOMBRE
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_APELLIDO1 <> '' THEN
		UPDATE USUARIAS
			SET APELLIDO1 = PE_APELLIDO1
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_APELLIDO2 <> '' THEN
		UPDATE USUARIAS
			SET APELLIDO2 = PE_APELLIDO2
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_NACIONALIDAD <> '' THEN
		UPDATE USUARIAS
			SET NACIONALIDAD = PE_NACIONALIDAD
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_TELEFONO <> '' THEN
		UPDATE USUARIAS
			SET TELEFONO = PE_TELEFONO
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_DIRECCION <> '' THEN
		UPDATE USUARIAS
			SET DIRECCION = PE_DIRECCION
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_CP <> '' THEN
		UPDATE USUARIAS
			SET CP = PE_CP
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_COD_RIESGO <> '' THEN
		UPDATE USUARIAS
			SET COD_RIESGO = PE_COD_RIESGO
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
	IF PE_SOLICITA_OP <> '' THEN
		UPDATE USUARIAS
			SET SOLICITA_OP = SOLICITA_OP
			WHERE COD_USUARIA = PE_COD_USUARIA;
    END IF;
END
$$ 

-- ------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP  PROCEDURE IF EXISTS MOD_AGRESOR$$
CREATE  PROCEDURE MOD_AGRESOR(IN PE_COD_AGRESOR INT,
								IN PE_DNI CHAR(9),                -- --------meto todos los parametros que hay en la tabla agresores EXCEPTO EL COD_AGRESOR Y PONGO -- -----
							   IN PE_NIE CHAR (9),               -- ----UN PARAMENTRO DE SALIDA (OUT) PS.. PARA QUE ME DEVUELVA LA CONFIRMACION DE SÍ METI TODO BIEN----
							   IN PE_NOMBRE VARCHAR(100),        
                               IN PE_APELLIDO1 VARCHAR(100),
							   IN PE_APELLIDO2 VARCHAR(100)
                              )
                             
BEGIN
	
    IF PE_DNI <> '' THEN
		SELECT DNI
			FROM AGRESORES
            WHERE COD_AGRESOR = PE_COD_AGRESOR
				INTO @DNI;
             IF @DNI = '' THEN  
				UPDATE AGRESORES
					SET DNI = PE_DNI
					WHERE COD_AGRESOR = PE_COD_AGRESOR;
			 ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un DNI asociado a este agresor.
															Consulte con el administrador.';
			END IF;
    END IF;
     IF PE_NIE <> '' THEN
		SELECT NIE
			FROM AGRESORES
            WHERE COD_AGRESOR = PE_COD_AGRESOR
				INTO @NIE;
             IF @NIE = '' THEN  
				UPDATE AGRESORES
					SET NIE = PE_NIE
					WHERE COD_AGRESOR = PE_COD_AGRESOR;
			 ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un NIE asociado a este agresor.
															Consulte con el administrador.';
			END IF;
    END IF;   
		
        IF PE_NOMBRE <> '' THEN
			UPDATE AGRESORES
				SET NOMBRE = PE_NOMBRE
					WHERE COD_AGRESOR = PE_COD_AGRESOR;
        END IF;
		IF PE_APELLIDO1 <> '' THEN
			UPDATE AGRESORES
				SET APELLIDO1 = PE_APELLIDO1
					WHERE COD_AGRESOR = PE_COD_AGRESOR;
        END IF;
		IF PE_APELLIDO2 <> '' THEN
			UPDATE AGRESORES
				SET APELLIDO2 = PE_APELLIDO2
					WHERE COD_AGRESOR = PE_COD_AGRESOR;
        END IF;                              
END

$$

