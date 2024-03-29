use viogen;
DELIMITER //
DROP TRIGGER IF EXISTS TR_ABRIR_HISTORIAL//
CREATE TRIGGER TR_ABRIR_HISTORIAL
       AFTER INSERT ON USUARIAS
             FOR EACH ROW
 BEGIN
       
          INSERT INTO HISTORIAL VALUES (NEW.COD_USUARIA, NEW.COD_RIESGO,NEW.SOLICITA_OP, CURRENT_DATE());
       
       
 END

//


-- -------------------------------------------------------------------------------------------------------
DELIMITER $$
DROP TRIGGER IF EXISTS TR_ACTUALIZAR_HISTORIAL$$
CREATE TRIGGER TR_ACTUALIZAR_HISTORIAL
       AFTER update ON USUARIAS
             FOR EACH ROW
 BEGIN
       IF OLD.COD_RIESGO<> NEW.COD_RIESGO THEN
          INSERT INTO HISTORIAL VALUES(NEW.COD_USUARIA, NEW.COD_RIESGO,NEW.SOLICITA_OP, CURRENT_DATE());
       
       END IF;
 END

$$

-- --------------------------------------------------------------------------------------------------------
