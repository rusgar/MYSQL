CREATE DATABASE  pruebas;# crearcion de labase de datos
CREATE SCHEMA  pruebas2;# EXCLUSIVA DE MYSQL
SHOW DATABASES;# muestra baes de dato existentes

#ahora voy aborar la bd
DROP DATABASE pruebas2;

# el comando use no sitia en la base de datos a trabajar
use pruebas;

#crear la tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(80) NOT NULL,
apellido VARCHAR(150) NOT NULL,
dni CHAR(10) NOT NULL,
tlf CHAR(9) NOT NULL,
email VARCHAR(150)
);

create table if not exists clientes(
id int auto_increment not null primary key,
punto int not null,
id_usuario int not null,
foreign key (id_usuario) references usuarios(id)
);

# añadi una tabla trabajadores
create table if not exists trabajadores(
id int auto_increment not null primary key,
ss char(12) not null,
puesto varchar(45)
);

#añadir una columna id_usuario
alter table trabajadores add column (
id_usuario int not null
);

alter table trabajadores add constraint 
fk_trabajadores_id_usuario foreign key (id_usuario)
references usuarios(id)
;


show tables;
desc usuarios;
desc clientes;


#clientes_ibfk_1
alter table clientes 
drop foreign key clientes_ibfk_1;

alter table clientes add constraint 
fk_clientes_id_usuario foreign key (id_usuario)
references usuarios(id)
;