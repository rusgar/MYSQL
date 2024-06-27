
#Mostar el cargo y fecha de pedido de todos los pedidos hechos por Robert King de 1996 y agruparlo por fecha de pedidos

select neptuno.pedidos.cargo,neptuno.pedidos.FechaPedido, 
       concat_ws('  ',neptuno.empleados.Nombre, neptuno.empleados.Apellidos) as 'Nombre Completo'
from neptuno.pedidos inner join neptuno.empleados 
on neptuno.pedidos.IdEmpleado=neptuno.empleados.IdEmpleado
where year(neptuno.pedidos.FechaPedido) like '1996' and 
          concat_ws(' ', empleados.Nombre, empleados.Apellidos) = 'Robert King'
order by neptuno.pedidos.fechaPedido;


#Mostrar del pedido 10737 su numero, el nombre de la compañía del cliente, el empleado que lo realizo, el monto y la compañía en que se hizo dicho envió


SELECT neptuno.pedidos.IdPedido, neptuno.clientes.NombreCompañia ,
       concat_ws(' ', empleados.Nombre, empleados.Apellidos) as 'Nombre Cliente',
       format(neptuno.pedidos.Cargo, 2) as ' Cargo',
       neptuno.compañiasenvios.NombreCompañia
from neptuno.pedidos
inner join neptuno.clientes
on neptuno.pedidos.IdCliente=neptuno.clientes.IdCliente
inner join neptuno.empleados
on neptuno.pedidos.IdEmpleado=neptuno.empleados.IdEmpleado
inner join neptuno.compañiasenvios
on neptuno.pedidos.FormaEnvio=neptuno.compañiasenvios.IdCompañiaEnvios
where neptuno.pedidos.IdPedido= 10737;

#al cliente cambiar su nombre de José Pavarotti por pepe Pavarotti

select replace(neptuno.clientes.NombreContacto,'Jose Pavarotti','Pepe Pavarotti') as 'Nombre nuevo',
               neptuno.clientes.Ciudad, neptuno.clientes.Telefono
from neptuno.clientes
where neptuno.clientes.NombreContacto like 'Jose Pavarotti';



#Mostrar el cargo medio de los PEDIDOS redondeado con 2 decimales y realizados en el mes de Julio de 1996.

select concat(round(Avg(neptuno.pedidos.Cargo),2),' €') as 'Cargo Medio',
       neptuno.pedidos.Destinatario
from neptuno.pedidos
where neptuno.pedidos.FechaPedido between '1996-07-01' and '1996-07-31'
group by Destinatario;

#mostrar los empleados contratados en el año 92 de manera ascendente por su nombre

select neptuno.empleados.Nombre, neptuno.empleados.FechaContratacion
from neptuno.empleados
where year(neptuno.empleados.FechaContratacion)=1992
order by neptuno.empleados.Nombre asc;

#mostrar los pedidos realizados por Ana Trujillo entre 1996 y 1998

select neptuno.pedidos.IdPedido, neptuno.clientes.NombreContacto 
from neptuno.pedidos
inner join neptuno.clientes
on neptuno.pedidos.IdCliente=neptuno.clientes.IdCliente
where neptuno.clientes.NombreContacto like 'Ana Trujillo'
and neptuno.pedidos.FechaPedido between '1996-01-01' AND '1998-12-31'
order by neptuno.pedidos.FechaPedido asc;

#Mostar todos los empleados que sean de Londres

select  neptuno.empleados.Nombre as 'empleados'
from neptuno.empleados
where neptuno.empleados.Ciudad like 'Londres';


#mostar los empleados con nombre apellido y tratamiento.

select concat_ws('  ',neptuno.empleados.Tratamiento,neptuno.empleados.Nombre, neptuno.empleados.Apellidos) as ' Tratamiento : Nombre Completo'
from neptuno.empleados;


#Mostrar los precio por Unidad de todos los productos redondeando su precio, los productos que tienen categoría con valor 4.

select neptuno.productos.IdCategoria,neptuno.productos.NombreProducto as 'Producto',
concat(round(neptuno.productos.PrecioUnidad, 2), '  €') as 'Precio'
from neptuno.productos
where neptuno.productos.IdCategoria=4;

#Calcular la suma de los cargos de todos los pedidos con fecha del año 1998.

select concat(round(sum(neptuno.pedidos.Cargo),2), '  €') as 'Suma de Cargos'
from neptuno.pedidos
where year(neptuno.pedidos.FechaPedido) = '1998';