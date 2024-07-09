-- ejecucion de procedimientos y funciones
desc nacionalidades;

-- comprobacion para ver los paises insertacos para el procedimientos
select count(nacionalidades.gentilicio)
       from nacionalidades
       where nacionalidades.gentilicio like '%española%';
select count(nacionalidades.gentilicio)
       from nacionalidades
       where nacionalidades.pais like '%Francia%';  
  -- Llamadas a los procedimeintos
 call cine.insertarNacionalidad('Italiana', 'Italia');


--     ---------------------------- comprobacion---------------

SELECT personajes.id FROM personajes
where personajes.nombre like '%Neo%';

select cine.obtenerIdPersonaje('cor');

SELECT peliculas.id FROM peliculas
where peliculas.titulo like '%per%';

select cine.obtenerIdPelicula('apo');

select personas.id
from personas inner join actores
on personas.id= actores.id_persona
where  personas.nombre like '%El%' and personas.apellido like '%woo%';

select cine.obtenerIdActor('El', 'wo');


call cine.insertarPersonajesPelicula('coro', 'apo', 'mar', 'bran');


select *
from directores inner join personas
on directores.id_persona = personas.id
where personas.nombre like '%fr%' and personas.apellido like  '%cop%'  ;

select productores.id, personas.nombre, personas.apellido
from productores inner join personas
on productores.id_persona = personas.id
where personas.nombre like '%sam%' and personas.apellido like  '%rai%'  ;


select peguis.nombre
from peguis
where  peguis.nombre  like '%18%';

-- -------------------Llalamos a las funciones para sacar los ID-------------------
select cine.obtenerIdGenero('terror');
select cine.obtenerIdPelicula('matrix');
-- -------------------Llalamos al procedimiento segun las ID anteriormenre-------------------

-- -------------------------Insercion del actor y llamada para su eliminacion si esta creado

insert into
cine.personas
(cine.personas.nombre,
cine.personas.apellido,
cine.personas.fecha_nacimiento,
cine.personas.id_nacionalidad)
values ( 'Keanu', 'Reeves', '1939-05-25', 16);

insert into
cine.actores
(cine.actores.salario, cine.actores.id_persona)
values ( 20, 51); 

call eliminarPersonaDuplicada('kea' , 'Reev');

       