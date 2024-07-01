 -- ver los usuarios creados
    set global log_bin_trust_function_creators = 1;
    use cine;
 -- creacion de procedimientos--------------------------------------
  delimiter $$
 drop procedure if exists insertarNacionalidad $$
create procedure insertarNacionalidad ( IN gentilicio varchar(40), IN pais varchar(40))
    begin      
    declare numeroConincidencias int  default 0;
-- ------------------------- comprueba si la insercion existe
    select count(nacionalidades.pais) into numeroConincidencias
       from nacionalidades
       where nacionalidades.pais like  concat('%',pais,'%');
       if numeroConincidencias = 0 then
 -- --------------------------- realiza la insercion
		   insert into nacionalidades(nacionalidades.gentilicio, nacionalidades.pais)
           values(gentilicio, pais);
        end if;  
 -- ---------------------------- devuelve la tabla para verificar
     select * 
     from nacionalidades
     where nacionalidades.pais like concat('%', pais, '%');      
    
    end
    $$
    
    -- ----------------  creacion de un proceciemitos con tres funciones(sacar IDPersonajes, IDPeliculas,IDActor----------
   

  delimiter $$
  drop function if exists obtenerIdPersonaje $$
  create function obtenerIdPersonaje(nombre varchar(80)) returns int
  begin
  declare retorno int default 0;
  
  select personajes.id   into retorno
  from personajes 
  where lower(personajes.nombre) like concat('%', nombre, '%'); 
  return retorno;
  end
  $$
  
  
   -- -----------------------------------IDpelicula-----------------
    delimiter $$


  drop function if exists obtenerIdPelicula $$
  create function obtenerIdPelicula(titulo varchar(30)) returns int
  begin
  declare retorno int default 0;
  
  select peliculas.id   into retorno
  from peliculas 
  where lower(peliculas.titulo) like concat('%', titulo, '%'); 
  return retorno;
  end
  $$
  
   -- -----------------------------------IDActor-----------------
   
   
      delimiter $$


  drop function if exists obtenerIdActor $$
  create function obtenerIdActor(nombre varchar(80), apellido varchar (80)) returns int
  begin
  declare retorno int default 0;
  
 select actores.id into retorno
 from personas inner join actores
 on personas.id= actores.id_persona
 where  personas.nombre like concat('%',nombre,'%') and personas.apellido like concat('%',apellido,'%');
 return retorno;
  end
  $$
  
  -- --------------------------------------- creacion del proce---------------
  
 delimiter $$
 drop procedure if exists insertarPersonajesPelicula $$
create procedure insertarPersonajesPelicula( IN nombrePersonaje varchar(80),
                                             IN tituloPelicula varchar(40),
                                             IN nombreActor varchar (80),
                                             IN apellidoActor varchar (80))
begin

-- declaracmos la variables
declare IDPersonaje int default 0;
declare IDPelicula int default 0;
declare IDActor int default 0;
declare numeroCoincidencias int default 0;

-- Obtenemos las variables a traves de las funciones creadas anterioremente
set IDPersonaje = obtenerIDPersonaje(nombrePersonaje);
set IDPelicula = obtenerIDPelicula(tituloPelicula);
set IDActor=obtenerIDActor(nombreActor,apellidoActor);

-- Comprabar si la insercion exsite

   select count(personajes_peliculas.id) into numeroCoincidencias
   from personajes_peliculas 
   where personajes_peliculas.id_personaje =IDPersonaje
   and  personajes_peliculas.id_pelicula = IDPelicula
   and  personajes_peliculas.id_actor= IDActor;
   
   
   -- Comprobacion de las inserciones
   if numeroCoincidencias = 0 then
   insert into personajes_peliculas(personajes_peliculas.id_personaje,
                                   personajes_peliculas.id_pelicula,
                                   personajes_peliculas.id_actor)
         values (  IDPersonaje, IDPelicula , IDActor);
     end if;    
   



-- Insertmaos de la tabla en cuestion los datos de cada uno de ellos segun sus variables
  insert into personajes_peliculas(personajes_peliculas.id_personaje,
                                   personajes_peliculas.id_pelicula,
                                   personajes_peliculas.id_actor)
         values (  IDPersonaje, IDPelicula , IDActor);
  
  
  -- Realiamos las consultas de la tabla en cuestion relacionando la bussqueda  y condicion segun las varibales que hemos menciobado
   select personajes_peliculas.id
   from personajes_peliculas 
   where personajes_peliculas.id_personaje =IDPersonaje
   and  personajes_peliculas.id_pelicula = IDPelicula
   and  personajes_peliculas.id_actor = IDActor;

end
$$