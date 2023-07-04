select current_user();
 select user, host from mysql.user;
 
 create user 'cajero4'@'localhost' IDENTIFIED By 'admin';
 create user 'cajero5'@'localhost' IDENTIFIED By 'admin';
  create user 'Cajero1'@'localhost' IDENTIFIED By 'admin';
  create user 'Cajero2'@'localhost' IDENTIFIED By 'admin';

 
 grant execute on procedure new_caja to 'Cajero1'@'localhost';
 grant execute on procedure CAJA_MOD to 'Cajero1'@'localhost';
  grant execute on procedure OBTENER_ID_EMPLEADO to 'Cajero1'@'localhost';
 grant execute on procedure new_caja to 'Cajero2'@'localhost';
  grant execute on procedure new_caja to 'cajero4'@'localhost';
 grant execute on procedure new_caja to 'cajero5'@'localhost';
 
  grant execute on procedure CAJA_MOD to 'Cajero2'@'localhost';
   grant execute on procedure CAJA_MOD to 'cajero4'@'localhost';
    grant execute on procedure CAJA_MOD to 'cajero5'@'localhost';
 flush privileges;