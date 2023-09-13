-- EJERCICIO: sigue los siguientes pasos en orden en que se especifican:

-- Crea una base de datos llamada CARRERAS.

DROP DATABASE IF EXISTS CARRERAS;
CREATE DATABASE CARRERAS CHARACTER SET utf8mb4;
USE CARRERAS;

-- Crea una tabla llamda USUARIOS con los siguientes campos:
	-- ID_USUARIO de tipo entero.
	-- USUARIO de tipo carácter de longitud 40.
	-- CREDITO de tipo numérico con 8 cifras significativas enteras y 2 decimales.
    
DROP TABLE IF EXISTS USUARIOS;
CREATE TABLE USUARIOS (
	ID_USUARIO INT ,
    USUARIO VARCHAR(40) ,
    CREDITO DECIMAL(10,2) 
   
    
);   

-- Crea una tabla llamda CABALLOS con los siguientes campos:
	-- ID_CABALLO de tipo entero.
	-- NOMBRE de tipo carácter y longitud 40.
	-- PUESTO de tipo entero positivo.
    
 DROP TABLE IF EXISTS CABALLOS;   
 CREATE TABLE CABALLOS (
	ID_CABALLO INT ,
    NOMBRE VARCHAR(40) ,
    PUESTO INT UNSIGNED 
   
    
);     

-- Crea una tabla llamda APUESTAS con los siguientes campos:
	-- ID_APUESTA de tipo entero.
	-- ID_USUARIO de tipo entero.
	-- ID_GANADOR de tipo entero.
	-- CANTIDAD de tipo numérico con 8 cifras significativas enteras y 2 decimales.

 DROP TABLE IF EXISTS APUESTAS;   
 CREATE TABLE APUESTAS (
	ID_APUESTA INT ,
    ID_USUARIO INT ,
    ID_GANADOR INT ,
    CANTIDAD DECIMAL(10,2)
    
); 



-- Altera las tablas para que los campos ID_USUARIO, ID_CABALLO e ID_APUESTA 
-- sean claves primarias y autoincrementales.


ALTER TABLE USUARIOS MODIFY COLUMN ID_USUARIO INT  AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE CABALLOS MODIFY COLUMN ID_CABALLO INT  AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE APUESTAS MODIFY COLUMN ID_APUESTA INT  AUTO_INCREMENT PRIMARY KEY;


-- Altera la 3ª tabla para que los campos ID_GANADOR e ID_USUARIO sean, respectivamente,
-- claves externas de USUARIOS y de CABALLOS. 

ALTER TABLE APUESTAS ADD CONSTRAINT FOREIGN KEY (ID_GANADOR) REFERENCES CABALLOS (ID_CABALLO);
ALTER TABLE APUESTAS ADD CONSTRAINT FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO);

-- Inserta, en este orden, 2 usuarios llamados "GANOSIEMPRE" con un crédito de 23.44 y
-- "Noséperder" con un crédito de 37.55

INSERT INTO USUARIOS VALUES(DEFAULT, "GANOSIEMPRE", 23.44),
                           (DEFAULT, "Noséperder", 37.55);

-- Inserta, en este orden, 3 caballos llamados "Galgo Andaluz", "Ferrarirrosso" y "Gandul".

INSERT INTO CABALLOS VALUES(DEFAULT,"Galgo Andaluz", NULL),
							(DEFAULT,"Ferrarirrosso", NULL),
                            (DEFAULT,"Gandul", NULL);

-- Crea un procedimiento con tres parámetros de entrada llamados:
	-- P_ID_USUARIO de tipo entero.
	-- P_ID_GANADOR de tipo entero.
	-- P_CANTIDAD, del mismo tipo que el campo CREDITO de la tabla USUARIO.
    
-- El procedimiento debe tener un condicional IF o un CASE que compruebe que la apuesta que
-- se va a efectuar no supere el crédito disponible para el usuario y otro IF o CASE para comprobar
-- que el ID_CABALLO introducido existe. Debe efectuar una inserción
-- en la tabla APUESTAS con un DEFAULT para el ID_APUESTA y los valores de los parámetros
-- introducidos para el resto. A continuación del INSERT.
    


     
	

    
    

