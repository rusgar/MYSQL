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