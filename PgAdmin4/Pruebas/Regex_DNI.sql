CREATE SCHEMA PRUEBAS;

SET SEARCH_PATH TO PRUEBAS, "$USER";

CREATE TABLE TB_PRUEBA(
             ID_PERSONA SERIAL,
	         DNI CHAR(9)

);

ALTER  TABLE TB_PRUEBA
      ADD CONSTRAINT CK_DNI
	  CHECK (SUBSTRING (DNI,1,8) ~'^[0-9]+$'
	  AND  SUBSTRING (DNI,9,1) ~'^[A-Z]+$');
	  
	  
INSERT INTO TB_PRUEBA VALUES (DEFAULT, '12345678B');	  

SELECT *
FROM TB_PRUEBA;

DELETE FROM  TB_PRUEBA
WHERE ID_PERSONA > 1;
	  