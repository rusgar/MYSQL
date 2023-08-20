/*EJERCICIO.- Antes de cargar el siguiente SCRIPT, modifícalo para que:
			1.- Sustitutye los comentarios por las setencias necesarias ****
            para que se inserten los datos correspondientes.
            2.- Cuando la base de datos ya haya sido creada, altera las tablas
            para que los campos ID_ALUMNO de ALUMNO e ID_CURSO de CURSO sean
            claves primarias.
            3.- Crea una nueva tabla llamada ASIGNACION con dos campos 
            llamados ID_ALUMNO e ID_CURSO que sean, respectivamente, claves 
            foráneas de ALUMNO y CURSO para saber qué cursos sigue cada alumno.
            4.- Asgina a los 6 primeros alumnos, los 2 primeros cursos; a los 7 últimos,
            los 2 últimos cursos, a los alumnos 7, 8 y 12 el curso 3 y a todos los alumnos
            excepto al 3 y al 7, el curso nº 3
            5.- Añade un campo llamado EDAD a la tabla ALUMNO y utiliza UPDATE para actualizar
            la edad.*/


DROP DATABASE IF EXISTS EDUCACENTRO;
CREATE DATABASE EDUCACENTRO;
USE EDUCACENTRO;

DROP TABLE IF EXISTS ALUMNO;
CREATE TABLE ALUMNO (
	ID_ALUMNO INT,
    NOMBRE CHAR(50),
    APELLIDO1 CHAR(50),
    APELLIDO2 CHAR(50),
    FECHA_NACIMIENTO DATE
    );
    
DROP TABLE IF EXISTS CURSO;
CREATE TABLE CURSO(
	ID_CURSO INT,
    NOMBRE CHAR(50),
    DESCRIPCION CHAR(70)
	);
    
 --   1.- Sustitutye los comentarios por las setencias necesarias ****
 --       para que se inserten los datos correspondientes.
    
 INSERT INTO ALUMNO VALUE(1, 'José', 'Josémiz', 'Manóliz', 20000101);
 INSERT INTO ALUMNO VALUE(2, 'Aarón', 'Anatoli', 'Manóliz', 19980101);
 INSERT INTO ALUMNO VALUE(3, 'Antonio', 'Josémiz', 'Jiménez', 20030101);
 INSERT INTO ALUMNO VALUE(4, 'José', 'Sábato', 'Domínguez', 19800101);
 INSERT INTO ALUMNO VALUE(5, 'Dolores', 'Consuelo', 'Remedios', 19800101);
 INSERT INTO ALUMNO VALUE(6, 'José', 'Aznar', 'González', 19860101);
 INSERT INTO ALUMNO VALUE(7, 'Felipe', 'González', 'Manóliz', 19600101);
 INSERT INTO ALUMNO VALUE(8, 'José', 'Márquez', 'Menéndez', 19600101);
 INSERT INTO ALUMNO VALUE(9, 'Anatoli', 'Kaspárez', 'Karpáez', 19980101);
 INSERT INTO ALUMNO VALUE(10, 'Vladimiro', 'Híjez', 'De Niro', 19980101);
 INSERT INTO ALUMNO VALUE(11, 'Miguel', 'Josémiz', 'Martos', 19560101);
 INSERT INTO ALUMNO VALUE(12, 'José', 'La Casa', 'Rojas', 19560101);
 INSERT INTO ALUMNO VALUE(13, 'Darío', 'Cassinni', 'Judínez', 19960101);

 INSERT INTO CURSO VALUE(1, 'Entrenador deportivo','Curso de preparación para entrenadores de cualquier tipo de deporte');
 INSERT INTO CURSO VALUE(2, 'Jardinería', 'Curso de alta jardinería');
 INSERT INTO CURSO VALUE(3, 'Logística', 'Preparación para gestión logística de puertos marítimos y aéreos');
 INSERT INTO CURSO VALUE(4, 'Micología', 'Curso para distinguir, recolectar y preparar todo tipo de setas');
 
 
--  2.- Cuando la base de datos ya haya sido creada, altera las tablas
--      para que los campos ID_ALUMNO de ALUMNO e ID_CURSO de CURSO sean
--      claves primarias.
 
 ALTER TABLE ALUMNO ADD PRIMARY KEY (ID_ALUMNO);
 ALTER TABLE CURSO ADD PRIMARY KEY (ID_CURSO);
 
 
--   3.- Crea una nueva tabla llamada ASIGNACION con dos campos 
--       llamados ID_ALUMNO e ID_CURSO que sean, respectivamente, claves 
--       foráneas de ALUMNO y CURSO para saber qué cursos sigue cada alumno.


CREATE TABLE ASIGNACION (
	ID_ALUMNO INT, 
    ID_CURSO INT, 
    FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO (ID_ALUMNO),
    FOREIGN KEY (ID_CURSO) REFERENCES CURSO (ID_CURSO)
    );
    
    
--  4.- Asgina a los 6 primeros alumnos, los 2 primeros cursos; a los 7 últimos,
--      los 2 últimos cursos, a los alumnos 7, 8 y 12 el curso 3 y a  los alumnos
--       3 y  7, el curso nº 4   

INSERT INTO ASIGNACION VALUES (1, 1), (1, 2);
INSERT INTO ASIGNACION VALUES (2, 1),(2, 2);
INSERT INTO ASIGNACION VALUES (3, 1),(3, 2), (3 , 4);
INSERT INTO ASIGNACION VALUES (4, 1),(4, 2) ;
INSERT INTO ASIGNACION VALUES (5, 1),(5, 2);
INSERT INTO ASIGNACION VALUES (6, 1),(6, 2);
INSERT INTO ASIGNACION VALUES (7, 3), (7, 4) ;
INSERT INTO ASIGNACION VALUES (8, 3);
INSERT INTO ASIGNACION VALUES (9, 3),(9, 4);
INSERT INTO ASIGNACION VALUES (10, 3),(10, 4) ;
INSERT INTO ASIGNACION VALUES (11, 3),(11, 4) ;
INSERT INTO ASIGNACION VALUES (12, 3);
INSERT INTO ASIGNACION VALUES (13, 3),(13, 4);


-- 5.- Añade un campo llamado EDAD a la tabla ALUMNO y utiliza UPDATE para actualizar
--    la edad.

ALTER  TABLE ALUMNO ADD EDAD INT;

update alumno
 set edad = year(current_date())- year(Fecha_nacimiento)
 where  id_alumno between 1 and 13 ;


     

