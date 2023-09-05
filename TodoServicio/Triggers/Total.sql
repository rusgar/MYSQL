USE  TODOSERVICIO_NORM;
DROP TRIGGER IF EXISTS  TR_ACTUALIZAR_TOTAL;
-- Creo el trigger

DELIMITER //
CREATE TRIGGER TR_ACTUALIZAR_TOTAL
BEFORE INSERT ON SERVICIOS_CONTRATADOS FOR EACH ROW
BEGIN
DECLARE dias INT;
SET dias = DATEDIFF(NEW.FECHA_FIN, NEW.FECHA_INICIO) + 1;
SET NEW.TOTAL = (SELECT TARIFA_DIA FROM servicios_ofertados WHERE ID_SERVICIO = NEW.ID_SERVICIO) * dias;
END;
//
DELIMITER ;




-- Hago un insert

INSERT INTO servicios_contratados VALUES (DEFAULT,1, 1, '20230801', '20230815',0);





