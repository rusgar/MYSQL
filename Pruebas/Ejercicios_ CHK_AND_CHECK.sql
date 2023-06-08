/* EJERCICIO: Modifica la siguiente tabla para que NIF1 sólo admita valores no nulos que sean 
enteros de 8 dígitos, NIF1 solo admita un valor nulo que sea una letra, que ningún campo pueda ser nulo,
que los conductores solo puedan ser mayores de edad y que la provincia solo pueda ser asturias 
*/
drop database if exists Pruebas;
create database Prueba;
Use Prueba;
CREATE TABLE conductores_asturianos_Sr(
    NIF1 int(8) not null,
    NIF2 varchar(1) not null,
    Nombre varchar(255) not null,
    Primer_ap varchar(255) not null,
    Segundo_ap varchar(255)not null,
    Edad int not null,
    Provincia varchar(255)
   
    );
CREATE TABLE conductores_asturianos (
    NIF1 int(8) not null,
    NIF2 varchar(1) not null,
    Nombre varchar(255) not null,
    Primer_ap varchar(255) not null,
    Segundo_ap varchar(255)not null,
    Edad int not null,
    Provincia varchar(255),
    constraint chk_conductores_asturianos check (edad >= 18 and provincia = 'Asturias' and Length(Nif1)=8 )
    );
    
insert into conductores_asturianos_SR Values('11111111','a','Juan','P','F','1','Galicia');
insert into conductores_asturianos_SR Values('222222','b','Jose','f','p','18','Asturias');
insert into conductores_asturianos_SR Values('33333333','g','Ivan','r','t','17','Cantabro');
insert into conductores_asturianos_SR Values('44444444','g','Pepito','r','h','18','Asturias');
insert into conductores_asturianos_SR Values('55555555','c','Edu','e','h','18','Asturias');

insert into conductores_asturianos Values('11111111','a','Juan','P','F','1','Galicia');
insert into conductores_asturianos Values('222222','b','Jose','f','p','18','Asturias');
insert into conductores_asturianos Values('33333333','g','Ivan','r','t','17','Cantabro');
insert into conductores_asturianos Values('44444444','g','Pepito','r','h','18','Asturias');
insert into conductores_asturianos Values('55555555','c','Edu','e','h','18','Asturias');