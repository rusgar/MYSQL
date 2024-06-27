# Averiguar en qué categoría de productos se hallan las 'cervezas'

select productos.NombreProducto, categorias.NombreCategoria
from productos inner join categorias
on productos.IdCategoria = categorias.IdCategoria
 where productos.NombreProducto like '%Cerveza%';

#Mostrar todos los CLIENTES cuyo nombreCompañia incluya el texto “store”

select *
from clientes
where NombreCompañia like '%store%';


#Mostrar nombreproducto y preciounidad de todos los PRODUCTOS que se encuentren suspendidos

select NombreProducto, PrecioUnidad, Suspendido
from productos
where Suspendido != 0;


#Mostrar de la tabla de EMPLEADOS, el nombre, apellidos y cargo con el siguiente formato: Nombre Apellidos (Cargo)

select concat_ws('   ',neptuno.empleados.Nombre, neptuno.empleados.Apellidos,
       concat('(', neptuno.empleados.Cargo, ')')) as 'Nombre Apellidos (Cargo)'
from neptuno.empleados
order by neptuno.empleados.Nombre asc;

#Mostrar el número de países diferentes que hay en la tabla de CLIENTES.

select   count( distinct pais) as 'Numero de Paises'
from clientes;

#Mostrar el cargo medio de los PEDIDOS realizados en el año 1996.

select concat(format(avg(Cargo), 2), '  €') as 'Cargo Medio'
from pedidos
where year(FechaPedido)= '1996';

#Queremos hacer un descuento del 25% en todos nuestros PRODUCTOS.  Mostrar el nombreproducto, el precioUnidad sin y con descuento.

select	neptuno.productos.NombreProducto,
       concat(round(neptuno.productos.PrecioUnidad, 2 ), ' €') as 'Precio sin descuento', 
       concat(round(neptuno.productos.PrecioUnidad * 0.75, 2), ' €') as 'Precio con descuento'   
from neptuno.productos
order by neptuno.productos.NombreProducto asc;

# Mostrar todos los pedidos del cliente Philip Cramer del año 1997

select neptuno.clientes.NombreContacto, neptuno.pedidos.FechaPedido
from neptuno.pedidos inner join clientes
on neptuno.pedidos.IdCliente = neptuno.clientes.IdCliente
where clientes.NombreContacto like '%Philip Cramer%'
and year(neptuno.pedidos.fechaPedido) = 1997;

# Mostrar los pedidos realizados por Mary Saveley y enviado por la empresa United Package

select neptuno.clientes.NombreContacto , neptuno.compañiasenvios.NombreCompañia, neptuno.pedidos.IdPedido
from neptuno.clientes
inner join  neptuno.pedidos on neptuno.clientes.IdCliente = neptuno.pedidos.IdCliente
inner join neptuno.compañiasenvios on neptuno.pedidos.FormaEnvio= neptuno.compañiasenvios.IdCompañiaEnvios
where neptuno.clientes.NombreContacto = 'Mary Saveley' and neptuno.compañiasenvios.NombreCompañia = 'United Package';

#Dime por favor qué dos empleados tramitaron pedidos en mayo de 1998 que incluían productos rebajados de Estados Unidos y precio por unidad mayor de 20

select  distinct concat_ws('   ',empleados.Nombre,empleados.Apellidos)  as 'Nombre Completo',
                 pedidos.PaisDestinatario, year(pedidos.FechaPedido)
from empleados inner join pedidos
on empleados.IdEmpleado = pedidos.IdEmpleado
where pedidos.FechaPedido between '1998-05-01' and '1998-05-31' and pedidos.PaisDestinatario = 'Estados Unidos';