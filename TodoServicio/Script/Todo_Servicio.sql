-- EJERCICIO.- La empresa Totoservicios S. L. ha decidido organizar los datos relevantes de su empresa
-- siguiendo el modelo relacional. Lanza el SCRIPT, observa los datos, considera que existe una entidad
-- llamada CLIENTE y otra SERVICIO, normaliza la base de datos hasta, al menos, la 4ª forma nomral,
-- y crea un SCRIPT con todas las instrucciones SQL de creación de tablas e inserción de datos. 
DROP DATABASE IF EXISTS TODOSERVICIO;
CREATE DATABASE TODOSERVICIO;
USE TODOSERVICIO;

DROP TABLE IF EXISTS DATOS;
CREATE TABLE DATOS(
	ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    APELLIDO1 VARCHAR(50),
    APELLIDO2 VARCHAR(50),
    POBLACION VARCHAR(50),
    SERVICIO VARCHAR(100),
    TARIFA_DIA DECIMAL(12,3),
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    TOTAL DECIMAL(12,3),
    CONSTRAINT PK_DATOS PRIMARY KEY (ID)
);

INSERT INTO DATOS VALUES
					(DEFAULT, 'José', 		'Josémiz', 		'Diéguez', 		'Oviedo', 	'Limpieza del hogar', 		39.95, 20230801, 20230802, 0),
					(DEFAULT, 'José', 		'Josémiz', 		'Diéguez', 		'Oviedo', 	'Limpieza de fincas', 		49.95, 20230802, 20230805, 0),
					(DEFAULT, 'Miguel', 	'Jalisco', 		'Tamariz', 		'Avilés', 	'Limpieza del hogar', 		39.95, 20230813, 20230814, 0),
					(DEFAULT, 'Josefina', 	'Del Manzano', 	'Cantamáriz', 	'Oviedo', 	'Limpieza de fincas', 		49.95, 20230815, 20230818, 0),
					(DEFAULT, 'Josefina', 	'Del Manzano', 	'Cantamáriz', 	'Oviedo', 	'Jardinería avanzado', 		59.95, 20230821, 20230825, 0),
					(DEFAULT, 'Antonia', 	'La Peral', 	'De La Isla', 	'Gijón', 	'Jardinería básico', 		34.95, 20230802, 20230802, 0),
					(DEFAULT, 'Antonia', 	'La Peral', 	'De La Isla', 	'Gijón', 	'Cuidado de niños', 		44.95, 20230801, 20230802, 0),
					(DEFAULT, 'Antonia', 	'La Peral', 	'De La Isla', 	'Gijón', 	'Cuidado de niños', 		44.95, 20230801, 20230802, 0),
					(DEFAULT, 'Mario', 		'Roncesvalles', 'Del Mar', 		'Gijón', 	'Jardinería avanzado', 		59.95, 20230801, 20230802, 0),
					(DEFAULT, 'Mario', 		'Roncesvalles', 'Del Mar', 		'Gijón', 	'Jardinería avanzado', 		59.95, 20230807, 20230808, 0),
					(DEFAULT, 'Mario', 		'Roncesvalles', 'Del Mar', 		'Gijón', 	'Acompañamiento mayores',	49.95, 20230809, 20230809, 0),
					(DEFAULT, 'Mario', 		'Roncesvalles', 'Del Mar', 		'Gijón', 	'Limpieza del hogar', 		39.95, 20230810, 20230812, 0),
					(DEFAULT, 'Marina', 	'Jardínez', 	'Guaigo', 		'Oviedo', 	'Acompañamiento mayores', 	49.95, 20230810, 20230811, 0),
					(DEFAULT, 'Perfecto', 	'Arteta', 		'Índigo', 		'Avilés', 	'Cuidado de niños', 		44.95, 20230810, 20230812, 0),
					(DEFAULT, 'Perfecta', 	'González', 	'Redruello', 	'Avilés', 	'Limpieza del hogar', 		39.95, 20230801, 20230802, 0),
					(DEFAULT, 'Perfecta', 	'González', 	'Redruello', 	'Avilés', 	'Limpieza del hogar', 		39.95, 20230801, 20230802, 0),
					(DEFAULT, 'Perfecta', 	'González', 	'Redruello', 	'Avilés', 	'Limpieza del hogar', 		39.95, 20230810, 20230811, 0),
					(DEFAULT, 'Perfecta', 	'González', 	'Redruello', 	'Avilés', 	'Limpieza del hogar', 		39.95, 20230820, 20230820, 0),
					(DEFAULT, 'Luzdivina', 	'Jiménez', 		'Montfort', 	'Gijón', 	'Limpieza de fincas', 		49.95, 20230801, 20230802, 0),
					(DEFAULT, 'Eustaquio', 	'Ramírez', 		'Buendía', 		'Oviedo', 	'Jardinería avanzado', 		59.95, 20230813, 20230815, 0),
					(DEFAULT, 'Pedro', 		'Ardínez', 		'Flórez', 		'Oviedo', 	'Jardinería básico', 		34.95, 20230823, 20230823, 0),
					(DEFAULT, 'Aurora', 	'Yávez', 		'Yamiyé', 		'Gijón', 	'Cuidado de niños', 		44.95, 20230822, 20230822, 0);
                    
UPDATE DATOS
	SET TOTAL = TARIFA_DIA * (FECHA_FIN - FECHA_INICIO + 1)
	WHERE ID > 0;
    
SELECT * FROM DATOS;