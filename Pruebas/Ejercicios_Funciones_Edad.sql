-- Creamos el procedimiento que actualiza la edad
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_edad$$
CREATE PROCEDURE actualizar_edad()
BEGIN
	DECLARE vEdad integer;
    DECLARE vId integer;
    DECLARE done integer DEFAULT 0;
    DECLARE cEdad CURSOR FOR SELECT calcular_edad(fecha_nacimiento), id FROM alumnos;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN cEdad;
    FETCH FROM cEdad INTO vEdad, vId;
		bucle: LOOP
			IF done = 1 THEN
				LEAVE bucle;
			END IF;
            UPDATE alumnos SET edad = vEdad WHERE id = vId;
            FETCH cEdad INTO vEdad, vId;
		END LOOP;
	CLOSE cEdad;
END
$$


-- Creamos el procedimiento que actualiza la edad
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_edad$$
CREATE PROCEDURE actualizar_edad()
BEGIN
	DECLARE vEdad integer;
    DECLARE vId integer;
    DECLARE done integer DEFAULT 0;
    DECLARE cEdad CURSOR FOR SELECT calcular_edad(fecha_nacimiento), id FROM alumnos;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN cEdad;
    FETCH FROM cEdad INTO vEdad, vId;
		bucle: LOOP
			IF done = 1 THEN
				LEAVE bucle;
			END IF;
            UPDATE alumnos SET edad = vEdad WHERE id = vId;
            FETCH cEdad INTO vEdad, vId;
		END LOOP;
	CLOSE cEdad;
END
$$
