-- 1 -- Actualiza la fecha de los partidos de las jornadas 1 y 2 al 13 y 20 de agsoto 2023

  update partidos
         set fecha = '20230820'
         where jornada = 2;
  update partidos
        set fecha = '20230813'
        where jornada = 1;
  -- ------------------------------------------- Sacar un resultado para que te de entre 0 y 4 -------------------------------------     
        select floor(rand()* (4));
        
  -- 2 -----Conta quien jugo el ATl.Madrid la jornada 2--------------------------------------------------------------------------------
  
SELECT EQUIPOS.NOMBRE
FROM EQUIPOS WHERE ID_EQUIPO IN( SELECT PARTIDOS.ID_LOCAL
								 FROM PARTIDOS
                                 INNER JOIN EQUIPOS ON PARTIDOS.ID_VISITANTE= EQUIPOS.ID_EQUIPO
                                 WHERE JORNADA = 2 AND EQUIPOS.NOMBRE = 'ATLETICO DE MADRID')
                   OR ID_EQUIPO IN  ( SELECT PARTIDOS.ID_LOCAL
								 FROM PARTIDOS
                                 INNER JOIN EQUIPOS ON PARTIDOS.ID_VISITANTE= EQUIPOS.ID_EQUIPO
                                 WHERE JORNADA = 2 AND EQUIPOS.NOMBRE = 'ATLETICO DE MADRID') ;
  
  -- 3 ----------------------------------PARTIDOS JUGADOS POR EL VILLARREAL------------------------
  
  SELECT P_JUGADOS, PUNTOS, NOMBRE
  FROM EQUIPOS
  WHERE NOMBRE = 'VILLARREAL';
  
  -- 4 -------------------------------QUINES GANADOR LA PRIMERA JORNADA DE LIGA----------------------
  
  SELECT EQUIPOS.NOMBRE, PL.RESULTADO, PV.RESULTADO
  FROM EQUIPOS INNER JOIN PARTIDOS PL ON PL.ID_LOCAL = EQUIPOS.ID_EQUIPO
               INNER JOIN PARTIDOS PV ON PV.ID_VISITANTE = EQUIPOS.ID_EQUIPO
  WHERE (PL.JORNADA AND PV.JORNADA) = 1 
        AND (PL.RESULTADO LIKE 'L' OR PL.RESULTADO LIKE 'V')
        AND (PV.RESULTADO LIKE 'L' OR PV.RESULTADO LIKE 'V') ;
        
   -- 5 --------------------------QUE EQUIPOS TIENEN MAS DE 4 PUNTOS-----------------------------
   
   SELECT NOMBRE, PUNTOS
   FROM EQUIPOS
   WHERE PUNTOS > 4;
   
   -- --------------------------6 CUANTOS EQUIPOS TIENEN MAS DE 4 PUNTOS----------------------------
    SELECT COUNT(NOMBRE) AS 'NUMERO DE EQUIPOS'
   FROM EQUIPOS
   WHERE PUNTOS > 4;
   
-- ----------------------------------------------9 ORDENARLOS POR DIFERENCIA DE GOLES----------------
   
   SELECT NOMBRE, G_FAVOR- G_CONTRA AS golaveraje, PUNTOS
FROM equipos
order by puntos desc , golaveraje DESC;

-- 10 --------------------LISTADO DE LOS EQUIPOS QUE TIENEN > +6 DE GOLAVERAJE------------------------

SELECT NOMBRE, G_FAVOR- G_CONTRA AS 'golaveraje'
FROM EQUIPOS
WHERE   G_FAVOR- G_CONTRA > 6;

-- 11 -----------------LISTADO DE LOS EQUIPOS QYE TIENEN MENOS DE 3 PUNTOS-----------------------------
SELECT NOMBRE, PUNTOS
FROM EQUIPOS
WHERE PUNTOS < 3;
 
 -- 12 ------------------------------EQUIPOS QUE TIENEN SOLO 3 PUNTOS------------------------------------
 
SELECT NOMBRE, PUNTOS
FROM EQUIPOS
WHERE PUNTOS = 3;

 --  13 --------------------------CUANTOS EQUIPOS TIENEN MAS DE 4 PUNTOS-------------------------------------
 
 SELECT COUNT(PUNTOS) AS 'TOTAL_DE_EQUIPOS'
FROM EQUIPOS
WHERE PUNTOS > 4;

-- 14 --------------LISTADO DE LOS EQUIPOS QUE JUGARON COMO LOCALES LA JORANDA 3-----------------------------

SELECT PAR.ID_LOCAL,  EQP.NOMBRE, PAR.JORNADA
FROM PARTIDOS PAR
INNER JOIN EQUIPOS EQP ON PAR.ID_LOCAL= EQP.ID_EQUIPO
WHERE PAR.JORNADA= 3;

-- 15------------------------- CUANTOS EQUIPOS TIENEN MAS DE 15 GOLES A GAVOR--------------------------------

SELECT COUNT(NOMBRE) AS 'TOTAL'  
FROM EQUIPOS
WHERE G_FAVOR > 15;
 
 -- 16  ----------------UN LISTADO DE LOS ENFRENTAMIENTOS CON LOS MARCADORES DE LA SEGUNDA JORNADA Y ORDENARDOLOS DE POR GOLAVAREJE
 
 SELECT EL.NOMBRE AS 'LOCAL' ,  PAR.MARCADOR_LOCAL AS 'GOLES LOCAL' , PAR.MARCADOR_VISITANTE AS 'GOLES VISITANTE',  EV.NOMBRE AS 'VISITANTE'
 FROM PARTIDOS PAR 
 INNER JOIN EQUIPOS EL ON  EL.ID_EQUIPO= PAR.ID_LOCAL
 INNER JOIN EQUIPOS EV ON  EV.ID_EQUIPO= PAR.ID_VISITANTE
 WHERE PAR.JORNADA = 2 ORDER BY PAR.MARCADOR_LOCAL - PAR.MARCADOR_VISITANTE DESC ;
 
 -- 17 ---------------CUAL ES EL PARTIDO QUE HA HABIDO MAS DIFERENCIA DE GOLES----------------------------------

 
 SELECT EL.NOMBRE AS 'LOCAL',  Max(abs(MARCADOR_LOCAL- MARCADOR_VISITANTE)) AS 'DIFERENCIA DE GOLES',  EV.NOMBRE AS 'VISITANTE'
 FROM PARTIDOS PAR
 INNER JOIN EQUIPOS EV ON  EV.ID_EQUIPO= PAR.ID_VISITANTE
 INNER JOIN EQUIPOS EL ON  EL.ID_EQUIPO= PAR.ID_LOCAL
 GROUP BY ID_LOCAL ,  ID_VISITANTE
 ORDER BY 'DIFERENCIA DE GOLES' DESC LIMIT 1;
  
  -- 18  ---------------------SUBCONSULTA DE LA JORNADA 1 SIN EL INNER JOIN---------------------------
 SELECT NOMBRE
 FROM EQUIPOS
 WHERE ID_EQUIPO IN (SELECT ID_VISITANTE
                     FROM PARTIDOS
                     WHERE JORNADA =1);
                     
 SELECT NOMBRE
 FROM EQUIPOS
 WHERE ID_EQUIPO IN (SELECT ID_LOCAL
                     FROM PARTIDOS
                     WHERE JORNADA =1);
                     
 -- 19 --------------Sacar equipos segun sus pùestos , es decir, a partir del sexto  cuatro equipo----------
 
 select *
from equipos
order by puntos desc limit 4 offset 5;

SELECT * FROM liga.equipos ORDER BY PUESTO ASC;

-- 20 ----------------¿Cual son los tres equipos que mas partidos ha ganado en casa ?------------------------
select par.Id_Local, equp.nombre, count(equp.P_GANADOS) as ganados_en_casa
from equipos equp
inner join partidos par  on  par.Id_Local= equp.id_equipo
where resultado = 'L'
GROUP BY par.Id_Local
order by ganados_en_casa DESC LIMIT 3 ;




--  20 ----------------------¿Cual son los tres equipos que mas partidos ha ganado como visitante ?-----------
select  equp.nombre, count(equp.P_GANADOS) as Partidos_Ganados_Como_Visitante
from equipos equp
inner join partidos par  on  par.Id_visitante= equp.id_equipo
where par.Marcador_Local < par.Marcador_Visitante
GROUP BY equp.nombre
order by Partidos_Ganados_Como_Visitante  desc LIMIT 3;



-- 21 ---------------------Cual es el que mas ha empatado---------------------------------------------

select nombre, P_empatados as 'Empates'
from equipos 
order by  P_EMPATADOS desc limit 1;


-- 21 ---------------Listado de los equipos que han ganado mas de 11 partidos y meno r e igual de 15
select nombre, P_Ganados
from equipos
where P_Ganados >11 and P_Ganados <= 15
order by P_Ganados desc; 


-- 22 ------------------------------Cuantos equipos ganaron al Barcelona--------------------------                       
                         
SELECT COUNT(*) AS CANTIDAD_EQUIPOS_VENCEDORE
	FROM EQUIPOS EQUIP
		WHERE EQUIP.ID_EQUIPO IN 
			(SELECT PAR.ID_LOCAL
				FROM EQUIPOS EQUIP
					INNER JOIN PARTIDOS PAR ON PAR.ID_VISITANTE = EQUIP.ID_EQUIPO
						WHERE PAR.RESULTADO = 'L' AND EQUIP.NOMBRE = 'Barcelona')
		OR EQUIP.ID_EQUIPO IN
			(SELECT PAR.ID_VISITANTE
				FROM EQUIPOS EQUIP
					INNER JOIN PARTIDOS PAR ON PAR.ID_LOCAL = EQUIP.ID_EQUIPO
						WHERE PAR.RESULTADO = 'V' AND EQUIP.NOMBRE = 'Barcelona');
 
 
 
-- 23 ---------------------------------Que equipos empataron en la jornda 18 ------------------------
select locales.nombre, visitantes.nombre
from partidos
inner join equipos locales on locales.ID_EQUIPO = partidos.Id_Local
inner join equipos visitantes on visitantes.ID_EQUIPO = partidos.Id_Visitante
where jornada = 18 and resultado = 'E';


 -- ---------------------------------------------Otra manera de hacerlo con el UNION----------------------
select locales.nombre
from partidos
inner join equipos locales on locales.ID_EQUIPO = partidos.Id_Local
inner join equipos visitantes on visitantes.ID_EQUIPO = partidos.Id_Visitante
where jornada = 18 and resultado = 'E'
union
select  visitantes.nombre
from partidos
inner join equipos locales on locales.ID_EQUIPO = partidos.Id_Local
inner join equipos visitantes on visitantes.ID_EQUIPO = partidos.Id_Visitante
where jornada = 18 and resultado = 'E';
;

-- 24 -----------------------Que equipo jugo en la jornda 3 contra el Betis?------------------------------

select equipos.nombre
from equipos
where id_equipo in (select id_local
                    from partidos inner join equipos on partidos.id_visitante = equipos.id_equipo
                    where jornada = 3 and equipos.nombre like '%betis%')
                 or id_equipo in (select id_visitante
                                  from partidos inner join equipos on partidos.id_local = equipos.id_equipo
                                   where jornada = 3  and equipos.nombre like '%betis%') ;