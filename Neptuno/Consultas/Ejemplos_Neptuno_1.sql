use neptuno;
 -- Comprobacion de tablas correctas
show tables;

-- #Mostrar todos los campos de la tabla CATEGORÍAS
 select  *  from neptuno.categorias;
 
 -- #Mostrar todos los países distintos de la tabla de CLIENTES
select distinct pais from neptuno.clientes;

-- #Mostrar el nombreProducto y precioUnidad de todos los PRODUCTOS cuyo precioUnidad sea superior a 100
 select productos.nombreProducto, productos.precioUnidad
 from neptuno.productos
 where productos.precioUnidad > 100 ;
 
--  #Mostrar el nombreProducto, precioUnidad y unidadesEnExistencia de todos los PRODUCTOS con precioUnidad comprendido entre 75 y 100
select nombreProducto,precioUnidad,unidadesEnExistencia
from productos
where precioUnidad between 75 and 100;

-- Mostrar el nombre, apellidos y fechaContratacion  de todos los EMPLEADOS contratados (FechaContratacion) antes del 01-02-1993
select nombre, apellidos, fechaContratacion
from empleados
where fechaContratacion < '1993-02-01';

-- Mostrar destinatario, fechaPedido y cargo de todos los PEDIDOS del segundo trimestre del año 1997
select neptuno.pedidos.Destinatario, neptuno.pedidos.fechaPedido, neptuno.pedidos.Cargo
from neptuno.pedidos
where neptuno.pedidos.fechaPedido between '1997-04-01' and '1997-06-30';

-- Mostrar todos los CLIENTES cuyo nombreCompañia comience por ‘A’

select *
from clientes
where nombreCompañia like 'a%';

-- Mostrar todos los CLIENTES cuyo nombreCompañia tenga una ‘A’ en  el segundo carácter

select *
from clientes
where nombreCompañia like '_a%';

-- Mostrar todos los CLIENTES cuyo nombreCompañia finalice con el texto “store”
select *
from neptuno.clientes
where neptuno.clientes.NombreCompañia like '%store';

-- Mostrar todos los CLIENTES cuyo nombreCompañia NO comience por ‘A’
select *
from neptuno.clientes
where neptuno.clientes.NombreCompañia  not like 'A%';

-- Mostrar todos los PRODUCTOS cuyo nombreProducto contenga el texto “chocolate” en cualquier parte del nombreProducto
select neptuno.productos.NombreProducto
from neptuno.productos
where neptuno.productos.NombreProducto like '%chocolate%';

-- Mostrar nombreproducto y preciounidad de todos los PRODUCTOS que se encuentren suspendidos.El valor del campo suspendido tiene que ser 
-- distinto de 0 (0 = FALSE).
select neptuno.productos.NombreProducto,neptuno.productos.PrecioUnidad,neptuno.productos.Suspendido
from neptuno.productos
where neptuno.productos.Suspendido != 0;

-- Mostrar nombrecompañia,ciudad, pais, fax de los CLIENTES de los cuales no tengamos su número de fax (el valor del campo fax sea nulo).
select neptuno.clientes.NombreCompañia, neptuno.clientes.Pais, neptuno.clientes.Fax
from neptuno.clientes
where neptuno.clientes.Fax is  null;

-- Mostrar los nombreCompañia, ciudad, region y pais de todos los PROVEESORES de los que conozcamos su región. 
select neptuno.proveedores.NombreCompañia, neptuno.proveedores.Ciudad, neptuno.proveedores.Region,neptuno.proveedores.Pais
from neptuno.proveedores
where neptuno.proveedores.Region is not null ;

-- Mostrar los nombreCompañia, ciudad, region y pais de todos los PROVEEDORES de Oviedo,Madrid o Berlín. 
select neptuno.proveedores.NombreCompañia, neptuno.proveedores.Ciudad,neptuno.proveedores.Region, neptuno.proveedores.Pais
from neptuno.proveedores
where neptuno.proveedores.Ciudad in( 'Oviedo' , 'Madrid' , 'Berlin');

-- Mostrar los nombreCompañia, ciudad y  codpostal de todos los CLIENTES cuyo código postal  tenga una longitud de 5 caracteres.
select neptuno.clientes.NombreCompañia, neptuno.clientes.Ciudad, neptuno.clientes.CodPostal
from neptuno.clientes
where  length(  neptuno.clientes.CodPostal)  = 5;

select neptuno.clientes.NombreCompañia, neptuno.clientes.Ciudad, neptuno.clientes.CodPostal
from neptuno.clientes
where neptuno.clientes.CodPostal like '_____';

-- Mostrar de la tabla de EMPLEADOS, el nombre, apellidos y cargo con el siguiente formato: Nombre Apellidos (Cargo)
select concat(neptuno.empleados.Nombre,' ', neptuno.empleados.Apellidos,'    ' ,' (', empleados.Cargo, ')') as 'Nombre Apellidos (Cargo)'
from neptuno.empleados
order by neptuno.empleados.Nombre asc;

-- Mostrar los nombreproducto, preciounidad y el nombreproducto reemplazando el texto ‘Queso’ por ‘CHEESE’
-- de todos los PRODUCTOS que contengan el texto ‘queso’  en cualquier parte del nombre.
select Replace(Replace(neptuno.productos.NombreProducto,'Queso','CHEESE'), 'queso', 'CHEESE') as  Nombre ,
       concat(format(neptuno.productos.PrecioUnidad, 2), ' €') as Precio 
from neptuno.productos
where neptuno.productos.NombreProducto like '%queso%'
order by neptuno.productos.NombreProducto asc ;
 
 -- Mostrar los precioUnidad de todos los PRODUCTOS aplicándoles todas las funciones de redondeo  (ROUND, FLOOR, CEIL). Mostrar únicamente los productos 
-- que tienen idCategoria con valor 1.
 select  round(neptuno.productos.PrecioUnidad, 2) as PrecioRedondeado
 from neptuno.productos
 where neptuno.productos.IdCategoria =1;
 
 select  floor(neptuno.productos.PrecioUnidad) as PrecioFloor
 from neptuno.productos
 where neptuno.productos.IdCategoria =1;
 
 select  ceil(neptuno.productos.PrecioUnidad) as PrecioCeil
 from neptuno.productos
 where neptuno.productos.IdCategoria =1;
 
  select  ceil(neptuno.productos.PrecioUnidad) as 'Precio Ceil',
          floor(neptuno.productos.PrecioUnidad) as 'Precio Floor',
          round(neptuno.productos.PrecioUnidad, 2) as 'Precio Redondeado '
 from neptuno.productos
 where neptuno.productos.IdCategoria =1;
 
 -- Mostrar de la tabla de  PEDIDOS: idcliente, idpedido, fechapedido, fechaenvio, fechaentrega, número de días transcurridos desde que se 
-- envió el pedido hasta que lo recibió el cliente y cargo del pedido de todos los pedidos cuyo idCliente sea ‘WELLI’.

select neptuno.pedidos.idcliente, neptuno.pedidos.IdPedido, neptuno.pedidos.FechaPedido,
       neptuno.pedidos.FechaEnvio, neptuno.pedidos.FechaEntrega,
       datediff( neptuno.pedidos.FechaEntrega,neptuno.pedidos.FechaEnvio) as 'Dias Trascurridos'
from neptuno.pedidos
where neptuno.pedidos.idcliente = 'WELLI';

select neptuno.pedidos.idcliente, neptuno.pedidos.IdPedido , 
	   date_format(neptuno.pedidos.FechaPedido,'%d-%m-%y') as 'Fecha Pedido',
       date_format(neptuno.pedidos.FechaEnvio,'%d-%m-%y' ) as 'Fecha Envio', 
       date_format(neptuno.pedidos.FechaEntrega,'%d-%m-%y' ) as 'Fecha Entrega', 
       datediff( neptuno.pedidos.FechaEntrega,neptuno.pedidos.FechaEnvio) as 'Dias Trascurridos'
from neptuno.pedidos
where neptuno.pedidos.idcliente = 'WELLI';

-- ¿Cuántos CLIENTES tenemos?
select count(distinct(neptuno.clientes.NombreContacto)) as 'Total Clientes'
from neptuno.clientes;

select count(neptuno.clientes.NombreContacto) as 'Total Clientes'
from neptuno.clientes;

select count(distinct(neptuno.clientes.Pais)) as 'Total Clientes'
from neptuno.clientes;



-- Mostrar el número de países diferentes que hay en la tabla de CLIENTES
select  distinct neptuno.clientes.Pais
from  neptuno.clientes;

-- #Mostrar  el cargo medio de los PEDIDOS realizados en el año 1996
select  round(avg(neptuno.pedidos.Cargo), 2) as 'Cargo Medio'
from neptuno.pedidos
where year(neptuno.pedidos.FechaPedido) = 1996;

-- -- #Mostrar  el cargo medio por años
select  round(avg(neptuno.pedidos.Cargo), 2) as 'Cargo Medio',
year(neptuno.pedidos.FechaPedido) as 'Año Fiscal'
from neptuno.pedidos
group by year(neptuno.pedidos.FechaPedido);

--  #Mostrar  el cargo medio de un año en concreto
select  round(avg(neptuno.pedidos.Cargo), 2) as 'Cargo Medio',
year(neptuno.pedidos.FechaPedido) as 'Año Fiscal'
from neptuno.pedidos
group by year(neptuno.pedidos.FechaPedido)
having `Año Fiscal`= 1996;

-- Calcular los precioUnidad: mínimo, máximo y medio de todos los productos
select neptuno.productos.NombreProducto,
       concat(round(max(neptuno.productos.PrecioUnidad), 2), ' €') as 'Precio Maximo' ,
       concat( round(min(neptuno.productos.PrecioUnidad), 2) , ' €') as 'Precio Minimo',
       concat(round(avg(neptuno.productos.PrecioUnidad), 2), ' €')  as 'Precio Medio'
from neptuno.productos
group by neptuno.productos.NombreProducto;

-- Calcular los precioUnidad: mínimo, máximo y medio de todos los categorias

select neptuno.productos.IdCategoria, neptuno.categorias.NombreCategoria,
       concat(round(max(neptuno.productos.PrecioUnidad), 2), ' €') as 'Precio Maximo' ,
       concat( round(min(neptuno.productos.PrecioUnidad), 2) , ' €') as 'Precio Minimo',
       concat(round(avg(neptuno.productos.PrecioUnidad), 2), ' €')  as 'Precio Medio'
from neptuno.productos inner join neptuno.categorias
on neptuno.productos.IdCategoria=neptuno.categorias.IdCategoria
group by neptuno.productos.IdCategoria
order by neptuno.productos.IdCategoria;


-- Calcular la suma de los cargos de todos los pedidos con fechaPedido  del año 1996.

select  concat(round(sum(neptuno.pedidos.Cargo), 2),' €') as 'Suma'
from neptuno.pedidos
where year(neptuno.pedidos.FechaPedido)= '1996' ;

-- -- Calcular la suma de los cargos de todos los pedidos con fechaPedido por años
select  concat(round(sum(neptuno.pedidos.Cargo), 2),' €') as 'Suma', year (neptuno.pedidos.FechaPedido) as 'Años'
from neptuno.pedidos
group by year(neptuno.pedidos.FechaPedido) ;

-- Queremos hacer un descuento del 25% en todos nuestros PROUCTOS. Mostrar el nombreproducto, el precioUnidad sin y con descuento

select	neptuno.productos.NombreProducto,
       concat(round(neptuno.productos.PrecioUnidad, 2 ), ' €') as 'Precio sin descuento', 
       concat(round(neptuno.productos.PrecioUnidad * 0.75, 2), ' €') as 'Precio con descuento'   
from neptuno.productos
order by neptuno.productos.NombreProducto asc;

-- Queremos ver en una consulta sobre la tabla de PEDIDOS: el idpedido, idcliente, idempleado, fechapedido, fechaentrega, 
-- número de días * transcurridos desde el pedido hasta la entrega del mismo al cliente, cargo del pedido, comisión del vendedor* (15%) 
-- y beneficio neto* (cargo-comisión= 85%). Solamente se contemplarán los pedidos con FechaPedido a partir del 1 de enero de 1997 y que se haya tardado menos de 
-- 30 días en entregar. 

 select  distinct neptuno.pedidos.IdPedido, neptuno.pedidos.IdCliente,
                  neptuno.pedidos.IdEmpleado,year(neptuno.pedidos.FechaPedido) as 'pedidos',
                  neptuno.pedidos.FechaPedido, neptuno.pedidos.FechaEntrega,
                  datediff( neptuno.pedidos.FechaEntrega, neptuno.pedidos.FechaPedido) as 'Dias Transcurridos', 
                  concat(format(neptuno.pedidos.cargo, 2) , ' €')as 'Cargo del Pedido',
                  concat(format((neptuno.pedidos.cargo * 0.15) ,2 ),' €') as 'Comision del vendedor',
                  concat(format((neptuno.pedidos.cargo * 0.85) ,2 ),' €') as 'Beneficio'
 from neptuno.pedidos
 where year(neptuno.pedidos.FechaPedido) >= '1997'  and  datediff( neptuno.pedidos.FechaEntrega, neptuno.pedidos.FechaPedido) < 30 ;


-- Se desea ver el nombreProducto, precioUnidad y unidadesEnExistencia de todos los PRODUCTOS ordenados descendentemente por el precioUnidad. 

select neptuno.productos.NombreProducto, concat(format(neptuno.productos.PrecioUnidad, 2),  '  €') as 'Precio Unidad',
       neptuno.productos.UnidadesEnExistencia
from neptuno.productos
order by neptuno.productos.PrecioUnidad  desc;

-- Se desea ver el nombreCompañia, Ciudad y Pais de todos los CLIENTES ordenados ascendentemente primero por el Pais, después por la Ciudad y por último por el nombreCompañia
select neptuno.clientes.Pais,neptuno.clientes.Ciudad, neptuno.clientes.NombreCompañia 
from neptuno.clientes
order by neptuno.clientes.Pais , neptuno.clientes.Ciudad , neptuno.clientes.nombreCompañia asc;

-- Se desea ver el nombreProducto, precioUnidad y unidadesEnExistencia de los 8 PRODUCTOS más caros. 

select neptuno.productos.NombreProducto, format(neptuno.productos.PrecioUnidad, 2) as 'Precio Unidad',
       neptuno.productos.UnidadesEnExistencia
from neptuno.productos
order by neptuno.productos.PrecioUnidad desc limit 8;

-- Se desea ver el nombreProducto, precioUnidad y  unidadesEnExistencia de los 6 productos siguientes al 4º producto más caro. 

select neptuno.productos.NombreProducto, format(neptuno.productos.PrecioUnidad, 2) as 'Precio Unidad', neptuno.productos.UnidadesEnExistencia
from neptuno.productos
order by neptuno.productos.PrecioUnidad desc limit 6 offset 4 ;

-- seleccionar todos los paises de los cliente agrupado por pais

select neptuno.clientes.Pais, count(neptuno.clientes.IdCliente) as 'Numero Clientes'
from neptuno.clientes
group by neptuno.clientes.Pais
order by neptuno.clientes.Pais  asc;

-- mostrar el número de clientes de los paisis que empiezan por A

select neptuno.clientes.Pais, count(neptuno.clientes.IdCliente) as 'Numero Clientes'
from neptuno.clientes
where neptuno.clientes.Pais like 'A%'
group by neptuno.clientes.Pais;

-- Mostrar el número de PEDIDOS realizados cada año. Recordad que existe una función llamada YEAR(fecha) que devuelve el año de una fecha. Agrupar utilizando esta función

select year(neptuno.pedidos.FechaPedido) AS 'Año',
     count(*) as 'Numero de Pedidos'
from neptuno.pedidos
group by year(neptuno.pedidos.FechaPedido);

-- Mostrar cuánto hemos vendido (Cargo de PEDIDOS)  agrupando los resultados por año y por PaisDestinatario de los pedidos.

select year (neptuno.pedidos.FechaPedido) AS 'Año',
             neptuno.pedidos.PaisDestinatario,
        concat(format(sum(neptuno.pedidos.Cargo), 2), ' €') AS 'Total Vendido'
from neptuno.pedidos
group by year(neptuno.pedidos.FechaPedido), neptuno.pedidos.PaisDestinatario
order by  year(neptuno.pedidos.FechaPedido),sum(neptuno.pedidos.Cargo) desc;

-- ejemplo subconsulta




-- Ver los datos de todos los empleados cuya fecha de contratación sea anterior a la fecha del primer pedido que ha recibido la empresa

select neptuno.empleados.Apellidos, neptuno.empleados.Nombre,neptuno.empleados.FechaContratacion,  MIN(neptuno.pedidos.FechaPedido) as 'Fecha Pedido'
from neptuno.empleados
inner join neptuno.pedidos
where neptuno.empleados.FechaContratacion < ( select MIN(neptuno.pedidos.FechaPedido)
                                              from neptuno.pedidos)
group by  neptuno.empleados.Apellidos,neptuno.empleados.Nombre,neptuno.empleados.FechaContratacion;

-- obtener cargo, fechapedido, fecha entrega de todos los pedidos realiados por nancy en 1997
select concat(neptuno.empleados.Nombre, ' ', neptuno.empleados.apellidos) as 'Nombre Completo',        
       neptuno.pedidos.FechaPedido, neptuno.pedidos.FechaEnvio, neptuno.pedidos.FechaEntrega
from neptuno.empleados
inner join neptuno.pedidos
on neptuno.empleados.IdEmpleado= neptuno.pedidos.IdEmpleado
where neptuno.empleados.Nombre = 'Nancy' and neptuno.empleados.Apellidos ='Davolio'  and year(neptuno.pedidos.FechaPedido) = '1997'
order by year(neptuno.pedidos.FechaPedido);


select  neptuno.clientes.NombreCompañia,neptuno.pedidos.Cargo, neptuno.pedidos.FechaPedido, neptuno.pedidos.FechaEntrega
from neptuno.pedidos
inner join neptuno.clientes
on neptuno.pedidos.IdCliente=neptuno.clientes.IdCliente
where neptuno.clientes.NombreCompañia like '%Antonio Moreno%' and year(neptuno.pedidos.FechaPedido) ='1998' ;

select neptuno.pedidos.IdPedido, neptuno.productos.NombreProducto
from neptuno.productos
inner join neptuno.detallespedidos
on neptuno.productos.IdProducto=neptuno.detallespedidos.IdProducto
inner join neptuno.pedidos
on neptuno.detallespedidos.IdPedido=neptuno.pedidos.IdPedido
where neptuno.pedidos.IdPedido= 10250;


