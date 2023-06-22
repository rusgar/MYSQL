select od.IdProducto ,
	 sum(od.PrecioUnidad) as 'total vendido', (select PrecioUnidad from productos where od.idProducto=Productos.Idproducto) as price, 
     (select NombreProducto from productos where od.idProducto=Productos.Idproducto) as nombre, 
    round( sum(od.PrecioUnidad) *  (select precioUnidad from productos where od.idProducto=Productos.Idproducto)) as 'Total recaudado'
from detallespedidos as od
where PrecioUnidad > 40
group by IdProducto
order by 'Total recaudado' desc;