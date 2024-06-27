# operaciones crud
#selecciono la base de datos
use gestion_cultivos;
#insercion simple
insert into tipos (nombre) values ('verduras');

# para comprobar la insercciñon de un elemento 
#uso la consulta mas básica select de toda la tabla
select * from tipos;

#insercion múltiple
insert into tipos (nombre)
 values ('frutas'),('legumbres');
 
 
# insercición multiple con nombrado completo
insert into gestion_cultivos.tipos (gestion_cultivos.tipos.nombre)
values ('Cereales'),('verculos');

# voy a arreglar el nombre de cereales
update gestion_cultivos.tipos 
set gestion_cultivos.tipos.nombre='cereales'
where id=4;

# voy a arreglar el nombre de tuberculos
update gestion_cultivos.tipos 
set gestion_cultivos.tipos.nombre='tuberculos'
where id=5;

#borro verduras y añado hortalizas
delete from gestion_cultivos.tipos 
where gestion_cultivos.tipos.id=1;
insert into gestion_cultivos.tipos 
(gestion_cultivos.tipos.nombre)
values ('hortalizas');

#borrar y reiniciar
delete from gestion_cultivos.tipos;
ALTER TABLE gestion_cultivos.tipos AUTO_INCREMENT = 1;
