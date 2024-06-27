create database avisador; # creacion de la bd
use avisador;# marcamos que vamos a usar la bd

# creación de tablas
#usuarios
create table if not exists usuarios(
id int auto_increment not null primary key,
nombre varchar(80) not null,
apellido varchar(150) not null,
nick varchar(20) not null unique,
pass varchar(15) not null,
telef char(9) not null,
email varchar(150),
dni char(10) not null unique,
dir varchar(150)
);

#pacientes
create table if not exists pacientes(
id int auto_increment not null primary key,
num_historia varchar(20) unique,
#introduce la columna que contendrá la FK
id_usuario int not null
);

#sanitarios
create table if not exists sanitarios(
id int auto_increment not null primary key,
ss char(12) not null unique,
n_colegiado varchar(20) not null unique,
#creación de campos contenedro de FK
id_usuario int not null
);


#tratamientos
create table if not exists tratamientos(
id int auto_increment not null primary key,
frecuencia int not null,
cantidad int not null,
descripcion varchar(50) not null,
#creacion de campo contendrá la FK
id_paciente int not null
);


#avisos
create table if not exists avisos(
id int auto_increment not null primary key,
fecha date not null,
hora time not null,
#creacion de campos contendrán las FK
id_tratamiento int not null,
id_medicamento int not null
);


#medicamentos
create table if not exists medicamentos(
id int auto_increment not null primary key,
nombre varchar(80) not null,

#fabricante varchar(150) not null esto mejor comentado
#creacion de campo contendrá la FK
id_fabricante int not null
);


#fabricantes
create table if not exists fabricantes(
id int not null auto_increment primary key,
nombre varchar(30)
);

#dispositivos
create table if not exists dispositivos(
id int auto_increment not null primary key,
nombre varchar(50) not null,
mac char(12) not null unique,
#creacion de campo contendrá la FK
id_paciente int not null
);

#dispositivos-avisos
create table if not exists avisos_dispositivos(
id int auto_increment not null primary key,
id_aviso int not null,
id_dispositivo int not null
);


#prospecto
create table if not exists prospectos(
id int auto_increment not null primary key,
fecha datetime not null,
descripcion varchar (250) not null,
posologia varchar (250) not null,
efecto_secundario varchar (250) not null,
#creacion de campo contendrá la FK
#id_sanitario int not null,
id_medicamento int not null
);


#sanitarios_prospectos
create table if not exists sanitarios_prospectos(
id int auto_increment not null primary key,
id_prospecto int not null,
id_sanitario int not null
);

#definimos las FK
#pacientes
alter table pacientes
add constraint fk_pacientes_id_usuario
foreign key (id_usuario) references usuarios(id);

#sanitarios
alter table sanitarios
add constraint fk_sanitarios_id_usuario
foreign key (id_usuario) references usuarios(id);

#tratamientos
alter table tratamientos
add constraint fk_tratamientos_id_paciente
foreign key (id_paciente) references pacientes(id);

#avisos
alter table avisos
add constraint fk_avisos_id_tratamiento
foreign key (id_tratamiento) references tratamientos(id),
add constraint fk_avisos_id_medicamento
foreign key (id_medicamento) references medicamentos(id);

#dispositivos
alter table dispositivos
add constraint fk_dispositivos_id_paciente
foreign key (id_paciente) references pacientes(id);

#avisos dispositivos
alter table avisos_dispositivos
add constraint fk_avisos_dispositivos_id_aviso
foreign key (id_aviso) references avisos(id),
add constraint fk_avisos_dispositivos_id_dispositivo
foreign key (id_dispositivo) references dispositivos(id);

#prospecto
alter table prospectos
#add constraint fk_prospectos_id_sanitario
#foreign key (id_sanitario) references sanitarios(id),
add constraint fk_prospectos_id_medicamento
foreign key (id_medicamento) references medicamentos(id);

#medicamentos
alter table medicamentos
#add constraint fk_prospectos_id_sanitario
#foreign key (id_sanitario) references sanitarios(id),
add constraint fk_medicamento_id_fabricante
foreign key (id_fabricante) references fabricantes(id);

#avisos dispositivos
alter table sanitarios_prospectos
add constraint fk_sanitarios_prospectos_id_sanitario
foreign key (id_sanitario) references sanitarios(id),
add constraint fk_sanitarios_prospectos_id_prospecto
foreign key (id_prospecto) references prospectos(id);