/*	EJERCICIO nº1:
	1.- Crear una BD que se llame "Prueba".
    2.- Dentro de Prueba, una tabla que se llame "codigos_postales" y tenga los campos:
			"id": de tipo entero, que no pueda ser nulo, autoincremental y clave primaria
			"codigo": de tipo caracter, de longitud 5 y que no pueda ser nulo
	3.- Una segunda tabla que se llame "usuarios" con los campos:
			"id": de tipo entero, no nulo, autoincrremental y clave primaria
			"nombre": de tipo caracter, de longitud 80 y no nulo
			"apellido": de tipo caracter, de longitud 120 y no nulo
			"dni": de tipo caracter, de longitud 9, no nulo y único
			"dir": de tipo caracter de 180, no nulo
			"telefeno": de tipo caracter, longitud 15 y no admite valores nulos
			"email": de tipo caracter, de longitud 200 y no admite valores nulos, que por
			defecto tome el valor 'no disponible'
			"id_codigo_postal": de tipo entero, que no admita valores nulos y que sea clave externa 
			de "codigos_postales", referenciada con una FK llamada "fk_usuarios_id_codigo_postal" al
			campo "id" de la tabla "codigos_postales
	4.- Una tercera tabla llamada "clientes" con los siguientes campos:
			"id": entero no nullo autoincremental y que sea clave primaria
			"puntos": entero no nulo
			"id_usuario": entero no nulo con una FK llamada "fk_clientes_id_usuario" referenciada
            al campo "id" de la tabla ususarios
	5.- Una tabla llamada "trabajadores":
			"id": entero no nulo autoincremental
			"ss": tipo caracter de 12 no nulo
			"contrato": tipo caracter de 80 no nnulo
			"id_usuario": entero no nulo int not null,
			CLAVE PRIMARIA: "id"
			CLAVES FORÁNEAS: "fk_trabajadores_id_usuario" para el campo "id_usuario" ref. a "id" de "usuarios"*/


DROP database IF exists prueba_1;
create database prueba_1;
use prueba_1;
DROP database IF exists codigo_postales;
CREATE TABLE codigo_postales (
    id int NOT NULL AUTO_INCREMENT,    
    codigo_postal VARCHAR(5),
    constraint codigo_postales PRIMARY KEY(id)
);

DROP database IF exists usuarios;
CREATE TABLE Usuarios (
    ID int NOT NULL AUTO_INCREMENT,
    NOMBRE varchar(80) NOT NULL,
    APELLIDO varchar(120) NOT NULL,
    DNI  varchar(9)  NOT NULL unique,
    DIR varchar(180)  NOT NULL,
    TELEFONO varchar(255),
    EMAIL varchar(120) NOT NULL default 'No disponible',
    id_codigo_postal int NOT NULL,
     CONSTRAINT usuarios PRIMARY KEY (ID),
     CONSTRAINT fk_usuarios_id_codigo_postal FOREIGN KEY (id_codigo_postal) REFERENCES codigo_postales (id)    
    );
    
    DROP database IF exists clientes;
    CREATE TABLE clientes (
    id int NOT NULL AUTO_INCREMENT,    
    puntos VARCHAR(5) NOT NULL,
     id_usuario int not null,
    constraint codigo_postales PRIMARY KEY(id),
    CONSTRAINT fk_clientes_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id)
);

    DROP database IF exists trabajadores;
    CREATE TABLE trabajadores (
     id int NOT NULL AUTO_INCREMENT,    
     ss VARCHAR(12) NOT NULL,
     contrato VARCHAR(80) NOT NULL,
     id_usuario int not null,
    constraint trabajadores PRIMARY KEY(id),
    CONSTRAINT fk_trabajodores_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id)
);