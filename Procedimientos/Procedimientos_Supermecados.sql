 delimiter //
 drop procedure if exists cajero1//
      create procedure cajero1(IN P_ID_PRODUCTO INT,
                                  P_CANTIDAD INT)
      begin
        SELECT *
		FROM PRODUCTO
			WHERE ID_PRODUCTO = P_ID_PRODUCTO 
            into @ID_PRODUCTO, @NOMBRE, @DESCRIPCION, @PRECIO,@STOCK;            
        UPDATE PRODUCTO
		       SET STOCK = @STOCK - P_CANTIDAD /*PARÁMETRO DE ENTRADA*/
			   WHERE ID_PRODUCTO = P_ID_PRODUCTO;
  
		INSERT INTO VENTA VALUES (DEFAULT, 
						           P_ID_PRODUCTO/*ID_PRODUCTO*/, 
                                   P_CANTIDAD/*CANTIDAD*/, 
                                   @PRECIO/*El precio lo saco del campo PRECIO del SELECT que acabo de hacer*/, 
                                   P_CANTIDAD*@PRECIO);

        SELECT ID_VENTA
	    FROM VENTA
        ORDER BY ID_VENTA DESC LIMIT 1
        INTO @ID_ULTIMA_VENTA;
    
    
      INSERT INTO ASIGNACION VALUES (1, @ID_ULTIMA_VENTA);
      END
      
 
 //