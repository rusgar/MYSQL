-- ------------------------------Actualizamos el vuelo de Oviedo a Milán: 08/08/23 y dura 2 horas y media-----------------
UPDATE VIAJES
SET DURACION = '02:30:00' , FECHA_HORA ='20230808160000'
WHERE ID_ORIGEN =(SELECT ID_AEROPUERTO
                  FROM AEROPUERTOS
                  WHERE NOMBRE ='Oviedo')
and ID_DESTINO = (SELECT ID_AEROPUERTO
                  FROM AEROPUERTOS
                  WHERE NOMBRE ='Milán');
                  

-- -----------------------------------------------Otra forma de sacar los vuelos de Oviedo a Milán-------------------------
select *
from viajes
INNER JOIN AEROPUERTOS A_ORIGEN ON VIAJES.ID_ORIGEN = A_ORIGEN.ID_AEROPUERTO
INNER JOIN AEROPUERTOS A_DESTINO ON VIAJES.ID_DESTINO = A_DESTINO.ID_AEROPUERTO
WHERE A_ORIGEN.NOMBRE = 'Oviedo' AND A_DESTINO.NOMBRE ='Milan';


-- --------------------------Que se vea ID_VUELO, PAIS ORIGEN, PAIS DESTINO, DURACION. FECHA Y HORA----------------------------

select VIAJES.ID_VUELO AS 'NUMERO DE VUELO', 
       CONCAT(A_ORIGEN.NOMBRE, ' ( ' ,P_ORIGEN.NOMBRE,  ' )') AS 'ORIGEN',
       CONCAT(A_DESTINO.NOMBRE, ' ( ' ,P_DESTINO.NOMBRE, ' )') AS 'DESTINO',
       VIAJES.DURACION 'DURACION DEL VUELO',
	   VIAJES.FECHA_HORA 'FECHA Y HORA'
from VIAJES
INNER JOIN AEROPUERTOS A_ORIGEN ON VIAJES.ID_ORIGEN = A_ORIGEN.ID_AEROPUERTO
          INNER JOIN PAISES P_ORIGEN ON P_ORIGEN.ID_PAIS= A_ORIGEN.ID_PAIS
INNER JOIN AEROPUERTOS A_DESTINO ON VIAJES.ID_DESTINO = A_DESTINO.ID_AEROPUERTO
         INNER JOIN PAISES P_DESTINO ON P_DESTINO.ID_PAIS= A_DESTINO.ID_PAIS          
WHERE A_ORIGEN.NOMBRE = 'Oviedo' AND A_DESTINO.NOMBRE ='Milan' ;


-- -----------------------------AEROPUERTO (PAIS) SALIDA, AEROPUERTO (PAIS) DE LLEGADA, FECHA,HORA----------------------

SELECT CONCAT(A_ORIGEN, ' ( ' ,PAIS_ORIGEN,  ' )') AS 'AEROPUERTO DE ORIGEN',
       CONCAT(A_DESTINO, ' ( ' ,PAIS_DESTINO,  ' )') AS 'AEROPUERTO DE DESTINO',      
       FECHA,
       HORA
FROM VIAJES
WHERE FECHA = '20230808';

-- -------------------------------QUIERO SELECCIONAR LOS VUELOS QUE HAY ENTRE EL 1208 Y AL 1508------------------------

SELECT *
FROM VIAJES
WHERE FECHA BETWEEN 20230812 AND 20230815;


-- ---------------------------------------Ojo a tener en cuenta al cargar el CSV POR SI HAY FALTAS -----------------

ALTER TABLE VIAJES MODIFY COLUMN HORA TIME;

UPDATE VIAJES
SET A_ORIGEN = 'Milán' 
where A_ORIGEN = 'MilÃ¡n' ;

UPDATE VIAJES
SET A_ORIGEN = 'París'
where A_ORIGEN =  'ParÃ­s';

UPDATE VIAJES
SET A_DESTINO = 'Milán' 
where A_DESTINO ='MilÃ¡n' ;

UPDATE VIAJES
SET A_DESTINO = 'París'
where A_DESTINO = 'ParÃ­s';


UPDATE VIAJES
SET pais_origen = 'España' 
where pais_origen ='EspaÃ±a'
 ;

UPDATE VIAJES
SET pais_DESTINO = 'España'
where pais_DESTINO = 'EspaÃ±a';

DELETE FROM VIAJES
WHERE HORA LIKE  '%%:%%:12';


-- ------------------------------------QUE VUELOS SALEN DE MILAN Y SU DESTINO----------------------------

SELECT  ID_TIPO_VUELO, A_ORIGEN, COMPANIA, A_DESTINO, FECHA
FROM VIAJES
WHERE A_ORIGEN = 'Milan';

-- -----------------------------------------PERO QUEREMOS SABER CUALES SON DIRECTOS ---------------------------

SELECT  TIPO_VUELO, A_ORIGEN, COMPANIA, A_DESTINO, FECHA
FROM VIAJES
INNER JOIN TIPO_VUELO ON VIAJES.ID_TIPO_VUELO = TIPO_VUELO.ID_TIPO
WHERE A_ORIGEN = 'Milan' AND ID_TIPO_VUELO = 'V';