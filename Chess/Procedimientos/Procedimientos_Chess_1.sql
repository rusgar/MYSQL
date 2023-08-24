#	En primer lugar, le decimos a MySQL que vamos a utilizar
#	como delimitador  dos barras "//" (podría ser cualquier otra combinación de caracteres)
DELIMITER // 
DROP PROCEDURE IF EXISTS OBTENER_GANADOR_1// -- En esta línea, borramos el procedimiento si existe
CREATE PROCEDURE OBTENER_GANADOR_1(IN P_FECHA DATE) -- En esta línea, decimos que queremos crear un
												  -- procedimiento con un parámetro de entrada (IN)
                                                  -- y el tipo de datos será fecha (DATE).
BEGIN	-- Aquí decimos que empieza el conjunto de sentencias que conformarán nuestro procedimiento.
-- ---------------------------------------------------------------------------------------------------
-- En primer lugar, seleccionamos el resultado de la partida que se haya jugado en la fecha que
-- hemos introducido cuando hagamos la llamada al procedimiento (el parámetro P_FECHA).
-- ---------------------------------------------------------------------------------------------------
    SELECT RESULTADO 
		FROM PARTIDAS
        WHERE FECHA = P_FECHA
			INTO @COLOR_GANADOR; -- Y lo guardamos en una variable llamada @COLOR_GANADOR que, al
								 -- volcar sobre ella el valor de PARTIDAS.RESULTADO, tendrá el mismo
                                 -- tipo de datos que este campo (entero).
-- ---------------------------------------------------------------------------------------------------
	IF @COLOR_GANADOR = 'N' THEN -- En primer lugar, le decimos qué tiene que hacer si el valor
								 -- de @COLOR_GANADOR (donde hemos volcado el valor del resultado
                                 -- de la partida jugada el día P_FECHA) es N; es decir, que hayan
                                 -- ganado las negras.
-- ---------------------------------------------------------------------------------------------------
		SELECT JUGADORES.JUGADOR, JUGADORES.PAIS -- Los campos que queremos sacar son JUGADOR de la
												 -- tabla JUGADORES y PAIS de la tabla JUGADORES
-- ---------------------------------------------------------------------------------------------------
			FROM JUGADORES INNER JOIN PARTIDAS -- Tenemos que acudir a la tabla PARTIDAS, porque es la
											   -- tabla donde tenemos ID_JUGDOR_B (el ID del
                                               -- jugador de blancas) y el ID_JUGADOR_N (el ID del
                                               -- jugador de negras).
-- ---------------------------------------------------------------------------------------------------
            ON JUGADORES.ID_JUGADOR = PARTIDAS.ID_JUGADOR_N -- En este caso, como el ganador es el 
															-- jugador de negras, la condición para 
                                                            -- enlazar las tablas es que el ID del
                                                            -- jugador en JUGADORES sea igual al ID
                                                            -- del jugador de negras en PARTIDAS.
-- ---------------------------------------------------------------------------------------------------                                                            
				WHERE PARTIDAS.FECHA = P_FECHA; -- Aquí metemos la condición de la consulta (que la 
												-- fecha sea igual a la que introducimos en la 
                                                -- llamada).
-- ---------------------------------------------------------------------------------------------------
	ELSEIF @COLOR_GANADOR = 'B' THEN -- En segundo lugar, le decimos qué tiene que hacer si el valor
									 -- de @COLOR_GANADOR (donde hemos volcado el valor del resultado
									 -- de la partida jugada el día P_FECHA) es B; es decir, que hayan
                                     -- ganado las blancas.
-- ---------------------------------------------------------------------------------------------------
     	SELECT JUGADORES.JUGADOR, JUGADORES.PAIS -- Los mismos campos que en el caso "N".
			FROM JUGADORES INNER JOIN PARTIDAS 
            ON JUGADORES.ID_JUGADOR = PARTIDAS.ID_JUGADOR_B -- Sólo cambia la condición de enlace
															-- donde, en este caso, vamos a indicar
                                                            -- que enlace el campo ID_JUGADOR
                                                            -- de la tabla JUGADORES con el
                                                            -- ID de jugador que jugó de blancas 
				WHERE PARTIDAS.FECHA = P_FECHA; -- La misma condición que para negras
-- ---------------------------------------------------------------------------------------------------
	ELSE -- Ahora, le vasmo a decir qué hacer si no ganaron ni blancas ni negras (tablas)
-- ---------------------------------------------------------------------------------------------------
--  En este caso, sólo mostrará en pantalla el texto 'La partida terminó en tablas' con el título
--  'No hay ningún ganador'
-- ---------------------------------------------------------------------------------------------------
		SELECT 'La partida terminó en tablas' AS 'No hay ningún ganador';
-- ---------------------------------------------------------------------------------------------------
-- Y, por último, cerramos el "IF"
-- ---------------------------------------------------------------------------------------------------
    END IF;
-- ---------------------------------------------------------------------------------------------------
END
//