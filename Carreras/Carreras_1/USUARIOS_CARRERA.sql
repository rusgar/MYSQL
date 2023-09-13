/*Crea los siguientes usuarios en LOCALHOST y asígnales los roles que se indican:
	USUARIO: "jgarjim2"		ROL: "juez"
    USUARIO: "aftorres10"	ROL: "gestor_apuestas"
    USUARIO: "irmadz25"		ROL: "gestor_usuarios"
    USUARIO: "solyvera22"	ROL: "gestor_caballos"
    USUARIO: "jaimifiel33"	ROL: "desarrollador"
    USUARIO: "josgargam5"	ROL: "admin_adj"
    USUARIO: "antoreme57"	ROL: "usuario_apuestas"
    USUARIO: "apusimptra"	ROL: "usuario_apuestas"
    USUARIO: "migmeguele22"	ROL: "usuario_apuestas"
    USUARIO: "manudelca57"	ROL: "usuario_apuestas"
    USUARIO: "angelyd23"	ROL: "usuario_apuestas"
    USUARIO: "fernadelar99"	ROL: "usuario_apuestas"
    USUARIO: "garcilasoefem"	ROL: "usuario_apuestas"
    USUARIO: "usu12456t"	ROL: "usuario_apuestas"
    USUARIO: "tranvias27"	ROL: "usuario_apuestas"
    */ 
    
    
    -- CREACION DE LOS USUARIOS ASIGNADOS A LOS ROLES DEL EJERCICIO
DROP USER  IF EXISTS 'jgarjim2'@'localhost';    
CREATE USER 'jgarjim2'@'localhost' IDENTIFIED BY 'user1';
GRANT juez TO 'jgarjim2'@'localhost';
SET DEFAULT ROLE juez TO  'jgarjim2'@'localhost';

DROP USER  IF EXISTS 'aftorres10'@'localhost';
CREATE USER 'aftorres10'@'localhost' IDENTIFIED BY 'user2';
GRANT gestor_apuestas TO 'aftorres10'@'localhost';
SET DEFAULT ROLE gestor_apuestas TO  'aftorres10'@'localhost';

DROP USER  IF EXISTS 'irmadz25'@'localhost';
CREATE USER 'irmadz25'@'localhost' IDENTIFIED BY 'user3';
GRANT gestor_usuarios TO 'irmadz25'@'localhost';
SET DEFAULT ROLE gestor_usuarios TO  'irmadz25'@'localhost';

DROP USER  IF EXISTS 'solyvera22'@'localhost';
CREATE USER 'solyvera22'@'localhost' IDENTIFIED BY 'user4';
GRANT gestor_caballos TO 'solyvera22'@'localhost';
SET DEFAULT ROLE gestor_caballos TO  'solyvera22'@'localhost';

DROP USER  IF EXISTS 'jaimifiel33'@'localhost';
CREATE USER 'jaimifiel33'@'localhost' IDENTIFIED BY 'user5';
GRANT desarrollador TO 'jaimifiel33'@'localhost';
SET DEFAULT ROLE desarrollador TO 'jaimifiel33'@'localhost';

DROP USER  IF EXISTS 'josgargam5'@'localhost';
CREATE USER 'josgargam5'@'localhost' IDENTIFIED BY 'user6';
GRANT admin_adj TO 'josgargam5'@'localhost';
SET DEFAULT ROLE admin_adj TO  'josgargam5'@'localhost';

DROP USER  IF EXISTS 'antoreme57'@'localhost';
CREATE USER 'antoreme57'@'localhost' IDENTIFIED BY 'user7';
GRANT usuario_apuestas TO 'antoreme57'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'antoreme57'@'localhost';

DROP USER  IF EXISTS 'apusimptra'@'localhost';
CREATE USER 'apusimptra'@'localhost' IDENTIFIED BY 'user8';
GRANT usuario_apuestas TO 'apusimptra'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'apusimptra'@'localhost';

DROP USER  IF EXISTS 'migmeguele22'@'localhost';
CREATE USER 'migmeguele22'@'localhost' IDENTIFIED BY 'user9';
GRANT usuario_apuestas TO 'migmeguele22'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'migmeguele22'@'localhost';

DROP USER  IF EXISTS 'manudelca57'@'localhost';
CREATE USER 'manudelca57'@'localhost' IDENTIFIED BY 'user10';
GRANT usuario_apuestas TO 'manudelca57'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'manudelca57'@'localhost';

DROP USER  IF EXISTS 'angelyd23'@'localhost';
CREATE USER 'angelyd23'@'localhost' IDENTIFIED BY 'user11';
GRANT usuario_apuestas TO 'angelyd23'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO 'angelyd23'@'localhost';

DROP USER  IF EXISTS 'fernadelar99'@'localhost';
CREATE USER 'fernadelar99'@'localhost' IDENTIFIED BY 'user12';
GRANT usuario_apuestas TO 'fernadelar99'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'fernadelar99'@'localhost';

DROP USER  IF EXISTS 'garcilasoefem'@'localhost';
CREATE USER 'garcilasoefem'@'localhost' IDENTIFIED BY 'user13';
GRANT usuario_apuestas TO 'garcilasoefem'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'garcilasoefem'@'localhost';

DROP USER  IF EXISTS 'usu12456t'@'localhost';
CREATE USER 'usu12456t'@'localhost' IDENTIFIED BY 'user14';
GRANT usuario_apuestas TO 'usu12456t'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'usu12456t'@'localhost';

DROP USER  IF EXISTS 'tranvias27'@'localhost';
CREATE USER 'tranvias27'@'localhost' IDENTIFIED BY 'user15';
GRANT usuario_apuestas TO 'tranvias27'@'localhost';
SET DEFAULT ROLE usuario_apuestas TO  'tranvias27'@'localhost';

-- En el momento de ejecutarse, el servidor lee la información de estas tablas sobre privilegios
FLUSH PRIVILEGES;
