create database if not exists cadena_restaurantes;
use cadena_restaurantes;

-- ----------------------Tabla Restaurantes------------------------
create table if not exists restaurantes ( 
id int not null primary key auto_increment,
cif char (9) unique not null,
nombre varchar(50) not null,
tlf varchar(20) NOT NULL,
email varchar(150)
);
-- ----------------------Tabla Sedes------------------------
create table if not exists sedes ( 
id int not null primary key auto_increment,
cif char (9) unique not null,
nombre varchar(50) not null,
tlf varchar(20) NOT NULL,
email varchar(150),
-- reservamos las columnas para las FK
id_codigo_postal int not null,
id_restaurante int not null
);


-- ----------------------Tabla Países------------------------
create table if not exists paises (
    id int not null primary key auto_increment,
    nombre varchar(30) not null
);

-- --------------------Tabla Provincias-----------------------
create table if not exists provincias (
    id int not null primary key auto_increment,
     nombre varchar(40) not null,
     -- añado columna que contendrá la fk
    id_pais int not null    
);

-- --------------------Tabla Localidades-----------------------
create table if not exists Localidades (
    id int not null primary key auto_increment,
    nombre varchar(40) not null,
	-- añado columna que contendrá la fk
    id_provincia int not null    
);

-- --------------------Tabla Codigos_Postales-----------------------
create table if not exists Codigos_Postales (
    id int not null primary key auto_increment,
     codigo varchar(15) not null,
	-- añado columna que contendrá la fk
    id_localidad int not null    
);

-- --------------------------Usuarios-------------------------------

create table if not exists usuarios(
id int auto_increment not null primary key,
nombre varchar(80) not null,
apellido varchar(150) not null,
telef char(9) not null,
email varchar(150),
dni char(10) not null unique,
dir varchar(150),
-- añado columna que contendrá la fk
id_sede int not null
);

-- --------------------------Clientes-------------------------------
create table if not exists clientes(
id int auto_increment not null primary key,
punto int,
-- añado columna que contendrá la fk
id_usuario int not null
);

-- --------------------------Trabajadores-------------------------------
create table if not exists trabajadores(
id int auto_increment not null primary key,
codigo_empleado char(9) not null,
ss char (12) not null,
-- añado columna que contendrá la fk
id_usuario int not null
);
-- ------------------------Estados-----------------------------

create table if not exists estados(
id int auto_increment not null primary key,
nombre varchar(10) not null,
descripcion varchar (30)
);

-- ------------------------Mesas-----------------------------

create table if not exists Mesas(
id int auto_increment not null primary key,
numero int not null,
descripcion varchar(255),
min_comensales int not null,
max_comensales int not null,
-- añado columna que contendrá la fk
id_estado  int not null
);

-- ------------------------Reservas-----------------------------

create table if not exists Reservas(
id int auto_increment not null primary key,
codigo char(4) not null,
fecha date not null,
hora time not null,
descripcion varchar(255),
num_comensales int not null,
-- añado columna que contendrá la fk
id_mesa  int not null,
id_estado int not null,
id_cliente int not null,
id_trabajador int not null
);

-- ----------------------------------- constraint de las FK----------------------------------------

alter table sedes
add constraint fk_sedes_id_restaurante 
foreign key (id_restaurante) references restaurantes(id),
add constraint fk_sedes_id_codigo_postal 
foreign key (id_codigo_postal) references codigos_postales(id);

alter table usuarios
add constraint fk_usuarios_id_sede 
foreign key (id_sede) references sedes(id);

alter table provincias
add constraint fk_provincias_id_pais 
foreign key (id_pais) references paises(id);

alter table localidades
add constraint fk_localidades_id_provincia 
foreign key (id_provincia) references provincias(id);

alter table codigos_postales
add constraint fk_codigos_postales_id_localidad 
foreign key (id_localidad) references localidades(id);

alter table clientes
add constraint fk_clientes_id_usuario 
foreign key (id_usuario) references usuarios(id);

alter table trabajadores
add constraint fk_trabajadores_id_usuario 
foreign key (id_usuario) references usuarios(id);

alter table mesas
add constraint fk_mesas_id_estado 
foreign key (id_estado) references estados(id);

alter table reservas
add constraint fk_reservas_id_mesa 
foreign key (id_mesa) references mesas(id),
add constraint fk_reservas_id_estado 
foreign key (id_estado) references estados(id),
add constraint fk_reservas_id_cliente 
foreign key (id_cliente) references clientes(id),
add constraint fk_reservas_id_trabajador 
foreign key (id_trabajador) references trabajadores(id);




