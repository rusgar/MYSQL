# archivo bd peliculas para pruebas
create database cine;
use cine;
#creamos la tabla nacionalidades (entedemos por nacionalidad pais nacimiento)
create table if not exists nacionalidades (
id int not null auto_increment primary key,
gentilicio varchar(40) not null,
pais varchar(40) not null
);

# creamos tabla personas
create table if not exists personas (
id int not null auto_increment primary key,
nombre varchar(80) not null,
apellido varchar(80) not null,
fecha_nacimiento datetime not null,
id_nacionalidad int not null
);

# creamos tabla actores
create table if not exists actores (
id int not null auto_increment primary key,
salario double  not null,
id_persona int not null
);

# creamos tabla directores
create table if not exists directores (
id int not null auto_increment primary key,
alma_mater varchar(30)  not null,
id_persona int not null
);

# creamos tabla productores
create table if not exists productores (
id int not null auto_increment primary key,
inversion double  not null,
id_persona int not null
);

# creamos tabla personajes
create table if not exists personajes (
id int not null auto_increment primary key,
nombre varchar(80) not null,
edad int  not null,
descripcion varchar(100) not null
);

# creamos tabla tipos
create table if not exists tipos (
id int not null auto_increment primary key,
nombre varchar(80) not null
);

# creamos tabla premios
create table if not exists premios (
id int not null auto_increment primary key,
nombre varchar(30)  not null,
fecha datetime not null,
id_pelicula int not null,
id_tipo int not null
);

# creamos tabla generos
create table if not exists generos (
id int not null auto_increment primary key,
nombre varchar(80) not null
);
# creamos tabla pegui
create table if not exists peguis (
id int not null auto_increment primary key,
nombre varchar(80) not null,
edad int not null
);

# creamos tabla peliculas
create table if not exists peliculas (
id int not null auto_increment primary key,
titulo varchar(30)  not null,
fecha datetime not null,
duracion int not null,
id_director int not null,
id_productor int not null,
id_pegui int not null
);

# creamos tabla personajes_peliculas
create table if not exists personajes_peliculas (
id int not null auto_increment primary key,
id_personaje int not null,
id_pelicula int not null,
id_actor int not null
);

# creamos tabla peliculas_generos
create table if not exists peliculas_generos (
id int not null auto_increment primary key,
id_genero int not null,
id_pelicula int not null
);

# añadimos las FK correspondientes
alter table personas 
add constraint fk_personas_id_nacionalidad 
foreign key (id_nacionalidad)
references nacionalidades(id);

alter table actores 
add constraint fk_actores_id_persona 
foreign key (id_persona)
references personas(id);

alter table directores 
add constraint fk_directores_id_persona 
foreign key (id_persona)
references personas(id);

alter table productores 
add constraint fk_productores_id_persona 
foreign key (id_persona)
references personas(id);

alter table premios 
add constraint fk_premios_id_tipo 
foreign key (id_tipo)
references tipos(id),
add constraint fk_premios_id_pelicula 
foreign key (id_pelicula)
references peliculas(id); 

alter table peliculas 
add constraint fk_peliculas_id_productor 
foreign key (id_productor)
references productores(id),
add constraint fk_peliculas_id_director 
foreign key (id_director)
references directores(id),
add constraint fk_peliculas_id_pegui 
foreign key (id_pegui)
references peguis(id); 

alter table personajes_peliculas 
add constraint fk_personajes_peliculas_id_personaje 
foreign key (id_personaje)
references personajes(id),
add constraint fk_personajes_peliculas_id_pelicula 
foreign key (id_pelicula)
references peliculas(id),
add constraint fk_personajes_peliculas_id_actor 
foreign key (id_actor)
references actores(id); 

alter table peliculas_generos 
add constraint fk_peliculas_generos_id_pelicula 
foreign key (id_pelicula)
references peliculas(id),
add constraint fk_peliculas_generos_id_genero 
foreign key (id_genero)
references generos(id);
