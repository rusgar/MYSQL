
# Mostrar los pedidos cuyo destinatario sea 'Old World Delicatessen' y enviados en 1996

select *
from pedidos
where Destinatario = 'Old World Delicatessen';

# Mostrar La Id de empleados y la comisión(15% cargo) que se ha llevado por un pedido

select empleados.IdEmpleado, round(pedidos.Cargo * 0.15, 2) as 'Comision'
from empleados inner join pedidos
on empleados.IdEmpleado=pedidos.IdEmpleado;

# Mostrar todos los pedidos de la compañia Speedy Express cuyo Pais destinatario sea España

select *
from pedidos inner join compañiasenvios
on pedidos.FormaEnvio=compañiasenvios.IdCompañiaEnvios
where compañiasenvios.NombreCompañia like 'Speedy Express' and pedidos.PaisDestinatario like 'España';

# Muestra todos los empleados cuya ciudad sea Londres

select *
from empleados
where Ciudad = 'Londres';

# Muestra el nombre de producto y nombre de compañia de la compañia Leka Trading

select productos.NombreProducto, proveedores.NombreCompañia
from productos inner join proveedores
on productos.IdProveedor=proveedores.IdProveedor
where proveedores.NombreCompañia like 'Leka Trading';

# Muestra los empleados cuya fecha de contratación sea anterior a 1994

select *
from empleados
where year(FechaContratacion) < '1994';

# Muestra el precio por unidad más alto de todos los productos

select NombreProducto, max(PrecioUnidad) as 'precio Maximo'
from productos
group by NombreProducto
order by NombreProducto asc;


# Muestra el el id y el cargo de los cinco pedidos más caros de forma descendente

select IdPedido, concat(format(Cargo, 2), '  €')
from pedidos
order by Cargo desc
limit 5;

# Muestra cuantos pedidos ha hecho Hanna Moos en 1998

select *
from pedidos inner join clientes
on pedidos.IdCliente=clientes.IdCliente
where year(pedidos.FechaPedido) = '1998' and clientes.NombreContacto like 'Hanna%';

# Mostrar el nombre de las categorías y el productos de dichas categorias de los pedidos de Philip Cramer en 1997

select categorias.NombreCategoria, productos.NombreProducto
from clientes inner join pedidos
on clientes.IdCliente=pedidos.IdCliente
inner join detallespedidos
on pedidos.IdPedido=detallespedidos.IdPedido
inner join productos
on detallespedidos.IdProducto=productos.IdProducto
inner join categorias
on productos.IdCategoria=categorias.IdCategoria
where clientes.NombreContacto like 'Philip Cramer' and year(pedidos.FechaPedido)= '1997'
order by categorias.NombreCategoria asc;
;