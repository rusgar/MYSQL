set search_path to liga, "$user";
CREATE TRIGGER ACTUALIZAR_RESULTADO
BEFORE INSERT ON PARTIDOS
FOR EACH ROW
EXECUTE FUNCTION ACTUALIZAR_RESULTADO();

CREATE TRIGGER CAMBIAR_RESULTADO
BEFORE UPDATE ON PARTIDOS
FOR EACH ROW
EXECUTE FUNCTION ACTUALIZAR_RESULTADO();



INSERT INTO EQUIPOS VALUES (15, 'SPORTING'),(16,'OVIEDO');
INSERT INTO PARTIDOS VALUES (15,16,5,0,DEFAULT,2,CURRENT_DATE);

SELECT *
FROM PARTIDOS;

UPDATE PARTIDOS
SET MARCADOR_VISITANTE = 1
WHERE ID_LOCAL = 15;