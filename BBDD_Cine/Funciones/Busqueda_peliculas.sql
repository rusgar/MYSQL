select actores.id_persona, personajes.nombre, peliculas.titulo, peliculas.id
from peliculas inner join personajes_peliculas
on peliculas.id = personajes_peliculas.id_actor
inner join actores
on personajes_peliculas.id_actor= actores.id
inner join personajes
on actores.id_persona=personajes.id;


select peliculas.id , peliculas.titulo 
from peliculas left join personajes_peliculas
on peliculas.id = personajes_peliculas.id_pelicula
where personajes_peliculas.id_pelicula is null;

-- ----------------------------- hacer una funcion para buscar peliculas si actores---------------------------

DELIMITER $$

drop function if exists buscar_peliculas_sin_actores $$
create function buscar_peliculas_sin_actores() returns varchar(100)
begin
    declare resultado varchar(100);
    declare separador varchar(10);
    set separador = '';

    select group_concat(peliculas.titulo separator ' ------ ') into resultado
    from peliculas left join personajes_peliculas 
    on peliculas.id = personajes_peliculas.id_pelicula
    where personajes_peliculas.id_pelicula is null;

    return resultado;
end $$

DELIMITER ;


--     ------------------------------------solo la cantida de peliculas ---------------------------

DELIMITER $$

drop function if exists cantidad_peliculas_sin_actores $$
create function cantidad_peliculas_sin_actores() returns int
begin
    declare cantidad int;

    select count(*)
    into cantidad
    from peliculas 
    left join personajes_peliculas on peliculas.id = personajes_peliculas.id_pelicula
    where personajes_peliculas.id_pelicula is null;

    return cantidad;
end $$

DELIMITER ;





