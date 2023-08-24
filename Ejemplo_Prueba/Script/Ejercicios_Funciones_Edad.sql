set global log_bin_trust_function_creators = 1;

-- Creo la función CALCULAR_EDAD 
DELIMITER //
DROP FUNCTION IF EXISTS CALCULAR_EDAD//
CREATE FUNCTION calcular_edad(fecha DATE)
RETURNS INT
BEGIN
	DECLARE edad INT;
		SET edad = YEAR(CURRENT_DATE()) - YEAR(fecha);
			IF (MONTH(fecha) > MONTH(CURRENT_DATE())) OR (MONTH(fecha) = MONTH(CURRENT_DATE()) AND DAY(fecha) > DAY(CURRENT_DATE())) THEN
				SET edad = edad - 1;
			END IF;
	RETURN edad;
END
//

DELIMITER ;


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


-- Creamos otro procedimiento nuevo

SHOW COLUMNS FROM ALUMNOS;


DELIMITER $$
-- drop procedure if exists selecionar_fecha_nacimiento

create procedure selecionar_fecha_de_nacimiento(IN NOM  VARCHAR(50), AP1 VARCHAR(50), AP2 VARCHAR(50))
  BEGIN
       SELECT ALUMNOS.FECHA_NACIMIENTO
       FROM ALUMNOS
       WHERE NOMBRE = NOM AND APELLIDO1 = AP1 AND APELLIDO2 = AP2;
  
  END



$$


-- Creamos otro procedimiento nuevo difetente con el while
	
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_edad$$
CREATE PROCEDURE actualizar_edad_1()
BEGIN
	DECLARE Edad, x, años int;
    DECLARE fecha date;
    DECLARE done int  DEFAULT false;
    DECLARE curEdad CURSOR FOR SELECT id,fecha_nacimiento FROM test.alumnos; -- declaramos el cursor   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
    -- abre el cursor
	OPEN curEdad;
    
     while done = false do -- voy leyendo el curoso hasta que no encuentre mas elementos
           fetch curEdad into x , fecha; -- aqui extraigo un elemento del cursor   
              set años = calcular_edad(fecha); -- calculamos los años de cada alumno
			  update alumnos set edad=años where alumnos.id= x; -- actualizamos la edad en la tabla alumnos         
            
     end while;      
  
	close curEdad;
END
$$
delimiter ;

--- ALTERNATIVA: TRIGGER 

Delimiter $$
DROP TRIGGER IF EXISTS actualizar_edad$$ -- Borramos el TRIGGER por si existiera
CREATE TRIGGER actualizar_edad			 -- Creamos el TRIGGER
	BEFORE INSERT ON alumnos			 -- y le decimos que lo lance antes de hacer el INSERT
									     -- en la tabla ALUMNOS
		FOR EACH ROW					 -- para cada registro (fila)
			BEGIN
#PRINICPIO
				SET NEW.edad/*En los TRIGGERS, usamos NEW.campo para
							  referirnos al valor nuevo del campo*/ 
                              = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
                              /*La función TIMESTAMPDIFF calcula la diferencia, en este caso
                              en formato YEAR (años) entre ALUMNOS.FECHA_NACIMIENTO y la fecha
                              actual (CURDATE se refiere a Current Date*/
#FIN
			END	
$$