SET search_path TO LIGA, "$user";

DROP SCHEMA IF EXISTS LIGA CASCADE;

CREATE SCHEMA LIGA

CREATE TABLE EQUIPOS(
             ID_EQUIPO int NOT NULL,
             NOMBRE VARCHAR(50), 
             P_GANADOS int  DEFAULT 0,
             P_EMPATADOS int DEFAULT 0, 
             P_PERDIDOS int DEFAULT 0,
             G_FAVOR int DEFAULT 0,
             G_CONTRA int DEFAULT 0,
             P_JUGADOS int DEFAULT 0,
             PUNTOS int DEFAULT 0,
             puesto int,
             CONSTRAINT PK_EQUIPOS PRIMARY KEY (ID_EQUIPO)
);


create table PARTIDOS (
             Id_Local int NOT NULL, 
             Id_Visitante int NOT NULL,
             Marcador_Local int NOT NULL default 0,
             Marcador_Visitante int NOT NULL default 0,
             Resultado char (1) default null,
             Jornada int NOT NULL,
             fecha date,
             CONSTRAINT PK_PARTIDOS PRIMARY KEY (Id_Local, Id_Visitante),
             CONSTRAINT FK1_EQUIPOS foreign key (Id_Local) references equipos(id_equipo),
	         CONSTRAINT FK2_EQUIPOS foreign key (Id_VISITANTE) references equipos(id_equipo),
	         CONSTRAINT CK_RESULTADO CHECK (RESULTADO IN ('1','X','2')),
	         CONSTRAINT CK_JORNADA CHECK (JORNADA BETWEEN  1 AND 38)
    );







INSERT INTO EQUIPOS VALUES(1, 'Atlético de Madrid'),
						  (2, 'Real Madrid'),
						  (3, 'FC Barcelona'),
						  (4, 'Real Sociedad'),
						  (5, 'Real Betis Balompié'),
						  (6, 'Club Deportivo Eldense'),
						  (7, 'Real Sporting de Gijón'),
						  (8, 'Real Oviedo'),
						  (9, 'Sevilla FC'),
						  (10, 'Real Club Deportivo de la Coruña'),
						  (11, 'Caudal Deportivo'),
						  (12, 'Valencia CF'),
						  (13, 'Athlétic Club de Bilbao'),
						  (14, 'UP de Langreo'),
						  (15, 'Real Avilés Industrial CF'),
						  (16, 'RCD Espanyol de Barceolna'),
						  (17, 'CD Tineo'),
						  (18, 'Club Deportivo Asturias de Blimea'),
						  (19, 'Sociedad Deportiva Narcea'),
							  (20, 'Club Deportivo San Martín de Sotrondio');


SELECT *
FROM EQUIPOS;


-- JORNADA 1
INSERT INTO PARTIDOS VALUES (20,1,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (19,2,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (18,3,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (17,4,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (16,5,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (15,6,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (14,7,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (13,8,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (12,9,0, 0, DEFAULT, 1);
INSERT INTO PARTIDOS VALUES (11,10,0,0, DEFAULT,1);


SELECT *
FROM PARTIDOS;
-- -------------------------------------------------------
UPDATE PARTIDOS
SET MARCADOR_LOCAL = 1
WHERE ID_LOCAL = 20 AND ID_VISITANTE= 1;

SELECT RESULTADO
FROM PARTIDOS
WHERE ID_LOCAL = 20 AND ID_VISITANTE= 1;
-- ------------------------------------------------------
UPDATE PARTIDOS
SET MARCADOR_VISITANTE = 2
WHERE ID_LOCAL = 20 AND ID_VISITANTE= 1;

SELECT RESULTADO
FROM PARTIDOS
WHERE ID_LOCAL = 20 AND ID_VISITANTE= 1;

-- ----------------------------------------------------------------
ALTER TABLE PARTIDOS
ADD COLUMN FINALIZADO CHAR(1)
CHECK(FINALIZADO IN('S','N'));

UPDATE PARTIDOS SET FINALIZADO = 'S'
WHERE ID_LOCAL = 20;

-- -------------------------------------------------------------------

UPDATE PARTIDOS
SET FINALIZADO = 'S'
WHERE ID_LOCAL > 1;