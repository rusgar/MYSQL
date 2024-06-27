#gestion_cultivos bd
# creación
create database gestion_cultivos;
# nos colacomos en la base de datos a usar con use
use gestion_cultivos;

# creación de las tablas
show tables;# mostramos tablas

# creacion de tabla tipos
create table if not exists tipos(
id int not null primary key auto_increment,
nombre varchar(30) not null unique
);

desc tipos;# comando para describir la tabla tipos

#creacion usarios
create table if not exists usuarios(
id int not null primary key auto_increment,
nombre varchar(80) not null,
dir varchar(150) not null,
telf char(9) not null,
dni  char(10) not null unique,
nick varchar(20) not null unique,
pass varchar(20) not null
);

#creacion invernaderos
create table if not exists invernaderos(
id int not null primary key auto_increment,
nombre varchar(80) not null,
dir varchar(150) not null,
# con esta columna evito crearla luego
id_usuario int not null
);

#creacion cultivos
create table if not exists cultivos(
id int not null primary key auto_increment,
nombre varchar(80) not null,
mes_siembra varchar(50) not null,
mes_recogida varchar(50) not null,
ph float not null,
humedad int not null,
temperatura float not null,
riego int not null,
descripcion varchar(200),
# con esta columna evito crearla luego
id_tipo int not null
);

# creacion estados
create table if not exists estados(
id int not null primary key auto_increment,
nombre varchar(30) not null unique
);


#creacion zonas
create table if not exists zonas(
id int not null primary key auto_increment,
nombre varchar(80) not null,
descripcion varchar(150) not null,
superficie double not null,
# con esta columna evito crearla luego
id_invernadero int not null
);

#creacion mediciones
create table if not exists mediciones(
id int not null primary key auto_increment,
frecuencia int not null,
ph float not null,
humedad int not null,
temperatura float not null,
riego int not null,
fecha datetime not null,
# con esta columna evito crearla luego
id_estado int not null,
id_cultivo int not null,
id_zona int not null
);

#creacion dispositivos
create table if not exists dispositivos(
id int not null primary key auto_increment,
cod varchar(20) not null,
descripcion varchar(250),
# con esta columna evito crearla luego
id_estado int not null,
id_zona int not null
);

#creacion avisos
create table if not exists avisos(
id int not null primary key auto_increment,
fecha datetime not null,
descripcion varchar(250),
# con esta columna evito crearla luego
id_zona int not null
);

#creacion avisos
create table if not exists avisos_dispositivos(
id int not null primary key auto_increment,
# con esta columna evito crearla luego
id_dispositivo int not null,
id_aviso int not null
);


# comenzamos a añadir las FKs

alter table invernaderos
add constraint fk_invernaderos_id_usuario
foreign key (id_usuario) references usuarios(id);

alter table cultivos
add constraint fk_cultivos_id_tipo
foreign key (id_tipo) references tipos(id);

alter table zonas
add constraint fk_zonas_id_invernadero
foreign key (id_invernadero) references invernaderos(id);

alter table mediciones
add constraint fk_mediciones_id_cultivo
foreign key (id_cultivo) references cultivos(id),
add constraint fk_mediciones_id_zona
foreign key (id_zona) references zonas(id),
add constraint fk_mediciones_id_estado
foreign key (id_estado) references estados(id);

alter table dispositivos
add constraint fk_dispositivos_id_zona
foreign key (id_zona) references zonas(id),
add constraint fk_dispositivos_id_estado
foreign key (id_estado) references estados(id);

alter table avisos
add constraint fk_avisos_id_zona
foreign key (id_zona) references zonas(id);

alter table avisos_dispositivos
add constraint fk_avisos_dispositivos_id_aviso
foreign key (id_aviso) references avisos(id),
add constraint fk_avisos_dispositivos_id_dispositivo
foreign key (id_dispositivo) references dispositivos(id);