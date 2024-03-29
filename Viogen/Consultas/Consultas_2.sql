USE VIOGEN_2;
-- 1 obtener los datos de las usuarias y sus agresores

SELECT CONCAT(USUARIAS.NOMBRE,'   ',USUARIAS.APELLIDO1,'  ',USUARIAS.APELLIDO2) AS 'DATOS PERSONALES USUARIAS',
       USUARIAS.DNI, USUARIAS.NACIONALIDAD, USUARIAS.TELEFONO,
       CONCAT(AGRESORES.NOMBRE,'   ',AGRESORES.APELLIDO1,'  ',AGRESORES.APELLIDO2) AS 'DATOS PERSONALES AGRESOR',
    AGRESORES.DNI
FROM USUARIAS
INNER  JOIN VINCULOS ON  USUARIAS.COD_USUARIA = VINCULOS.COD_USUARIA
INNER  JOIN AGRESORES ON VINCULOS.COD_AGRESOR = AGRESORES.COD_AGRESOR;


-- 2 OBTENER LOS TEXTOS DE LAS MEDIDAS ASOCIADAS A ZOA

SELECT USUARIAS.NOMBRE, TIPOS_MEDIDAS.TIPO_MEDIDA, MEDIDAS.FECHA_INICIO,MEDIDAS.FECHA_FIN
FROM TIPOS_MEDIDAS
INNER JOIN MEDIDAS ON MEDIDAS.COD_TIPO_MEDIDA = TIPOS_MEDIDAS.COD_TIPO_MEDIDA
INNER JOIN ORDEN_PROTEC ON ORDEN_PROTEC.COD_ORDEN =MEDIDAS.COD_ORDEN
INNER JOIN USUARIAS ON USUARIAS.COD_USUARIA = ORDEN_PROTEC.COD_USUARIA
WHERE USUARIAS.NOMBRE = 'zoa';

-- 3 OBTERNER MEDIDAS DE TIPO CIVIL ASOCIADAS A REBECA

SELECT USUARIAS.NOMBRE, JURISDICCION.JURISDICCION, TIPOS_MEDIDAS.TIPO_MEDIDA
FROM JURISDICCION
INNER JOIN TIPOS_MEDIDAS ON TIPOS_MEDIDAS.COD_JURISDICCION = JURISDICCION.COD_JURISDICCION
INNER JOIN MEDIDAS ON MEDIDAS.COD_TIPO_MEDIDA = TIPOS_MEDIDAS.COD_TIPO_MEDIDA
INNER JOIN ORDEN_PROTEC ON ORDEN_PROTEC.COD_ORDEN =MEDIDAS.COD_ORDEN
INNER JOIN USUARIAS ON USUARIAS.COD_USUARIA = ORDEN_PROTEC.COD_USUARIA
WHERE USUARIAS.NOMBRE = 'REBECA' AND JURISDICCION.JURISDICCION = 'civil';


