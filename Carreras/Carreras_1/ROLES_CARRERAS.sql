/*Crea los siguientes roles en el esquema CARRERAS_1:
	1.- "juez": Dale permisos de ejecución sobre los procedimientos PR_ALTA_CARRERA y PR_RESULTADO
    2.- "gestor_apuestas": Dale permisos de ejecución sobre los procedimientos PR_APUESTA y PR_RECARGA_CREDITO
    3.- "gestor_usuarios": Dale permisos de ejecución sobre los procedimientos PR_ALTA_USUARIO y PR_BAJA_USUARIO
    4.- "gestor_caballos": Dale permisos de ejecución sobre los procedimientos PR_ALTA_CABALLO y PR_BAJA_CABALLO
    5.- "usuario_apuestas": Dale permisos de ejecución sobre el procedimiento PR_APUESTA
    6.- "desarrollador": Dale permisos de creación, consulta e inserción sobre las tablas del esquema
    7.- "admin_adj": Dale todos los permisos excepto GRANT OPTION*/
 
 
 USE CARRERAS_1;
    -- CREACION DE ROLES
DROP ROLE  IF EXISTS juez;    
CREATE ROLE juez;
DROP ROLE  IF EXISTS gestor_apuestas;
CREATE ROLE gestor_apuestas;
DROP ROLE  IF EXISTS gestor_usuarios;
CREATE ROLE gestor_usuarios;
DROP ROLE  IF EXISTS gestor_caballos;
CREATE ROLE gestor_caballos;
DROP ROLE  IF EXISTS usuario_apuestas;
CREATE ROLE usuario_apuestas;
DROP ROLE  IF EXISTS desarrollador;
CREATE ROLE desarrollador;
DROP ROLE  IF EXISTS  admin_adj;
CREATE ROLE admin_adj;

-- DAR LOS PERMISOS DE EJECUCION A LOS PROCEDIMIENTOS A LOS ROLES QUE NOS PIDE LOS EJERCICIOS
GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_ALTA_CARRERA TO juez;
GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_RESULTADO TO juez;

GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_APUESTA TO gestor_apuestas;
GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_RECARGA_CREDITO TO gestor_apuestas;

GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_ALTA_USUARIO TO gestor_usuarios;
GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_BAJA_USUARIO TO gestor_usuarios;

GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_ALTA_CABALLO TO gestor_caballos;
GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_BAJA_CABALLO TO gestor_caballos;

GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_APUESTA TO usuario_apuestas;

--  Dale permisos de creación, consulta e inserción sobre las tablas del esquema CARRERAS_1 AL ROL DEL DESARROLLADOR
GRANT SELECT, INSERT, CREATE, UPDATE, DROP, DELETE ON CARRERAS_1 TO desarrollador;

-- Dale todos los permisos excepto GRANT OPTION AL ROL ADMIN_ADJ
GRANT ALL PRIVILEGES ON  CARRERAS_1 TO  admin_adj WITH GRANT OPTION;


-- En el momento de ejecutarse, el servidor lee la información de estas tablas sobre privilegios
FLUSH PRIVILEGES;
