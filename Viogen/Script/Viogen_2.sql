DROP DATABASE IF EXISTS VIOGEN_2;
CREATE DATABASE VIOGEN_2;
USE VIOGEN_2;

DROP TABLE IF EXISTS RIESGO;
CREATE TABLE RIESGO (
	COD_RIESGO CHAR(1),
    RIESGO VARCHAR(20),
	CONSTRAINT PK_RIESGO PRIMARY KEY (COD_RIESGO)
);

DROP TABLE IF EXISTS USUARIAS;
CREATE TABLE USUARIAS (
	COD_USUARIA INT AUTO_INCREMENT,
    DNI CHAR(9),
    NIE CHAR(9),
    NOMBRE VARCHAR(100),
    APELLIDO1 VARCHAR(100),
    APELLIDO2 VARCHAR(100),
    NACIONALIDAD VARCHAR(40),
    TELEFONO VARCHAR(12),
    DIRECCION VARCHAR(200),
    CP CHAR(5),
    COD_RIESGO CHAR(1),
    -- SOLICITA_OP
    INFO_RAI CHAR(1) DEFAULT '',
    INFO_PAGO_UNICO CHAR(1) DEFAULT '',
    INFO_VIPASA CHAR(1) DEFAULT '',
    INFO_AYUDA_EMERGENCIA CHAR(1) DEFAULT '',
    CONSTRAINT PK_USUARIAS PRIMARY KEY (COD_USUARIA),
    CONSTRAINT UK_DNI_NIE UNIQUE KEY (DNI, NIE)
);

DROP TABLE IF EXISTS AGRESORES;
CREATE TABLE AGRESORES (
	COD_AGRESOR INT AUTO_INCREMENT,
    DNI CHAR(9),
    NIE CHAR(9),
    NOMBRE VARCHAR(100),
    APELLIDO1 VARCHAR(100),
    APELLIDO2 VARCHAR(100),
    CONSTRAINT PK_AGRESORES PRIMARY KEY (COD_AGRESOR)
);

DROP TABLE IF EXISTS VINCULOS;
CREATE TABLE VINCULOS (
	COD_USUARIA INT,
    COD_AGRESOR INT,
    CONSTRAINT PK_VINCULOS PRIMARY KEY(COD_USUARIA, COD_AGRESOR),
    CONSTRAINT FK_VINCULOS_USUARIAS FOREIGN KEY (COD_USUARIA) REFERENCES USUARIAS(COD_USUARIA),
    CONSTRAINT FK_VINCULOS_AGRESORES FOREIGN KEY (COD_AGRESOR) REFERENCES AGRESORES(COD_AGRESOR)
);

DROP TABLE IF EXISTS HISTORIAL;
CREATE TABLE HISTORIAL (
	COD_USUARIA INT,
    COD_RIESGO CHAR(1),
    FECHA_CAMBIO DATE DEFAULT (CURRENT_DATE),
	CONSTRAINT PK_HISTORIAL PRIMARY KEY (COD_USUARIA, COD_RIESGO, FECHA_CAMBIO),
    CONSTRAINT FK_HISTORIAL_USUARIAS FOREIGN KEY (COD_USUARIA) REFERENCES USUARIAS(COD_USUARIA),
    CONSTRAINT FK_HISTORIAL_RIESGO FOREIGN KEY (COD_RIESGO) REFERENCES RIESGO(COD_RIESGO)
);

DROP TABLE IF EXISTS ORDEN_PROTEC;
CREATE TABLE ORDEN_PROTEC (
	COD_ORDEN INT AUTO_INCREMENT,
    COD_USUARIA INT,
    COD_AGRESOR INT,
    EXPEDIENTE CHAR(20),
    FECHA_INICIO DATE DEFAULT (CURRENT_DATE),
    FECHA_FIN DATE,
    CONSTRAINT PK_ORDEN_PROTEC PRIMARY KEY (COD_ORDEN),
    CONSTRAINT FK_ORDEN_PROTEC_USUARIAS FOREIGN KEY (COD_USUARIA) REFERENCES USUARIAS(COD_USUARIA),
    CONSTRAINT FK_ORDEN_PROTEC_AGRESORES FOREIGN KEY (COD_AGRESOR) REFERENCES AGRESORES(COD_AGRESOR)
);

DROP TABLE IF EXISTS JURISDICCION;
CREATE TABLE JURISDICCION (
	COD_JURISDICCION CHAR(1),
    JURISDICCION CHAR(20),
    CONSTRAINT PK_JURISDICCION PRIMARY KEY (COD_JURISDICCION)
);

-- Insertamos los datos de los tipos de jurisdicción
INSERT INTO JURISDICCION VALUES ('C', 'Civil'),
								('P', 'Penal');

DROP TABLE IF EXISTS TIPOS_MEDIDAS;
CREATE TABLE TIPOS_MEDIDAS (
	COD_TIPO_MEDIDA INT AUTO_INCREMENT,
    COD_JURISDICCION CHAR(1),
    TIPO_MEDIDA VARCHAR(300),
    CONSTRAINT PK_TIPOS_MEDIDAS PRIMARY KEY (COD_TIPO_MEDIDA),
    CONSTRAINT FK_TIPOS_MEDIDAS_JURISDICCION FOREIGN KEY (COD_JURISDICCION) REFERENCES JURISDICCION(COD_JURISDICCION)
);



INSERT INTO  TIPOS_MEDIDAS  VALUES(DEFAULT, 'P', 'Prisión provisional.'),
								  (DEFAULT, 'P', 'Prohibición de aproximación.'),
                                  (DEFAULT, 'P', 'Prohibición de residencia.'),
                                  (DEFAULT, 'P', 'Prohibición de comunicación.'),
                                  (DEFAULT, 'P', 'Retirada de armas u otros objetos peligrosos.'),
                                  (DEFAULT, 'C', 'Atribución del uso y disfrute de la vivienda familiar.'),
								  (DEFAULT, 'C', 'Determinar el régimen de custodia, visitas, comunicación y estancia con los hijos.'),
                                  (DEFAULT, 'C', 'Régimen de prestación de alimentos'),
                                  (DEFAULT, 'C', 'Cualquier medida de protección al menor para evitar un peligro o perjuicio.');
 

DROP TABLE IF EXISTS MEDIDAS;
CREATE TABLE MEDIDAS (
	COD_MEDIDA INT AUTO_INCREMENT,
    COD_ORDEN INT,
    COD_TIPO_MEDIDA INT,
    CONTENIDO VARCHAR(3000),
    FECHA_INICIO DATE DEFAULT (CURRENT_DATE),
    FECHA_FIN DATE,
    CONSTRAINT PK_MEDIDAS PRIMARY KEY (COD_MEDIDA),
    CONSTRAINT FK_MEDIDAS_ORDEN_PROTEC FOREIGN KEY (COD_ORDEN) REFERENCES ORDEN_PROTEC(COD_ORDEN),
    CONSTRAINT FK_MEDIDAS_TIPOS_MEDIDAS FOREIGN KEY (COD_TIPO_MEDIDA) REFERENCES TIPOS_MEDIDAS(COD_TIPO_MEDIDA)
);


-- Insertamos los datos de los tipos de riesgo
INSERT INTO RIESGO VALUES ('E', 'Riesgo extremo'),
						  ('A', 'Riesgo alto'),
                          ('M', 'Riesgo medio'),
                          ('B', 'Riesgo bajo'),
                          ('N', 'Sin riesgo');
ALTER TABLE USUARIAS
	ADD COLUMN SOLICITA_OP CHAR(1) DEFAULT '' AFTER COD_RIESGO;
    
ALTER TABLE HISTORIAL
	ADD COLUMN SOLICITA_OP CHAR(1) DEFAULT '' AFTER COD_RIESGO;
    
-- Creamos una tabla de observaciones
CREATE TABLE OBSERVACIONES (
	COD_OBSERVACION INT AUTO_INCREMENT,
    COD_USUARIA INT,
    OBSERVACION TEXT,
    FECHA DATETIME DEFAULT (NOW()),
    CONSTRAINT PK_OBSERVACIONES PRIMARY KEY (COD_OBSERVACION),
    CONSTRAINT FK_OBSERVACIONES_USUARIAS FOREIGN KEY (COD_USUARIA) REFERENCES USUARIAS(COD_USUARIA)
);

DELIMITER $$
	DROP TRIGGER IF EXISTS TR_ABRIR_HISTORIAL$$
	CREATE TRIGGER TR_ABRIR_HISTORIAL
		AFTER INSERT ON USUARIAS
			FOR EACH ROW
    BEGIN
	
		INSERT INTO HISTORIAL VALUES(NEW.COD_USUARIA,	-- Código de usuaria
									 NEW.COD_RIESGO, 	-- Código de riesgo
                                     NEW.SOLICITA_OP,	-- Solicita OP
									 DEFAULT);	-- Fecha
    
    END
$$
	DROP TRIGGER IF EXISTS TR_ACTUALIZAR_HISTORIAL$$
	CREATE TRIGGER TR_ACTUALIZAR_HISTORIAL
		AFTER UPDATE ON USUARIAS
			FOR EACH ROW
    BEGIN
		IF OLD.COD_RIESGO <> NEW.COD_RIESGO THEN
			INSERT INTO HISTORIAL VALUES(NEW.COD_USUARIA,
										 NEW.COD_RIESGO,
										 NEW.SOLICITA_OP,	-- Solicita OP 
                                         CURRENT_DATE());
        END IF;
    END
$$

	DROP PROCEDURE IF EXISTS ALTA_USUARIA$$
    CREATE PROCEDURE ALTA_USUARIA(IN PE_DNI CHAR(9),
								 IN PE_NIE CHAR(9),
								 IN PE_NOMBRE VARCHAR(100),
								 IN PE_APELLIDO1 VARCHAR(100),
								 IN PE_APELLIDO2 VARCHAR(100),
                                 IN PE_NACIONALIDAD VARCHAR(40),
								 IN PE_TELEFONO VARCHAR(12),
								 IN PE_DIRECCION VARCHAR(200),
								 IN PE_CP CHAR(5),
                                 IN PE_COD_RIESGO CHAR(1),
                                 IN PE_SOLICITA_OP CHAR(1),
                                 OUT PS_REGISTRO VARCHAR(500))
		BEGIN
			
		-- En caso de que ni DNI ni NIE contuviesen información, lanzaríamos una excepción
        -- personalizada
        IF PE_DNI = '' AND PE_NIE = '' THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Es necesario que o bien el campo DNI, o bien el campo NIE
														contengan información';
        END IF;
            
			INSERT INTO USUARIAS VALUES(DEFAULT,
										PE_DNI,
                                        PE_NIE,
										PE_NOMBRE,
										PE_APELLIDO1,
										PE_APELLIDO2,
                                        PE_NACIONALIDAD,
										PE_TELEFONO,
										PE_DIRECCION,
										PE_CP,
                                        PE_COD_RIESGO,
                                        PE_SOLICITA_OP,
                                        DEFAULT,
                                        DEFAULT,
                                        DEFAULT,
                                        DEFAULT);

            SELECT CONCAT_WS(' / ', DNI,
					NIE,
					NOMBRE,
					APELLIDO1,
					APELLIDO2,
                    NACIONALIDAD,
					TELEFONO,
					DIRECCION,
					CP,
					COD_RIESGO,
					SOLICITA_OP)
				FROM USUARIAS
					ORDER BY COD_USUARIA DESC LIMIT 1 INTO PS_REGISTRO;		
        END
$$

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
	DROP PROCEDURE IF EXISTS ALTA_MEDIDA$$
    CREATE PROCEDURE ALTA_MEDIDA(PE_COD_ORDEN INT, 
								 PE_COD_TIPO_MEDIDA CHAR(1), 
								 PE_CONTENIDO VARCHAR(3000), 
								 PE_FECHA_INICIO DATE,
								 PE_FECHA_FIN DATE)
	BEGIN
		SELECT COD_ORDEN
			FROM ORDEN_PROTEC
            WHERE COD_ORDEN = PE_COD_ORDEN
				INTO @COD_ORDEN;
		IF @COD_ORDEN IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aún no ha sido creada la OP asociada
													   a esta medida.';
        ELSE
			INSERT INTO MEDIDAS VALUES(DEFAULT,
									   PE_COD_ORDEN,
									   PE_COD_TIPO_MEDIDA,
                                       PE_CONTENIDO,
                                       PE_FECHA_INICIO,
                                       PE_FECHA_FIN);
        END IF;
    
    END
$$
	DROP PROCEDURE IF EXISTS ALTA_OP$$
    CREATE PROCEDURE ALTA_OP(IN PE_COD_USUARIA INT,
							 IN	PE_COD_AGRESOR INT,
							 IN	PE_EXPEDIENTE CHAR(20),
							 IN PE_FECHA_INICIO DATE,
							 IN PE_FECHA_FIN DATE,
                             OUT PS_COD_OP INT)
	BEGIN
		SET @COD_USUARIA = NULL;
        SET @COD_AGRESOR = NULL;
		SELECT *
			FROM VINCULOS
				WHERE COD_USUARIA = PE_COD_USUARIA
			      AND COD_AGRESOR = PE_COD_AGRESOR
                  INTO @COD_USUARIA, @COD_AGRESOR;
			IF @COD_USUARIA IS NULL AND @COD_AGRESOR IS NULL THEN
				INSERT INTO VINCULOS 
						VALUES (PE_COD_USUARIA, PE_COD_AGRESOR);
            END IF;
		INSERT INTO ORDEN_PROTEC VALUES (DEFAULT,
										 PE_COD_USUARIA,
                                         PE_COD_AGRESOR,
                                         PE_EXPEDIENTE,
                                         PE_FECHA_INICIO,
                                         PE_FECHA_FIN);
		SELECT COD_ORDEN 
			FROM ORDEN_PROTEC 
			ORDER BY COD_ORDEN DESC LIMIT 1 
										INTO PS_COD_OP;
    END
$$
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

DROP PROCEDURE IF EXISTS MOD_INFO_USUARIA$$
CREATE PROCEDURE MOD_INFO_USUARIA(IN PE_COD_USUARIA INT,
								  IN PE_INFO_RAI CHAR (1),
								  IN PE_INFO_PAGO_UNICO CHAR (1),
								  IN PE_INFO_VIPASA CHAR (1),
								  IN PE_INFO_AYUDA_EMERGENCIA CHAR (1))
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

DELIMITER ;

call VIOGEN_2.ALTA_USUARIA('12378945A', '', 'Zoa', 'De la Rosa', 'Montero', 'Mexicana', '123456780', 'Barrio exterior', '99999', 'A', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945B', '', 'Patri', 'De la Rosa', 'Montero', 'Mexicana', '123456781', 'La Descalzada', '99999', 'B', '', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945C', '', 'Rosario', 'De la Rosa', 'Montero', 'Mexicana', '123456782', 'La Descalzada', '99999', 'B', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945D', '', 'Berta', 'De la Rosa', 'Montero', 'Española', '123456783', 'La Descalzada', '99999', 'B', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945E', '', 'Lorena', 'De la Rosa', 'Montero', 'Española', '123456784', 'El Arenal', '99999', 'E', '', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945T', '', 'Maribel', 'De la Rosa', 'Montero', 'Española', '123456785', 'El Arenal', '99999', 'E', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945Y', '', 'Rebeca', 'De la Rosa', 'Montero', 'Española', '123456786', 'El Arenal', '99999', 'B', '', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945U', '', 'Ainoa', 'De la Rosa', 'Montero', 'Francesa', '123456787', 'Pozos del Llano', '99999', 'B', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945I', '', 'Antonia', 'De la Rosa', 'Montero', 'Francesa', '123456788', 'Pozos del Llano', '99999', 'M', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945P', '', 'Fátima', 'Jiménez', 'Fátimez', 'Peruana', '123456777', 'Pozos del Llano', '99999', 'M', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945M', '', 'María', 'De los Ángeles', 'Caídos', 'Peruana', '123256789', 'Pozos del Llano', '99999', 'M', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945N', '', 'Virtud', 'De los Álamos', 'Montero', 'Magrebí', '123436789', 'Calle Melancolía', '99999', 'M', '', @PS_REGISTRO);
call VIOGEN_2.ALTA_USUARIA('12378945Q', '', 'Celeste', 'Noes', 'Uncolor', 'Magrebí', '123456722', 'La Descalzada', '99999', 'A', 'X', @PS_REGISTRO);
call VIOGEN_2.ALTA_AGRESOR('45698721J', '', 'Manuel', 'Del Campo ', 'Manuélez');
call VIOGEN_2.ALTA_AGRESOR('35698721A', '', 'José', 'Del Campo ', 'Entelequio');
call VIOGEN_2.ALTA_AGRESOR('25698721B', '', 'Miguel', 'Del Campo ', 'Abierto');
call VIOGEN_2.ALTA_AGRESOR('15698721C', '', 'Mariano', 'Pérez ', 'Eustáquiez');
call VIOGEN_2.ALTA_AGRESOR('05698721H', '', 'Ángel', 'García ', 'Bermúdez');
call VIOGEN_2.ALTA_AGRESOR('95698721R', '', 'Jonás', 'García ', 'Bermúdez');
call VIOGEN_2.ALTA_AGRESOR('85698721J', '', 'Abel', 'Fernández ', 'Trastámara');
call VIOGEN_2.ALTA_AGRESOR('75698721G', '', 'Judas', 'Fernández ', 'Noexiste');
call VIOGEN_2.ALTA_AGRESOR('65698721Q', '', 'Jeremías', 'Del Campo ', 'Manuélez');

call VIOGEN_2.ALTA_OP(1, 1, 'EXP 234/3333', '20230101', '20250101', @PS_COD_OP);

call VIOGEN_2.ALTA_MEDIDA(1, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(1, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(1, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(1, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(1, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(2, 5, 'EXP 274/2019', '20190801', '20210801', @NUMERO_ORDEN);
call VIOGEN_2.ALTA_MEDIDA(2, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(2, '1', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(2, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(2, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(2, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(3, 9, 'EXP 294/2022', '20220318', '20230318', @NUMERO_ORDEN2);
call VIOGEN_2.ALTA_MEDIDA(3, '9', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(3, '8', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(3, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(3, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(3, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(4, 7, 'EXP255/2019', '20190401', '20240213', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(4, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(4, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(4, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(4, '9', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(4, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(5, 1, 'EXP741/2020', '20200201', '20250201', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(5, '4', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(5, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(5, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(5, '1', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(5, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(6, 4, 'EXP125/2345', '20230202', '20250202', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(6, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(6, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(6, '1', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(6, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(6, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(7, 1, 'EXP 358/2023', '20210321', '20240321', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(7, '1', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(7, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(7, '4', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(7, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(7, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(8, 5,'EXP 211/2125','2023-08-15','2024-11-11', @algo);
call VIOGEN_2.ALTA_MEDIDA(8, '9', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(8, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(8, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(8, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(8, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(9, 3, 'EXP 254/2001', 20190514, 20240514, @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(9, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(9, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(9, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(10, 1, 'EXP334/2023', '20230101', '20250101', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(10, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(10, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(10, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(10, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(10, '7', '', '20230101', '20250101');
call VIOGEN_2.ALTA_OP(11, 2, 'EXP335/2023', '20230101', '20250101', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(11, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(11, '3', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(11, '8', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(11, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(11, '7', '', '20230101', '20250101');

call VIOGEN_2.ALTA_OP(12, 9, 'EXP 209/3158','2023-12-01','2024-11-08', @PS_COD_OP);
call VIOGEN_2.ALTA_MEDIDA(12, '8', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(12, '5', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(12, '2', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(12, '6', '', '20230101', '20250101');
call VIOGEN_2.ALTA_MEDIDA(12, '7', '', '20230101', '20250101');