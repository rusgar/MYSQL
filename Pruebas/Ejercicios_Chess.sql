DROP DATABASE IF EXISTS CHESS;
CREATE DATABASE	CHESS;
USE CHESS;

-- Importamos la tabla del csv que hemos descargo de FIDE


  -- Alteramos la tabla y colocamos el id_jugador
   alter table jugadores add id_jugador int;  
   set global sql_safe_updates = 0;
  
  
  -- Actualizamos la tabla para que el id_jugador tengas el mismo valor que el puesto y no salga null
    update jugadores
	set id_jugador = puesto
    where puesto > 0;
    
  -- alteramos la tabla para colocar la primary key de id_jugadopr
     alter table jugadores
     add constraint primary key (id_jugador);
     
 -- Vemos que jugadores son de USa y de China y ordenados por fecha nacimeinto    
Select JUGADORES.*
from jugadores
where pais = 'USA' or pais = 'CHN'
order by Byear;

Select *
from jugadores
where pais = 'USA' or pais = 'CHN'
order by PAIS DESC, ELO DESC;
-------------------------------------------------------------------------------------------------------

SELECT COUNT(*), PAIS
 FROM JUGADORES
 where pais = 'USA' or pais = 'CHN'
group by PAIS;
---------------------------------------------------------------------------------------------------------
-- Vamos a hacer una consulta que nos devuelva los jugadores que nacieron entre 1980 y 1990

Select jugador, elo, byear
from jugadores
where BYEAR between '1980' and '1990' 
order by byear asc;

-- --------------------------------------------------------------------------------------------------------
 -- Cramos la tabla partiodasd para poder generar ambas tablas
Drop table if exists partidas;
create table partidas 
  (  Id_partida int auto_increment,
    Id_jugador_B int, 
    Id_jugador_N int,
    lugar char (50),
    Movimientos int,
    Duracion time,
    resultado char (1),
    fecha date,
    primary key (Id_partida),
    foreign key (id_jugador_B) references jugadores(id_jugador),
	foreign key (id_jugador_N) references jugadores(id_jugador)
    );
    
    Insert into  partidas values (default, 1, 2, 'Gijon', 55,'2:33:47', 'N','20230721');
	Insert into  partidas values (default, 3, 4, 'Madrid', 33,'5:03:47', 'n','20230724');
     Insert into  partidas values (default, 2, 3, 'Oviedo', 33,'5:03:47', 'B','20230723');
     Insert into  partidas values (default, 1, 4, 'Oviedo', 33,'5:03:47', 'B','20230719');
     
     

-- ¿Como se llama el jugador de negras de la partida que se jugo el dia 21 de julio de 2023?

Select jugador
from jugadores 
inner join partidas on jugadores.id_jugador = partidas.Id_jugador_N
where partidas.fecha = 20230721;

-- Sacamos que jugadores son de España
Select *
  from jugadores 
  where pais = 'ESP'
  order by id_jugador desc;
  
  -- Enlazar dos tablas para los jugadores, sacmos los datos de los nombres de las partidas de los jugadores
  
  SELECT PAR.ID_PARTIDA, J1.JUGADOR, J2.JUGADOR, PAR.LUGAR, PAR.MOVIMIENTOS, PAR.DURACION, PAR.RESULTADO
  FROM PARTIDAS PAR
  INNER JOIN JUGADORES J1 ON J1.ID_JUGADOR = PAR.ID_JUGADOR_B
  INNER JOIN JUGADORES J2 ON J2.ID_JUGADOR = PAR.ID_JUGADOR_N;
  
  -- Metemos una pàrtida que no se ha jugado, y despues la actualizamos pues nos dan el resultado, con 105 mov y duro 1:49:27 y gano blancas
  
   Insert into  partidas values (default, 5, 10, 'Aviles', null,null, null,'20230725');
   
   
   update partidas
   set Movimientos = 105, Duracion = '014927', resultado ='B'
   where id_partida = 6;
   
    Insert into  partidas values (default, 5, 10, 'Barcelona', null,null, null,'20230718');
    
   update partidas
   set Movimientos = 20, Duracion = '003022', resultado ='N'
   where id_partida = 7;
   
   -- Nacionalidad del ganador y naciobnalidad de la partida que se jugo el dia 2207
    
   SELECT JUG.PAIS, JUG.JUGADOR, PAR.RESULTADO
  FROM PARTIDAS PAR
  INNER JOIN JUGADORES JUG ON JUG.ID_JUGADOR = PAR.ID_JUGADOR_B  
  WHERE PAR.FECHA = '20230724' ; 
  

                                  


