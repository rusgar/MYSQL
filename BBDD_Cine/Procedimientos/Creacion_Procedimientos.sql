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


-- Crear un procedimiento que me permita introducir nuevos géneros a películas---------------------------------
-- -----------Creamos las funciones para obtener el Genero------------------------- 
DELIMITER $$
DROP FUNCTION IF EXISTS obtenerIdGenero $$
CREATE FUNCTION obtenerIdGenero(nombre VARCHAR(80)) RETURNS INT
BEGIN
DECLARE retorno INT DEFAULT 0;

SELECT cine.generos.id INTO retorno FROM cine.generos 
WHERE LOWER(cine.generos.nombre) LIKE CONCAT('%', nombre, '%');

RETURN retorno;
END $$

-- -----------Creamos las funciones para obtener el IDPelicula------------------------- 
DELIMITER $$
DROP FUNCTION IF EXISTS obtenerIdPelicula $$
CREATE FUNCTION obtenerIdPelicula(titulo VARCHAR(30)) RETURNS INT
BEGIN
DECLARE retorno INT DEFAULT 0;

SELECT cine.peliculas.id INTO retorno FROM cine.peliculas 
WHERE LOWER(cine.peliculas.titulo) LIKE CONCAT('%', titulo, '%');

RETURN retorno;
END $$

--   ------------------------------------Creamos el procedimientos pa sacar las peliculas por genero aprovechando las funciones anteriores------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarPeliculaGenero $$
CREATE PROCEDURE insertarPeliculaGenero(IN nombreGenero VARCHAR(80), IN tituloPelicula VARCHAR(30))
BEGIN

DECLARE idGenero INT DEFAULT 0;
DECLARE idPelicula INT DEFAULT 0;
DECLARE numeroCoincidencias INT DEFAULT 0;

SET idGenero = obtenerIdGenero(nombreGenero);
SET idPelicula = obtenerIdPelicula(tituloPelicula);

SELECT COUNT(cine.peliculas_generos.id) INTO numeroCoincidencias FROM cine.peliculas_generos
WHERE cine.peliculas_generos.id_genero = idGenero 
AND cine.peliculas_generos.id_pelicula = idPelicula;

IF numeroCoincidencias = 0 THEN
	INSERT INTO cine.peliculas_generos(cine.peliculas_generos.id_genero, cine.peliculas_generos.id_pelicula)
	VALUES (idGenero, idPelicula);
END IF;

SELECT cine.peliculas_generos.id FROM cine.peliculas_generos
WHERE cine.peliculas_generos.id_genero = idGenero
AND cine.peliculas_generos.id_pelicula = idPelicula;

END $$

-- -------------------------------Creacion de un procedimientos para la eliminacion de actores-------------------------

Delimiter $$

drop procedure if exists eliminarPersonaDuplicada$$
create procedure eliminarPersonaDuplicada ( nombre varchar(80), apellido varchar(80))
begin
declare idPersona int default 0;
declare coincidencias int default 0;
declare resultado varchar(30) default 'Persona no encontrada';
declare vNombre varchar(82);
declare vApellido varchar(82);

set vNombre = lower(concat('%',nombre, '%'));
set vApellido = lower(concat('%',apellido, '%'));

 -- --------------------------------realizamos la busqueda de personas por nombre y apellido
select count(cine.personas.id)  into coincidencias from cine.personas
where cine.personas.nombre
like vNombre
and cine.personas.apellido
like vApellido
;

if coincidencias > 0 then
-- --------------------------------obtenemos el personaje duplicado con el id mas bajo
select cine.personas.id into idPersona
from cine.personas
where cine.personas.nombre
like vNombre
and cine.personas.apellido
like vApellido
order by cine.personas.id asc limit 1;
	
-- -------------------En el caso de que exista mas de una vez verificamos si esta asignado a mas de un actor
-- -------------------y si es el caso asignamos el mismo id_persona a cada actor
    if coincidencias > 1 then
    update cine.actores
    inner join cine.personas on
    cine.personas.id = cine.actores.id_persona
    set id_persona = idPersona
    where cine.personas.nombre
	like vNombre
	and cine.personas.apellido
	like vApellido
	;
    
-- ---------------------Repetimos el procedimiento para comprobar si existen multiples directores de la misma persona
-- ---------------------y si es el caso asignamos el mismo id_persona a cada director
    update cine.directores
    inner join cine.personas on
    cine.personas.id = cine.directores.id_persona
    set id_persona = idPersona
    where cine.personas.nombre
	like vNombre
	and cine.personas.apellido
	like vApellido
	;
    
-- -----------------------por ultimo comprobamos si existen multiples producrores de la misma persona
-- ------------------------y si es el caso asignamos el mismo id_persona a cada productor
    update cine.productores
    inner join cine.personas on
    cine.personas.id = cine.productores.id_persona
    set id_persona = idPersona
    where cine.personas.nombre
	like vNombre
	and cine.personas.apellido
	like vApellido
	;
    
-- ------------------------Ya verificada la inexistencia de coincidencias en las tablas hijas
-- ------------------------eliminamos los resultados adicionales y nos quedamos con el de id mas baja
	delete from cine.personas
	where cine.personas.nombre
	like vNombre
	and cine.personas.apellido
	like vApellido
	and cine.personas.id != idPersona;

	-- ---------------------mostramos el resultado final
	select * from cine.personas
	where cine.personas.nombre
	like vNombre
	and cine.personas.apellido
	like vApellido
	;
    
-- ---------------------------avisar si la persona no esta duplicada
    else
    set resultado = concat((select cine.personas.nombre from cine.personas
	where cine.personas.id = idPersona), ' ', (select cine.personas.apellido from cine.personas
	where cine.personas.id = idPersona), ' no esta duplicada');
    select resultado;
    
    end if;

-- ---------------------si no se encuentra la persona muestra un aviso
else
select resultado
;

end if;

end
$$

-- -----------------------------
