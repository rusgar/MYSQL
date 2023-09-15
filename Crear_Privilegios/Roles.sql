-- -----------------------BORRAMOS Y CREAMOS EL ROL QUE QUERAMOS-------------
DROP ROLE  IF EXISTS JUEZ;
CREATE ROLE JUEZ;

-- -------------------------LE DAMOS PERMISOS DE EJECUCION SOBRE LOS PRODECIMIENTOS ---------------------

GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_ALTA_CARRERA TO JUEZ;
GRANT EXECUTE ON PROCEDURE CARRERAS_1.PR_RESULTADO TO JUEZ;
FLUSH PRIVILEGES;

-- ---------------------------bORRAMOS Y CREAMOS AL USUARIOM QUE SERA EL QUE OBTEBTE EL ROL DE JUEZ--------------

DROP USER  IF EXISTS DIOGENES@LOCALHOST;
CREATE USER DIOGENES@LOCALHOST IDENTIFIED By 'DIOGENES';

-- ---------------------lE DAMOS AL USUARIO DIOGENES EL ROL POR DEFECTO '' JUEZ'' -------------------------------
GRANT JUEZ TO DIOGENES@LOCALHOST;
SET DEFAULT ROLE JUEZ TO  DIOGENES@LOCALHOST;