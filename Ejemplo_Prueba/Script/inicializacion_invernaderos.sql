#Insercion de datos estados

delete from gestion_cultivos.estados;# borra el contenido de estados
alter table gestion_cultivos.estados auto_increment=1;# reinicia el contador de id
insert into gestion_cultivos.estados (gestion_cultivos.estados.nombre)
 values ('encendido'),('apagado'),('sembrado'),('recoger');

#Insercion de datos tipos
delete from gestion_cultivos.tipos;
alter table gestion_cultivos.tipos auto_increment=1;
insert into gestion_cultivos.tipos (gestion_cultivos.tipos.nombre) 
values ('frutas'),('legumbres'),('tuberculos'),('hortalizas'),('cereales');

#Insercion de datos cultivos
delete from gestion_cultivos.cultivos;
alter table gestion_cultivos.cultivos auto_increment=1;

#Describimos todos los campos not null de la tabla
insert into gestion_cultivos.cultivos
 (gestion_cultivos.cultivos.nombre,gestion_cultivos.cultivos.mes_siembra,
 gestion_cultivos.cultivos.mes_recogida,
 gestion_cultivos.cultivos.descripcion,gestion_cultivos.cultivos.temperatura,
 gestion_cultivos.cultivos.humedad,gestion_cultivos.cultivos.riego,
 gestion_cultivos.cultivos.ph,gestion_cultivos.cultivos.id_tipo)
 values 

#insertamos las frutas
('kiwi','enero','marzo','fruta tropical',18.2,50,80,7.5,1),
('manzana','junio','octubre','fruta nacional',12.9,55,85,7.4,1),

#insertamos las legumbres
('faba','enero','julio','legumbre asturiana',14.2,60,90,6.5,2),
('garbanzos','febrero','octubre','legumbre nacional',17.9,75,75,7.4,2),

#insertamos los tuberculos
('patata','septiembre','julio','tuberculo nacional',14.2,30,55,8.5,3),
('nabo','octubre','abril','tuberculo extranjero',11.5,45,60,6.3,3),

#insertamos las hortalizas
('tomate','septiembre','diciembre','hortaliza nacional',14.2,90,70,11.5,4),
('leghuga','junio','julio','hortaliza general',18.5,45,55,8.1,4), 

#insertamos los cereales
('trigo','septiembre','noviembre','cereal ucraniano',19.0,70,35,5.5,5),
('maiz','octubre','mayo','cereal nacional',11.8,65,50,7.3,5);


#insercion de datos usuarios
delete from gestion_cultivos.usuarios;
alter table gestion_cultivos.usuarios auto_increment=1;
insert into gestion_cultivos.usuarios 
(gestion_cultivos.usuarios.dni,gestion_cultivos.usuarios.nombre,
gestion_cultivos.usuarios.dir,
gestion_cultivos.usuarios.nick,gestion_cultivos.usuarios.pass,
gestion_cultivos.usuarios.telf)
 values 
('51333256J','Pepe Gotera','Fuente del Real 14','pb1', '1234',
'666666665'),
('51333259H','Lola Lopez','Fuente del Real 18','lola1', '2345',
'666666667');

#insercion de datos invernadero
delete from gestion_cultivos.invernaderos;
alter table gestion_cultivos.invernaderos auto_increment=1;
insert into gestion_cultivos.invernaderos 
(gestion_cultivos.invernaderos.nombre,
gestion_cultivos.invernaderos.dir,gestion_cultivos.invernaderos.id_usuario) values 
('NORTE','Gijon',1),
('SUR','CACERES',2);
# a partir de aquí dejaremos dos ejemplos con notación simplificada
#insercion de datos zonas
delete from gestion_cultivos.zonas;
alter table gestion_cultivos.zonas auto_increment=1;
insert into zonas (nombre,descripcion,superficie,id_invernadero) values 
('a','Zonaizquierda Zona templada',2,2),
('b','Zonasuperior Zona fria',2,1),
('c','Zonainferior Zona caliente',5,2),
('d','Zonaderecha Zona humeda',9,1);

#insercion de datos dispositivos
delete from gestion_cultivos.dispositivos;
alter table gestion_cultivos.dispositivos auto_increment=1;
insert into dispositivos (cod,descripcion,id_zona,id_estado) values 
('a1','Aspersor',1,1),
('a2','humidificador',1,2);