#Ejercicio 2 creacion tablas con modificaciones
create database ejercicio2ct;
use ejercicio2ct;
#primero creamos las tablas iniciales
create table if not exists sedes (
id int auto_increment not null primary key,
nombre varchar(45) not null
);

create table if not exists cod (
id int auto_increment not null primary key,
cod_postal varchar(5) not null unique
);

create table if not exists usuarios (
id int auto_increment not null primary key,
nombre varchar(45) not null,
apellidos varchar(90) not null,
dni char(9) not null unique,
telefono varchar(12) not null
);


# ahora empezamos con las modificaciones para obtener el resultado final
alter table sedes
add column direccion varchar(90) not null,
add column telefono varchar(12) not null,
add column email varchar(40),
add column id_codigo_postal int not null; 

# cambiar nombre de columna pero cuidado que se puede
# modificar los tipos de datos
#alter table usuarios
#change apellidos apellido varchar(90) not null;

# realizamos varias operaciones de modificacion sobre la tabla codigos_postales
rename table cod to codigos_postales;# cambio del nombre
#cuidado hay que tener en cuenta el orden a la hora de ejecutar el rename
# puede  generar un fallo de tabla no encontrada
alter table codigos_postales
add column id_localidad int not null;

#añadimos las tablas que faltarían

create table if not exists localidades(
id int not null auto_increment primary key,
nombre varchar(45) not null
);


# creo la tabla que contiene la n-n

create table if not exists sedes_usuarios(
id int not null auto_increment primary key,
id_sede int not null,
id_usuario int not null
);

#por ultimo añadimos las Fks

alter table codigos_postales 
add constraint fk_codigos_postales_id_localidad
foreign key (id_localidad)
references localidades(id);

alter table sedes 
add constraint fk_sedes_id_codigo_postal
foreign key (id_codigo_postal)
references codigos_postales(id);

alter table sedes_usuarios 
add constraint fk_sedes_usuarios_id_sede
foreign key (id_sede)
references sedes(id),
add constraint fk_sedes_usuarios_id_usuario
foreign key (id_usuario)
references usuarios(id);