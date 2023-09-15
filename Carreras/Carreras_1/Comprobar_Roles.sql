/*

	Utiliza la función SUBSTRING_INDEX() y modifica el siguiente procedimiento en la base de 
    datos CARRERAS para que, cuando se da de alta un nuevo usuario, se le asigne el rol por 
    defecto "usuario_apuestas". Añade un parámertro de entrada que se llame "PE_PASSWORD"
    y asigna esa contraseña al usuario:
    */


USE CARRERAS_1;
DELIMITER $$
DROP PROCEDURE IF EXISTS PR_ALTA_USUARIO$$
CREATE PROCEDURE PR_ALTA_USUARIO(IN PE_CORREO VARCHAR(255), -- Cambiado a PE_CORREO para representar una dirección de correo electrónico
								 IN PE_CREDITO DECIMAL(10,2),
								 IN PE_PASSWORD VARCHAR(255)) -- Nuevo parámetro de entrada para la contraseña
BEGIN	
    
    
    SET @ID_USUARIO = NULL;
    SET @BAJA = NULL;
    
    -- Extraer el nombre de usuario de la dirección de correo electrónico usando SUBSTRING_INDEX
    SET @PE_USUARIO = SUBSTRING_INDEX(PE_CORREO, '@', 1);
    
    SELECT ID_USUARIO, BAJA
    FROM USUARIOS
    WHERE USUARIO = @PE_USUARIO
    INTO @ID_USUARIO, @BAJA;
    
    IF @ID_USUARIO IS NULL THEN
        -- Insertar el nuevo usuario con el rol "usuario_apuestas" y la contraseña proporcionada
        INSERT INTO USUARIOS (USUARIO, CREDITO, ROL, PASSWORD) 
        VALUES (@PE_USUARIO, PE_CREDITO, 'usuario_apuestas', PE_PASSWORD);
    ELSEIF @BAJA = '' THEN
        SET @MENSAJE = CONCAT('El usuario ', @PE_USUARIO, ' ya existe; por favor, escoja otro nombre.');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @MENSAJE;
    ELSE
        -- Si el usuario existe pero está marcado como "baja", actualizar su estado
        UPDATE USUARIOS SET BAJA = '' WHERE USUARIO = @PE_USUARIO;
    END IF;
END
$$

USE CARRERAS_1;

DELIMITER $$

DROP PROCEDURE IF EXISTS PR_ALTA_USUARIO$$

CREATE PROCEDURE PR_ALTA_USUARIO(IN PE_USUARIO VARCHAR(40),

								 IN PE_CREDITO DECIMAL(10,2),

                                 IN PE_CONTRASENIA VARCHAR(40))

		BEGIN	

				SET @ID_USUARIO = NULL;

				SET @BAJA = NULL;

				SELECT ID_USUARIO, BAJA

					FROM USUARIOS

					WHERE USUARIO = PE_USUARIO

						INTO @ID_USUARIO, @BAJA;

			IF @ID_USUARIO IS NULL THEN

				INSERT INTO USUARIOS (USUARIO, CREDITO) 

							VALUES (PE_USUARIO, PE_CREDITO);

	-- ------------------------------------------------------------------------------------------------------------------			

               SET @SENTENCIA = NULL;

               SELECT CONCAT('CREATE USER', PE_USUSARIO, '@LOCALHOST', ' IDENTIFIED BY ', "", PE_CONTRASENIA, "" ';')

					INTO @SENTENCIA;

                    PREPARE SENTENCIA FROM @SENTENCIA;

                    EXECUTE SENTENCIA;

	-- ------------------------------------------------------------------------------------------------------------------			             

			  SELECT CONCAT('GRANT usuario_apuestas TO ', PE_USUSARIO, '@LOCALHOST;') INTO @SENTENCIA;

                    PREPARE SENTENCIA FROM @SENTENCIA;

                    EXECUTE SENTENCIA;

			  FLUSH PRIVILEGES;

              SELECT CONCAT('SET DEFAULT ROLE usuario_apuestas TO ', PE_USUARIO, '@LOCALHOST;') INTO @SENTENCIA;

                    PREPARE SENTENCIA FROM @SENTENCIA;

                    EXECUTE SENTENCIA;

	-- ------------------------------------------------------------------------------------------------------------------		           

                

			ELSEIF @BAJA = '' THEN

				SET @MENSAJE = CONCAT('El usuario ', PE_USUARIO, ' ya existe; por favor, escoja otro nombre.');

				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @MENSAJE;

			ELSE

				UPDATE USUARIOS SET BAJA = '' WHERE USUARIO = PE_USUARIO;

			END IF;


		END

$$

    
    

