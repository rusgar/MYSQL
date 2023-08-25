INSERT INTO USUARIAS VALUES(DEFAULT, '12345678A','NOMBRE', 'APELLIDO1','APELLIDO2','666666666','DIRECCION','33212','A',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

-- CONSULTA DE LA TABLA HISTORIAL;

SELECT *
FROM HISTORIAL;


-- --------------------------------ACTUALIZAMOS EL COD_RIESGO DE LA TABLA USURARIA------------------------------------------

UPDATE USUARIAS
SET COD_RIESGO = "B"
WHERE COD_USUARIA = 1;

SELECT *
FROM HISTORIAL;

-- -----------------------------------METEMOS OTRA USURIA-----------------------------------------------------
INSERT INTO USUARIAS VALUES(DEFAULT, '96385214B','NOMBRE1', 'APELLIDO11','APELLIDO22','666666000','DIRECCION1','33213','E',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

SELECT *
FROM HISTORIAL;

-- ----------------------------------Modificaion de la tabla usuaria---------------------------------------

-- ALTER TABLE USUARIAS
-- DROP COLUMN SOLICITA_OP;

-- ALTER TABLE HISTORIAL
-- DROP COLUMN SOLICITA_OP;

ALTER TABLE USUARIAS
ADD COLUMN SOLICITA_OP CHAR(1) DEFAULT '' AFTER COD_RIESGO;

ALTER TABLE HISTORIAL
ADD COLUMN SOLICITA_OP CHAR(1) DEFAULT '' AFTER COD_RIESGO;

ALTER TABLE USUARIAS
ADD CONSTRAINT CK_SOLICITA_OP CHECK(SOLICITA_OP IN ('', 'X'));

ALTER TABLE HISTORIAL
ADD CONSTRAINT CK_SOLICITA_OP_HISTORIAL CHECK(SOLICITA_OP IN ('', 'X'));

-- ----------------------------------------------Creamos una tabla de observaciones------------------------------

DROP TABLE IF EXISTS OBSERVACIONES;
CREATE TABLE OBSERVACIONES(
             COD_OBSERVACION INT AUTO_INCREMENT,
             COD_USUARIA INT,
             OBSERVACIONES TEXT,
             CONSTRAINT PK_OBSERVACIONES PRIMARY KEY (COD_OBSERVACION),
             CONSTRAINT FK_OBSERVACIONES_USUARIAS FOREIGN KEY (COD_USUARIA) REFERENCES USUARIAS(COD_USUARIA)            
             

);
