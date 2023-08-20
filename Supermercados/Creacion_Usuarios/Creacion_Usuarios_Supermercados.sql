select current_user();
 select user, host from mysql.user;

 drop user  'empleado1'@'localhost';
 create user 'empleado1'@'localhost' IDENTIFIED By 'admin';
 grant execute on procedure caja1 to 'empleado1'@'localhost';
 flush privileges;
 
  drop user  'empleado2'@'localhost';
 create user 'empleado2'@'localhost' IDENTIFIED By 'admin';
 grant execute on procedure caja2 to 'empleado2'@'localhost';
 flush privileges;