 delimiter //
 drop procedure if exists caja1//
      create procedure caja1(IN P_ID_PRODUCTO INT,
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
      
      select venta.Id_venta, producto.Nombre, producto.precio,venta.cantidad, venta.total
      from producto
      inner join venta  on producto.Id_producto= venta.Id_producto
      where venta.id_venta = @ID_ULTIMA_VENTA;
      END
      
 
 //
 
 
  delimiter //
 drop procedure if exists caja2//
      create procedure caja2(IN P_ID_PRODUCTO INT,
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
    
    
      INSERT INTO ASIGNACION VALUES (2, @ID_ULTIMA_VENTA);
      
      select venta.Id_venta, producto.Nombre, producto.precio,venta.cantidad, venta.total
      from producto
      inner join venta  on producto.Id_producto= venta.Id_producto
      where venta.id_venta = @ID_ULTIMA_VENTA;
      END
      
 
 //