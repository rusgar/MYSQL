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


-- ------------------------------SELECCIONA

                  