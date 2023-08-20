
USE correr;


Drop table if exists Runners;
CREATE TABLE Runners (
    Runner_id BIGINT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(120) NOT NULL,
    Time BIGINT NOT NULL,
    Penalty1 BIGINT NOT NULL,
    Penalty2 BIGINT NOT NULL,
    Points BIGINT,
    PRIMARY KEY (Runner_id)
) ;


INSERT INTO Runners VALUES (NULL, 'Michael', 123, 5, 2, NULL);
INSERT INTO Runners VALUES (NULL, 'Sarah', 83, 3, 3, NULL);
INSERT INTO Runners VALUES (NULL, 'John', 323, 1, 1, NULL);
INSERT INTO Runners VALUES (NULL, 'Ramon', 100, 8, 4, NULL);
INSERT INTO Runners VALUES (NULL, 'Andrew', 143, 4, 3, NULL);
INSERT INTO Runners VALUES (NULL, 'Antoine', 199, 3, 2, NULL);
INSERT INTO Runners VALUES (NULL, 'David', 101, 2, 1, NULL);


DROP PROCEDURE IF EXISTS cursorTest;
DELIMITER $$
CREATE PROCEDURE cursorTest (
) BEGIN
-- Variables donde almacenar lo que nos traemos desde el SELECT
  DECLARE v_name VARCHAR(120);
  DECLARE v_time BIGINT;
  DECLARE v_penalty1 BIGINT;
  DECLARE v_penalty2 BIGINT;
-- Variable para controlar el fin del bucle
  DECLARE fin INTEGER DEFAULT 0;

-- El SELECT que vamos a ejecutar
  DECLARE runners_cursor CURSOR FOR
    SELECT Name, Time, Penalty1, Penalty2 FROM Runners;

-- Condición de salida
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

  OPEN runners_cursor;
  get_runners: LOOP
    FETCH runners_cursor INTO v_name, v_time, v_penalty1, v_penalty2;
    IF fin = 1 THEN
       LEAVE get_runners;
    END IF;

  SELECT v_name, v_time, v_penalty1, v_penalty2;

  END LOOP get_runners;

  CLOSE runners_cursor;
END$$
DELIMITER ;