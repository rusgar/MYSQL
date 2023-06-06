-- Practicas con la tabla neptuno

-- Calcular el total de cada pedido con su identidficador
SELECT	IdPedido, sum(PrecioUnidad * Cantidad) as total
FROM	detallespedidos
GROUP by IdPedido;

-- 		Obtener, del pedido 10304, su id, el nombre del cliente,el nombre y apellidos del empleado, la fecha del pedido y el importe total de dicho pedido 
	
SELECT	p.IdPedido, c.NombreCompañia as Cliente,
		e.Apellidos || ' ' || e.Nombre as Empleado,
		p.FechaPedido, sum(d.Cantidad * d.PrecioUnidad) as Total
FROM	Pedidos as p
LEFT 	JOIN Clientes as c on(p.IdCliente = c.IdCliente)
LEFT	JOIN Empleados as e on(p.IdEmpleado = e.IdEmpleado)
		JOIN Detallespedidos as d on(p.IdPedido = d.IdPedido)
WHERE	p.IdPedido = 10304
GROUP by p.IdPedido, c.NombreCompañia,
		 e.Apellidos || ' ' || e.Nombre,
		 p.FechaPedido;
         
-- Obtener el Nombre del producto, el nombre de su categoria y 	el precio, de aquellos productos cuyo precio sea superior
-- a la media del precio de los productos de su categoria,
-- ordenados por precio de mayor a menor.


SELECT	p.NombreProducto, c.NombreCategoria, p.PrecioUnidad
FROM	Productos as p
JOIN	Categorias as c on(p.IdCategoria = c.IdCategoria)
WHERE	p.PrecioUnidad > (SELECT	avg(p1.PrecioUnidad)
						  FROM		Productos as p1
						  WHERE	p1.IdCategoria = p.IdCategoria)
ORDER by p.PrecioUnidad DESC;
