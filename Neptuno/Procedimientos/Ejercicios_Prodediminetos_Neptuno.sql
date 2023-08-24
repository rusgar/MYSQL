#Queremos ver en una consulta sobre la tabla de PEDIDOS:
 #el idpedido, idcliente, idempleado, fechapedido, fechaentrega, 
 #número de días* transcurridos desde el pedido hasta la entrega del 
 #mismo al cliente, cargo del pedido, comisión del vendedor* (15%) 
 #y beneficio neto* (cargo-comisión= 85%). 
 #Solamente se contemplarán los pedidos con FechaPedido 
 #a partir del 1 de enero de 1997 y que se haya tardado menos de 
 #30 días en entregar. 
 
 -- select  distinct ped.IdPedido, ped.IdCliente,ped.IdEmpleado,year(ped.FechaPedido) as 'pedidos',datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
 -- concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', concat(format((det.descuento+(ped.cargo * 0.15) ),2 ),' €') as 'Comision del vendedor',
-- concat(format((det.descuento+(ped.cargo * 0.85) ),2 ),' €') as 'Beneficio'
 -- from pedidos  ped inner join detallespedidos det on det.IdPedido=ped.IdPedido
 -- where year(ped.FechaPedido) like '%1997%'  and  datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
 
 
 -- ver los usuarios creados
 select user, host from mysql.user;
 
 delimiter //
 drop procedure if exists obtener_comisiones//
	create procedure obtener_comisiones()
    begin
		 select  distinct ped.IdPedido,
                      ped.IdCliente,
                      ped.IdEmpleado,
                      year(ped.FechaPedido) as 'pedidos',
                      datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
                      concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', concat(format((det.descuento+(ped.cargo * 0.15) ),2 ),' €') as 'Comision del vendedor',
                      concat(format((det.descuento+(ped.cargo * 0.85) ),2 ),' €') as 'Beneficio'
      from pedidos  ped 
         inner join detallespedidos det 
         on det.IdPedido=ped.IdPedido
      where year(ped.FechaPedido) >= '1997' 
            and  datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
  end
 
 
 
 //
 
  delimiter //
  drop procedure if exists obtener_comisiones_var//
	create procedure obtener_comisiones_var(In Comision Int)
    begin
    set @com= Comision/100;
    set @ben = 1- @com ;
	  select  distinct ped.IdPedido, 
                     ped.IdCliente,
                     ped.IdEmpleado,year(ped.FechaPedido) as 'pedidos',
                     datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
                     concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', 'Comision Vendedor' as Com_Ven, concat(format((ped.cargo *@com) ,2 ),' €') as 'Comision del vendedor',
                     concat(format((ped.cargo * @ben) ,2 ),' €') as 'Beneficio'
    from pedidos ped
    where year(ped.FechaPedido) >= '1997'  
    and  datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
  end
 
 
 
 //
 
   delimiter //
 drop procedure if exists obtener_comisiones_var_fecha//
	create procedure obtener_comisiones_var_fecha(In Comision float, 
                                                      fecha_inicial date  ,
                                                      fecha_final   date )
    begin
     IF COMISION BETWEEN 0 AND 100 THEN
    set @com= Comision/100;
    set @ben = 1- @com ;
    set @fecha_inicial= fecha_inicial  ;
    set @fecha_final= fecha_final ;
	  select   ped.IdPedido,
             ped.IdCliente,
             ped.IdEmpleado,'Fecha de pedido' ,
             ped.fechaPedido, ped.FechaEntrega as 'pedidos',
             datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
             concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', 'Comision Vendedor' as Com_Ven, concat(format((ped.cargo *@com) ,2 ),' €') as 'Comision del vendedor',
             concat(format((ped.cargo * @ben) ,2 ),' €') as 'Beneficio'
    from pedidos ped
    where ped.FechaPedido 
          between @fecha_inicial and @fecha_final 
          and datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
    ELSEIF COMISION < 0 THEN
           SELECT 'NO SE ADMINTE COMISIONES INFERIORES A 0' AS 'Comision Negativa';
    ELSEIF COMISION > 100 THEN
           SELECT 'NO SE ADMINTE COMISIONES SUPERIORES  A 100' AS 'Comision Excesiva al precio';
  END IF;
  end
 
 
 //
 
 -- Nuevamente, podemos comprobar que el resultado es el mismo que el de la petición
	-- inicial si introducimos los parámetros:
	--	COMISION 		= 15
	--	FECHA_FINAL 	= 19970101
	--	FECHA_INICIAL	= NOW()
	CALL obtener_comisiones_var_fecha(15.5, 19970101, NOW())
    
    
 delimiter //
  drop procedure if exists obtener_comisiones_var_fecha_case//
	create procedure obtener_comisiones_var_fecha_case(In Comision float, 
                                                      fecha_inicial date  ,
                                                      fecha_final   date )
    begin    
    case 
      when COMISION < 0 THEN
	       SELECT 'NO SE ADMINTE COMISIONES INFERIORES A 0' AS 'Comision Negativa';
      when COMISION > 100 THEN
	       SELECT 'NO SE ADMINTE COMISIONES SUPERIORES  A 100' AS 'Comision Excesiva al precio';    
      when Comision between 0 and 100 then
    
    set @com= Comision/100;
    set @ben = 1- @com ;
    set @fecha_inicial= fecha_inicial  ;
    set @fecha_final= fecha_final ;
	  select   ped.IdPedido,
             ped.IdCliente,
             ped.IdEmpleado,'Fecha de pedido' ,
             ped.fechaPedido, 
             ped.FechaEntrega as 'pedidos',
             datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
             concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', 'Comision Vendedor' as Com_Ven, 
             concat(format((ped.cargo *@com) ,2 ),' €') as 'Comision del vendedor',
             concat(format((ped.cargo * @ben) ,2 ),' €') as 'Beneficio'
    from pedidos ped
    where ped.FechaPedido 
    between @fecha_inicial 
    and @fecha_final and datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
    end case;
    end
 
 
 //
 -- con las clausulas de 'case' y sus condicionante y mensajes para que salga el mensaje si es valores negativos o demasiodos beneficiosos si es por encima del 100
 call neptuno.obtener_comisiones_var_fecha_case(0.054, '19960601', '19961104');
 
 -- ahora queremos dar un suruarui dar la posibilidad de ehecutar un procesimiento obtener_comisiones_var_fecha_case, si darle
 -- otro permiso ( que no vea tablas , ni funciones)
 
  drop user  'jardinero' @'localhost';
  create user 'jardinero' @'localhost' IDENTIFIED By '147';
  grant execute on procedure neptuno.obtener_comisiones_var_fecha_case to 'jardinero' @'localhost';
  flush privileges;
 
-- Crear un procedimiento con  dos parametros de entrada (tipo dfecha) que devuelva los clientes que han realizado un pedido en el rango de fechas que hemos introducido el usuario
--  y crear un usuario que puede solo crear ese procedimiento

	DELIMITER //
    DROP PROCEDURE IF EXISTS CLIENTES_PEDIDO_FECHA//
    CREATE PROCEDURE CLIENTES_PEDIDO_FECHA( IN FECHA_INICIAL DATE,
                                               FECHA_FINAL DATE  )
    begin
    SELECT * 
    FROM clientes
    INNER JOIN PEDIDOS ON CLIENTES.IDCLIENTE= pedidos.IdCliente
    WHERE PEDIDOS.FECHAPEDIDO BETWEEN FECHA_INICIAL AND FECHA_FINAL ;
         
    
    end
    
    //
    
    call CLIENTES_PEDIDO_FECHA('19970501', '19980105');
    
    
   -- creamos solo un permiso para el repartidor  
  drop user if exists  'repartidor' @'localhost';
  create user 'repartidor' @'localhost' IDENTIFIED By 'xxx';
  grant execute on procedure neptuno.CLIENTES_PEDIDO_FECHA to 'repartidor' @'localhost';
  flush privileges;
 
 
 	DELIMITER //
    DROP PROCEDURE IF EXISTS CLIENTES_PEDIDO_FECHA_1//
    CREATE PROCEDURE CLIENTES_PEDIDO_FECHA_1( IN FECHA_INICIAL DATE,
                                               FECHA_FINAL DATE  )
    begin
    IF FECHA_FINAL >= FECHA_INICIAL THEN
    SELECT * 
    FROM clientes
    INNER JOIN PEDIDOS ON CLIENTES.IDCLIENTE= pedidos.IdCliente
    WHERE PEDIDOS.FECHAPEDIDO BETWEEN FECHA_INICIAL AND FECHA_FINAL ;
    ELSEIF FECHA_FINAL < FECHA_INICIAL then
    select 'LA FICHA FINAL ES ANTERIOR A LA FECHA INICIAL' AS 'ERROR';
    END IF;
         
    
    end
    
    //
    
    call CLIENTES_PEDIDO_FECHA_1('19970102', '19970101');