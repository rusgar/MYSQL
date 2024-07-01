use neptuno;
-- ----------------  creacion de un proceciemitos con tres funciones(sacar IdDirector, IdProductor,IdPegui----------

-- --------------------------------------------comnsulta-----------------------------------------

-- select directores.id, personas.nombre, personas.apellido
-- from directores inner join personas
-- on directores.id_persona = personas.id
-- where personas.nombre like '%peter%' and personas.apellido like  '%jac%'  ;


-- ---------------------------------obtener el Iddirector con una funcion--------------------------------
  delimiter $$
  drop function if exists obtenerIdDirector $$
  create function obtenerIdDirector(nombre varchar(80), apellidos varchar(80)) returns int
  begin
  declare  retorno int default 0;

  select directores.id into retorno
  from directores inner join personas
  on directores.id_persona = personas.id
  where lower(personas.nombre) like concat('%',nombre,'%') and lower(personas.apellido) like concat('%',apellidos,'%');
  return retorno;
  end
  $$
  
  -- --------------------------------------------comnsulta-----------------------------------------

 -- select productores.id, personas.nombre, personas.apellido
--  from productores inner join personas
--  on productores.id_persona = personas.id
--  where personas.nombre like '%barr%' and personas.apellido like  '%osb%'  ;


-- ---------------------------------obtener el Idproductor con una funcion--------------------------------
  delimiter $$
  drop function if exists obtenerIdProductor $$
  create function obtenerIdProductor(nombre varchar(80), apellidos varchar(80)) returns int
  begin
  declare  retorno int default 0;

  select productores.id into retorno
  from productores inner join personas
  on productores.id_persona = personas.id
  where lower(personas.nombre) like concat('%',nombre,'%') and lower(personas.apellido) like concat('%',apellidos,'%'); 
  return retorno;
  end
  $$
  
  -- --------------  consulta de la tabla peguis------------------------
  
-- select peguis.nombre
-- from peguis
-- where  peguis.nombre  like '%18%';


-- ---------------------------------obtener el IdPegui con una funcion--------------------------------
  delimiter $$
  drop function if exists obtenerIdPegui $$
  create function obtenerIdPegui(nombre varchar(80)) returns int
  begin
  declare  retorno int default 0;

  select peguis.id into retorno
  from peguis
  where  lower(peguis.nombre)  like concat('%',nombre,'%'); 
  return retorno;
  end
  $$
  
  -- -----------------------------Creaacion del procedimiento con las tres variables de las funciones creadas----------------
  
  
delimiter $$
 drop procedure if exists crearPeliculas $$
create procedure crearPeliculas( IN titulo varchar(30),
                                 IN fecha datetime,
                                 IN duracion int,
                                 IN nombreDirector varchar(80),
                                 IN apellidoDirector varchar(80),
                                 IN nombreProductor varchar (80),
                                 IN apellidoProductor varchar (80),
                                 IN nombrePegui varchar (80))
                                             
begin

-- Declaramos la variables--------------------------------------------------------
declare IdDirector int default 0;
declare IdProductor int default 0;
declare IdPegui int default 0;
declare concordancia int default 0;

set IdDirector=obtenerIdDirector(nombreDirector,apellidoDirector);
set IdProductor=obtenerIdProductor(nombreProductor,apellidoProductor);
set IdPegui=obtenerIdPegui(nombrePegui);

-- Comprabar si la insercion exsite---------------------------------------------

   select count(peliculas.id) into concordancia
   from peliculas
    where peliculas.titulo = titulo 
    and peliculas.fecha= fecha
    and peliculas.duracion=duracion       
    and peliculas.id_director =IdDirector 
    and  peliculas.id_productor = IdProductor
    and  peliculas.id_pegui = IdPegui;
    
    
  
     
     -- Insertmaos de la tabla en cuestion los datos de cada uno de ellos segun sus variables----------
          insert into peliculas(peliculas.titulo,
                               peliculas.fecha,
                               peliculas.duracion,
                               peliculas.id_director,
                               peliculas.id_productor,
                               peliculas.id_pegui)
                  values (titulo,fecha,duracion, IdDirector, IdProductor ,  IdPegui);
                  
  -- hacemos las consultas de la tabla en cuestion relacionando la bussqueda  y condicion segun las varibales que hemos menciobado
    select peliculas.id
    from peliculas 
    where peliculas.titulo = titulo 
    and peliculas.fecha= fecha
    and peliculas.duracion=duracion       
    and peliculas.id_director =IdDirector 
    and  peliculas.id_productor = IdProductor
    and  peliculas.id_pegui = IdPegui;
                  
  
   



end
$$                                             