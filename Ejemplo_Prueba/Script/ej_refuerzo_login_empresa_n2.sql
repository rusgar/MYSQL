# ejercicios refuerzo 2 log in multinacional

#creo la base de datos empresa
create database empresa;
show databases;# visualizar que aparece la base de datos
# posicionarme en la base de datos a trabajar con use
use empresa;

# ya estoy en empresa y empiezo con la creacion de las tablas
# creo las tablas sin preocuparme por las FK

#multinacional
create table if not exists multinacionales (
id int not null auto_increment primary key,
cif char(9) not null unique,
nombre varchar(50) not null,
telefono varchar(20) not null,
email varchar(50) not null
);


#sede
create table if not exists sedes (
id int not null auto_increment primary key,
cif char(9) not null unique,
nombre varchar(50) not null,
dir varchar(150) not null,
telefono varchar(20) not null,
email varchar(50) not null
);


#pais
create table if not exists paises (
id int not null auto_increment primary key,
nombre varchar(20) not null
);

#provincias
create table if not exists provincias (
id int not null auto_increment primary key,
nombre varchar(20) not null
);

#localidades
create table if not exists localidades (
id int not null auto_increment primary key,
nombre varchar(20) not null
);

#códigos postales
create table if not exists codigos_postales (
id int not null auto_increment primary key,
codigo varchar(10) not null
);

#departamentos
create table if not exists departamentos (
id int not null auto_increment primary key,
nombre varchar(20) not null,
extension char(3)
);

#sedes_departamentos
create table if not exists sedes_departamentos (
id int not null auto_increment primary key
);

#trabajadores
create table if not exists trabajadores (
id int not null auto_increment primary key,
dni char(10) not null unique,
nombre varchar(100) not null,
apellido varchar(200) not null,
ss char(12) not null unique,
nick varchar(20) not null unique,
pass varchar(15) not null,
dir varchar(150),
telefono varchar(20) not null
);

#roles
create table if not exists roles (
id int not null auto_increment primary key,
nombre varchar(20) not null,
descripcion  varchar(50)
);

#permisos
create table if not exists permisos (
id int not null auto_increment primary key,
nombre varchar(20) not null,
descripcion  varchar(50)
);

#permisos_roles
create table if not exists permisos_roles (
id int not null auto_increment primary key
);


# ahora añadimos las columnas que contendrán las FK

#sedes
alter table sedes
add column (id_multinacional int not null),
add column (id_codigo_postal int not null)
;

# provincias
alter table provincias
add column (id_pais int not null);

#localidades
alter table localidades
add column (id_provincia int not null)
;

#codigos_postales
alter table codigos_postales
add column (id_localidad int not null)
;

#sedes_departamentos
alter table sedes_departamentos
add column (id_sede int not null),
add column (id_departamento int not null)
;

#trabajadores
alter table trabajadores
add column (id_departamento int not null),
add column (id_rol int not null)
;

#permisos_roles
alter table permisos_roles
add column (id_permiso int not null),
add column (id_rol int not null)
;

# ahora añadimos las FK

#sedes
alter table sedes
add constraint 
fk_sedes_id_multinacional foreign key (id_multinacional)
references multinacionales(id),
add constraint 
fk_sedes_id_codigo_postal foreign key (id_codigo_postal)
references codigos_postales(id)
;


#provincias
alter table provincias
add constraint 
fk_provincias_id_pais foreign key (id_pais)
references paises(id)
;

#localidades
alter table localidades
add constraint 
fk_localidades_id_provincia foreign key (id_provincia)
references provincias(id)
;

#codigos_postales
alter table codigos_postales
add constraint 
fk_codigos_postales_id_localidad foreign key (id_localidad)
references localidades(id)
;

#sedes_departamentos
alter table sedes_departamentos
add constraint 
fk_sedes_departamentos_id_sede foreign key (id_sede)
references sedes(id),
add constraint 
fk_sedes_departamentos_id_departamento foreign key (id_departamento)
references departamentos(id)
;

#trabajadores
alter table trabajadores
add constraint 
fk_trabajadores_id_departamento foreign key (id_departamento)
references departamentos(id),
add constraint 
fk_trabajadores_id_rol foreign key (id_rol)
references roles(id)
;

#permisos_roles
alter table permisos_roles
add constraint 
fk_permisos_roles_id_permiso foreign key (id_permiso)
references permisos(id),
add constraint 
fk_permisos_roles_id_rol foreign key (id_rol)
references roles(id)
;

# si quisiera borra la base de datos
#drop database empresa;