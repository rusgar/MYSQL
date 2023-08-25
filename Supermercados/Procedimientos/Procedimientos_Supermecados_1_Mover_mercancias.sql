-- PROCEDIMIENTO DE MOVER MERCANCIAS

DELIMITER //
DROP procedure IF exists MOV_MERCARCIAS;
CREATE PROCEDURE MOV_MERCARCIAS( IN P_ID_PRODUCTO INT
                                     )
BEGIN
      SELECT  STOCK  FROM producto WHERE ID_PRODUCTO=P_ID_PRODUCTO  INTO @STOCK;
      INSERT INTO stock VALUES(P_ID_PRODUCTO, 1,ROUND(@STOCK/2));
      INSERT INTO stock VALUES(P_ID_PRODUCTO, 2, ROUND(@STOCK/2));
-- UPDATE STOCK SET STOCK =ROUND(@STOCK/2) WHERE ID_PRODUCTO=P_ID_PRODUCTO AND ID_TIENDA=1;
  --    UPDATE STOCK SET STOCK =ROUND(@STOCK/2) WHERE ID_PRODUCTO=P_ID_PRODUCTO AND ID_TIENDA=2;



END

//



call supermercado_1.MOV_MERCARCIAS(1);
call supermercado_1.MOV_MERCARCIAS(2);
call supermercado_1.MOV_MERCARCIAS(3);
call supermercado_1.MOV_MERCARCIAS(4);
call supermercado_1.MOV_MERCARCIAS(5);
call supermercado_1.MOV_MERCARCIAS(6);
call supermercado_1.MOV_MERCARCIAS(8);
call supermercado_1.MOV_MERCARCIAS(9);
call supermercado_1.MOV_MERCARCIAS(10);
call supermercado_1.MOV_MERCARCIAS(11);


-- OTRA MANERA DE PODER MOVER MERCANCIA DESDE EL STOCK DE PRODUCTOS

DELIMITER //
CREATE PROCEDURE MOVEMOS_RANGO(IN PRIMER_ID INT,
                                  ULTIMO_ID INT)
BEGIN
      DECLARE X INT  DEFAULT PRIMER_ID;
      WHILE X <= ULTIMO_ID DO
      CALL MOVEMOS_RANGO(X);
      SET X= X+1;
      END WHILE;


END


//

