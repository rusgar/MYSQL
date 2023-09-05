DROP DATABASE IF EXISTS TODOSERVICIO_NORM;
CREATE DATABASE TODOSERVICIO_NORM;
USE TODOSERVICIO_NORM;


-- -------- CREAMOS LA PRIMERA TABLA DE POBLACION---------------------
DROP TABLE IF EXISTS POBLACION;
CREATE TABLE POBLACION (
	ID_POBLACION INT AUTO_INCREMENT,
    POBLACION VARCHAR(50) NOT NULL,
    CONSTRAINT PK_POBLACION PRIMARY KEY (ID_POBLACION)
);
INSERT INTO POBLACION VALUES(DEFAULT, 'Gijón'),
							(DEFAULT, 'Oviedo'),
                            (DEFAULT, 'Avilés');
                             

-- -------- CREAMOS LA SEGUNDA TABLA DE CLIENTES---------------------
DROP TABLE IF EXISTS CLIENTE;
CREATE TABLE CLIENTE (
	ID_CLIENTE INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO1 VARCHAR(50) NOT NULL,
    APELLIDO2 VARCHAR(50) NOT NULL,
    ID_POBLACION INT,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE),
    CONSTRAINT FK_ID_POBLACION FOREIGN KEY (ID_POBLACION) REFERENCES POBLACION(ID_POBLACION)
);


INSERT INTO CLIENTE VALUES
					(DEFAULT, 'José', 		'Josémiz', 		'Diéguez', 		2),
					(DEFAULT, 'Miguel', 	'Jalisco', 		'Tamariz', 		3),
					(DEFAULT, 'Josefina', 	'Del Manzano', 	'Cantamáriz', 	2),
					(DEFAULT, 'Antonia', 	'La Peral', 	'De La Isla', 	1),
					(DEFAULT, 'Mario', 		'Roncesvalles', 'Del Mar', 		1),
					(DEFAULT, 'Marina', 	'Jardínez', 	'Guaigo', 		2),
					(DEFAULT, 'Perfecto', 	'Arteta', 		'Índigo', 		3),
					(DEFAULT, 'Perfecta', 	'González', 	'Redruello', 	3),
					(DEFAULT, 'Luzdivina', 	'Jiménez', 		'Montfort', 	1),
					(DEFAULT, 'Eustaquio', 	'Ramírez', 		'Buendía', 		2),
					(DEFAULT, 'Pedro', 		'Ardínez', 		'Flórez', 		2),
					(DEFAULT, 'Aurora', 	'Yávez', 		'Yamiyé', 		1);


-- -------------------- CREAMOS LA TERCERA TABLA DE SERVICIOS OPERTADOS---------------------------


DROP TABLE IF EXISTS SERVICIOS_OFERTADOS;
CREATE TABLE SERVICIOS_OFERTADOS (
	ID_SERVICIO INT  AUTO_INCREMENT,
    SERVICIO  VARCHAR (50) NOT NULL,
    TARIFA_DIA VARCHAR(50),    
    CONSTRAINT PK_SERVICIOS_OFERTADOS PRIMARY KEY (ID_SERVICIO)
    
);

INSERT INTO SERVICIOS_OFERTADOS VALUES
					(DEFAULT, 	'Limpieza del hogar', 		39.95  ),
					(DEFAULT, 	'Limpieza de fincas', 		49.95  ),
					(DEFAULT, 	'Jardinería avanzado', 		59.95  ),
					(DEFAULT, 	'Jardinería básico', 		34.95  ),
					(DEFAULT, 	'Cuidado de niños', 		44.95  ),
					(DEFAULT, 	'Acompañamiento mayores',	49.95  ),
					(DEFAULT, 	'Limpieza del hogar', 		39.95  );
					

-- -------------------- CREAMOS LA CUARTA TABLA DE SERVICIOS CONTRATADOS---------------------------

DROP TABLE IF EXISTS SERVICIOS_CONTRATADOS;
CREATE TABLE SERVICIOS_CONTRATADOS (
	ID_CONTRATADO INT  AUTO_INCREMENT,
    ID_CLIENTE INT,
    ID_SERVICIO INT,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    TOTAL DECIMAL(12,2),
    CONSTRAINT PK_SERVICIOS_CONTRATADOS PRIMARY KEY (ID_CONTRATADO),
    CONSTRAINT FK_ID_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
   CONSTRAINT FK_ID_SERVICIO FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIOS_OFERTADOS(ID_SERVICIO)  
  
    
);

insert into servicios_contratados values(default, 1, 1, 20230801,	20230802,NULL),
                                        (default, 1, 2, 20230802,	20230805,NULL),
                                        (default, 2, 1, 20230813,	20230814,NULL),
                                        (default, 3, 2, 20230815,	20230818,NULL),
                                        (default, 3, 3, 20230821,	20230825,NULL),
                                        (default, 4, 4, 20230802,	20230802,NULL),
                                        (default, 4, 5, 20230801,	20230802,NULL),
                                        (default, 4, 5, 20230801,	20230802,NULL),
                                        (default, 5, 3, 20230801,	20230802,NULL),
                                        (default, 5, 3, 20230807,	20230808,NULL),
                                        (default, 5, 6, 20230809,	20230809,NULL),
                                        (default, 5, 1, 20230810,	20230812,NULL),
                                        (default, 6, 6, 20230810,	20230811,NULL),
                                        (default, 7, 5, 20230810,	20230812,NULL),
                                        (default, 8, 1, 20230801,	20230802,NULL),
                                        (default, 8, 1, 20230801,	20230802,NULL),
                                        (default, 8, 1, 20230810,	20230811,NULL),
                                        (default, 8, 1, 20230820,	20230820,NULL),
                                        (default, 9, 2, 20230801,	20230802,NULL),
                                        (default, 10,3, 20230813,	20230815,NULL),
                                        (default, 11,4, 20230823,	20230823,NULL),
                                        (default, 12,5, 20230822,	20230822,NULL);
                                        
 



