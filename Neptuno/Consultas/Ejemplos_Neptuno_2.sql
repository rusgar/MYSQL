 USE neptuno;
-- • Hallar toda las compañías de envío
-- • Hallar todos los productos cuya categoría sea Bebidas
-- • Hallar todas los productos cuya categoría contenga "on"
-- • Mostrar todas las categorías(nombre) con la imagen distintos de nulo
-- • Mostrar el nombre de producto y precio de todas las cervezas de la tabla productos y sustituir el cerveza por
--   beer
-- • Mostrar todos los pedidos del cliente Philip Cramer del año 1997
-- • Mostrar los pedidos realizados por Mary Saveley y enviado por la empresa United Package
-- • Mostrar la IdCLiente todos los pendidos que han sido enviados por Speedy Express
-- • Mostrar Idliente=KOENE ; su pedido max, medio y mínimo del año 1997 (puede generar un error de permisos)
-- • Mostrar La I y la comisión(25% cargo) que se ha llevado por un pedido (puede generar un error de permisos)

select *
from neptuno.compañiasenvios;

select neptuno.productos.NombreProducto, neptuno.categorias.NombreCategoria
from neptuno.productos inner join categorias on neptuno.productos.IdCategoria= neptuno.categorias.IdCategoria
where neptuno.categorias.NombreCategoria = 'Bebidas' ;

select  neptuno.productos.NombreProducto, neptuno.categorias.NombreCategoria
from neptuno.productos join neptuno.categorias
on neptuno.productos.IdCategoria = neptuno.productos.IdCategoria
where neptuno.categorias.NombreCategoria like '%on%';

select neptuno.categorias.NombreCategoria
from neptuno.categorias
where neptuno.categorias.Imagen is not null;

select neptuno.productos.NombreProducto as 'Producto Original', 
       replace(neptuno.productos.NombreProducto, 'Cerveza', 'Beer') as 'Productos Nuevo', 
       neptuno.productos.PrecioUnidad
from neptuno.productos
where neptuno.productos.NombreProducto like '%Cerveza%'
order by replace(neptuno.productos.NombreProducto, 'Cerveza', 'Beer')  asc;

select neptuno.clientes.NombreContacto, neptuno.pedidos.FechaPedido, neptuno.pedidos.*
FROM neptuno.clientes inner join neptuno.pedidos
on neptuno.pedidos.IdCliente = neptuno.clientes.IdCliente
where clientes.NombreContacto like '%Philip Cramer%'
and year(neptuno.pedidos.fechaPedido) = 1997;


select neptuno.clientes.NombreContacto , neptuno.compañiasenvios.NombreCompañia, neptuno.pedidos.IdPedido
from neptuno.clientes
inner join  neptuno.pedidos on neptuno.clientes.IdCliente = neptuno.pedidos.IdCliente
inner join neptuno.compañiasenvios on neptuno.pedidos.FormaEnvio= neptuno.compañiasenvios.IdCompañiaEnvios
where neptuno.clientes.NombreContacto = 'Mary Saveley' and neptuno.compañiasenvios.NombreCompañia = 'United Package';


select neptuno.pedidos.IdCliente, neptuno.pedidos.IdPedido, neptuno.compañiasenvios.NombreCompañia
from neptuno.clientes 
inner join neptuno.pedidos on neptuno.clientes.IdCliente = neptuno.pedidos.IdCliente
inner join neptuno.compañiasenvios on neptuno.pedidos.FormaEnvio = neptuno.compañiasenvios.IdCompañiaEnvios
where neptuno.compañiasenvios.NombreCompañia = 'Speedy Express';

-- • Mostrar Idliente=KOENE ; su pedido max, medio y mínimo del año 1997 (puede generar un error de permisos)

select neptuno.clientes.IdCliente,
       format(max(neptuno.pedidos.cargo), 2) as 'Pedido Maximo',
       format(avg(neptuno.pedidos.cargo), 2) as 'Pedido Medio',
	   format(min(neptuno.pedidos.cargo), 2) as 'Pedido Minimo'      
from  neptuno.pedidos
inner join neptuno.clientes
on neptuno.pedidos.IdCliente = neptuno.clientes.IdCliente
where neptuno.clientes.IdCliente ='KOENE' and year(neptuno.pedidos.FechaPedido) = '1997';

-- • Mostrar La Id y la comisión(25% cargo) que se ha llevado por un pedido (puede generar un error de permisos)
select neptuno.pedidos.IdPedido, neptuno.empleados.IdEmpleado, round(neptuno.pedidos.cargo * 0.75, 2) as 'Comision'
from neptuno.pedidos
inner join neptuno.empleados
on neptuno.pedidos.IdEmpleado=neptuno.empleados.IdEmpleado 
where rand(neptuno.empleados.nombre) limit 1  ;


 -- Dos pruebas de subconsulta
select neptuno.pedidos.IdPedido,neptuno.pedidos.IdEmpleado, neptuno.empleados.Nombre, format(neptuno.pedidos.cargo * 0.25, 2) as 'Comision'
from neptuno.pedidos inner join neptuno.empleados
on neptuno.pedidos.IdEmpleado= neptuno.empleados.IdEmpleado
where  neptuno.pedidos.IdPedido =( select ped.IdPedido
                                   from neptuno.pedidos ped
                                   order by  ceil((rand() * (11077 - 10248) + 10248 ))limit 1)
order by (rand() * (11077 - 10248) + 10248) limit 1; 

select neptuno.pedidos.IdPedido,neptuno.pedidos.IdEmpleado, neptuno.empleados.Nombre, round(neptuno.pedidos.cargo * 0.25, 2) as 'Comision'
from neptuno.pedidos inner join neptuno.empleados
on neptuno.pedidos.IdEmpleado= neptuno.empleados.IdEmpleado
where  neptuno.pedidos.IdPedido = 10248;
	

SELECT 
    NombreProducto, (
        SELECT NombreCategoria 
        FROM neptuno.categorias 
        WHERE neptuno.categorias.IdCategoria = neptuno.productos.IdCategoria
    ) AS NombreCategoria
FROM 
    neptuno.productos
WHERE 
    IdCategoria IN (
        SELECT IdCategoria 
        FROM neptuno.categorias 
        WHERE NombreCategoria = 'Bebidas'
    );
     