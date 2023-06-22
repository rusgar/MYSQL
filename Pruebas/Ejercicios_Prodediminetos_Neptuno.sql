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
 
 delimiter //
 drop procedure if exists obtener_comisiones//
	create procedure obtener_comisiones()
    begin
		 select  distinct ped.IdPedido, ped.IdCliente,ped.IdEmpleado,year(ped.FechaPedido) as 'pedidos',datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
 concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', concat(format((det.descuento+(ped.cargo * 0.15) ),2 ),' €') as 'Comision del vendedor',
 concat(format((det.descuento+(ped.cargo * 0.85) ),2 ),' €') as 'Beneficio'
 from pedidos  ped inner join detallespedidos det on det.IdPedido=ped.IdPedido
  where year(ped.FechaPedido) >= '1997'  and  datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
  end
 
 
 
 //
 
  delimiter //
 drop procedure if exists obtener_comisiones_var//
	create procedure obtener_comisiones_var(In Comision Int)
    begin
    set @com= Comision/100;
    set @ben = 1- @com ;
	 select  distinct ped.IdPedido, ped.IdCliente,ped.IdEmpleado,year(ped.FechaPedido) as 'pedidos',datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
 concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', 'Comision Vendedor' as Com_Ven, concat(format((ped.cargo *@com) ,2 ),' €') as 'Comision del vendedor',
 concat(format((ped.cargo * @ben) ,2 ),' €') as 'Beneficio'
 from pedidos ped
  where year(ped.FechaPedido) >= '1997'  and  datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
  end
 
 
 
 //
 
   delimiter //
 drop procedure if exists obtener_comisiones_var_fecha;
	create procedure obtener_comisiones_var_fecha(In Comision Int, 
                                                      fecha_inicial date  ,
                                                      fecha_final   date )
    begin
    set @com= Comision/100;
    set @ben = 1- @com ;
    set @fecha_inicial= fecha_inicial  ;
    set @fecha_final= fecha_final ;
	select   ped.IdPedido, ped.IdCliente,ped.IdEmpleado,'Fecha de pedido' ,  ped.fechaPedido, ped.FechaEntrega as 'pedidos',datediff( ped.FechaEntrega, ped.FechaPedido) as 'Dias Transcurridos', 
 concat(format(ped.cargo, 2) , ' €')as 'Cargo del Pedido', 'Comision Vendedor' as Com_Ven, concat(format((ped.cargo *@com) ,2 ),' €') as 'Comision del vendedor',
 concat(format((ped.cargo * @ben) ,2 ),' €') as 'Beneficio'
 from pedidos ped
  where ped.FechaPedido between @fecha_inicial and @fecha_final and datediff( ped.FechaEntrega, ped.FechaPedido) < 30 ;
  end
 
 
 
 //
 