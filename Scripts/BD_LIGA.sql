create database LIGA;
USE LIGA;

-- Cargamos el csv generado de la liga desde un periodico deportivo, desde el Table Date Import Wizard
-- ---------------------------------------------------------------------------------------------------------------------
 -- Alteramos la tabla para colocar la primary key de id_Equipo
     alter table equipos
     add constraint primary key (id_equipo);
     
  -- Añadimos un campo nuevo a la tabla creada
  
     alter table equipos
     add puesto int;
     
     
   -- Actualizamos la tabla para que el id_equipo tengas el mismo valor que el puesto y no salga null
    set global sql_safe_updates = 0;
    update equipos
	set puesto = id_equipo
    where id_equipo > 0;
    
    -- -------------------------------------------------------------------------------------------------------------------
    
     -- Cramos la tabla partiodasd para poder generar ambas tablas
Drop table if exists partidos;
create table partidos 
  ( Id_Local int, 
    Id_Visitante int,
    Marcador_Local int default 0,
    Marcador_Visitante int default 0,
    Resultado char (1) default null,
    Jornada int,
    fecha date,
    primary key (Id_Local, Id_Visitante ),
    foreign key (Id_Local) references equipos(id_equipo),
	foreign key (Id_Visitante) references equipos(id_equipo)
    );
    
  -- ------------------------------------------------------------------------------------------------  
  -- Insertamos los partidos de dos jornadas sin los resultados
  
    -- Jornada 1 
    insert into partidos values(1, 11,null,null,default,1,null);
    insert into partidos values(2, 12,null,null,default,1,null);
    insert into partidos values(3, 13,null,null,default,1,null);
    insert into partidos values(4, 14,null,null,default,1,null);
    insert into partidos values(5, 15,null,null,default,1,null);
    insert into partidos values(6, 16,null,null,default,1,null);
    insert into partidos values(7, 17,null,null,default,1,null);
    insert into partidos values(8, 18,null,null,default,1,null);
    insert into partidos values(9, 19,null,null,default,1,null);
    insert into partidos values(10, 20,null,null,default,1,null);
	
	-- Jornada 2 
    insert into partidos values(12, 1,null,null,default,2,null);
    insert into partidos values(13, 2,null,null,default,2,null);
    insert into partidos values(14, 3,null,null,default,2,null);
    insert into partidos values(15, 4,null,null,default,2,null);
    insert into partidos values(16, 5,null,null,default,2,null);
    insert into partidos values(17, 6,null,null,default,2,null);
    insert into partidos values(18, 7,null,null,default,2,null);
    insert into partidos values(19, 8,null,null,default,2,null);
    insert into partidos values(20, 9,null,null,default,2,null);
    insert into partidos values(11, 10,null,null,default,2,null);
    
    -- Metemos la fecha a la jornada 1 y 2 
    
   update partidos
   set fecha = '20230820'
   where jornada = 2;
   
    update partidos
   set fecha = '20230813'
   where jornada = 1;
   
   
