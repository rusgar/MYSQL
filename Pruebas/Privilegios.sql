-- select user, host from mysql.user; ver los hosting de cada usuario, sus tablas
-- select * from mysql.user; ver todos los registros de los usuarios
-- drop user 'contable'@'contabilidad';
-- drop user 'capataz'@'capataz';
-- drop user 'capataz'@'localhost';
-- drop user 'contable'@'contablidad';
 
 USE Jardineria;
 drop user if exists 'contable' @'localhost';
 create user 'contable' @'localhost' IDENTIFIED By 'cuenta123';
 
 -- GRANT [PERMISO] ON [NOMBREDB.NOMBRETabla] to [Usuario]
    -- permisos (all privilegues)
    -- Ejemplo
    Grant select on jardineria.pago  to 'contable' @'localhost';
    Grant select on jardineria.pedido  to 'contable' @'localhost';
    Grant select on jardineria.producto  to 'contable' @'localhost';
    Grant select on jardineria.detalle_pedido  to 'contable' @'localhost';
    
    flush privileges;
    
     drop user if exists 'capataz' @'localhost';    
    create user 'capataz' @'localhost' IDENTIFIED By 'cuenta321';
    
    Grant all privileges on jardineria.*  to 'capataz' @'localhost';
   
   flush privileges;
   
   select * from mysql.user;
   
   grant insert, delete, update on jardineria.pago to 'contable' @'localhost';
   flush privileges;
   
   alter user 'contable' @'localhost' identified by '123456';
   flush privileges;
   
   revoke all PRIVILEGES ON jardineria.* from  'capataz' @'localhost'; -- REVOCAR PERMISOS
   Grant all privileges on jardineria.*  to 'capataz' @'localhost';
   REVOKE SELECT ON JARDINERIA.* FROM 'capataz' @'localhost';-- REVOCAR PERMISOS
   
  grant SELECT,INSERT, CREATE, ALTER on jardineria.pago to 'capataz' @'localhost';
  
    flush privileges;
    REVOKE select ON jardineria.* FROM 'capataz' @'localhost';
    grant select (ANOTACIONES, ID, NOMBRE, FUNCIONES, DNI) on jardineria.subordinados to'capataz' @'localhost';
    revoke select  ( ANOTACIONES) on jardineria.subordinados from 'capataz' @'localhost';
      flush privileges;
     
     
 drop user  'jardinero' @'localhost';
 create user 'jardinero' @'localhost' IDENTIFIED By '147';
 grant execute on procedure neptuno.obtener_comisiones_var_fecha_case to 'jardinero' @'localhost';
 flush privileges;
      
	show grants for 'capataz' @'localhost' ;-- Nuestra los privilegios
      
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (1, 'Cherin', 'Engineering', 'hola', '859172476');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (2, 'Collie', 'Services', 'adios', '487104887');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (3, 'Hartley', 'Research and Development', 'tal vez', '867213585');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (4, 'Alyce', 'Support', 'ciao', '961564053');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (5, 'Licha', 'Human Resources', 'our wai', '371869629');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (6, 'Tabbatha', 'Business Development', 'hola y adios', '163219510');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (7, 'Nicholas', 'Sales', 'no quiero', '873205784');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (8, 'Ronnie', 'Marketing', 'me apetece', '089792590');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (9, 'Flint', 'Human Resources', 'fue', '018389421');
insert into subordinados (id, nombre, funciones , anotaciones, dni) values (10, 'Phyllida', 'Research and Development', 'se fue', '379092888');
   
   