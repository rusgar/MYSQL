-- 1 devuelve una lista con todos los productos que se han pagado por cheque 
select pedido.codigo_pedido, pago.forma_pago, sum(detalle_pedido.precio_unidad* detalle_pedido.cantidad) as 'Precio'
 from producto join detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto 
inner join pedido on detalle_pedido.codigo_pedido = pedido.codigo_pedido 
inner join cliente on pedido.codigo_cliente = cliente.codigo_cliente
inner join  pago on cliente.codigo_cliente = pago.codigo_cliente
where pago.forma_pago  like '%Cheque%'
group by  pago.forma_pago,pedido.codigo_pedido;





-- 2 devuelve una lista con el o los productos que tenga el valor mas bajo por unidad 


-- 3 devuelve una lista de los pedidos que tengan la misma cantidad de productos por cliente

-- 4 Devuelve un listado de todos los pedidos que fueron entregados  en desde el 01/01/2009 hasta el 31/04/2009.

-- 4 Devuelve el nombre del cliente con mayor limnite de credito y que resida en Humanes.

-- 5 Lista el nombre del producto más caro segun su precio de venta que pertenecen a la gama Frutales.

-- 6 lista el nombre de las oficinas de España y los número de teléfono

-- 7 Lista los pagos del mes de enero, febrero y marzo del año 2009

-- 8 Lista los pagos y pedidos que se realizaron en el año 2009

-- 9 Lista los nombres  y apellidos de los empleados cuyo nombre empiece por M.

-- 10 Lista todos los productos de Murcia Seasons

-- 11 Lista todos los pedidos del año 2009.

-- 12 Obtener información de todos los productos en stock.

-- 13 Obtener el total de ventas por cliente.

-- 14 Obtener la lista de empleados y sus jefes correspondientes.
