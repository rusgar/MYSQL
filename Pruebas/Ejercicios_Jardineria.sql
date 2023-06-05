-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT CODIGO_OFICINA, CIUDAD
FROM OFICINA;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono
FROM oficina
WHERE pais = 'España';

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT NOMBRE, CONCAT_WS(' & ',APELLIDO1, APELLIDO2) AS APELLIDOS, EMAIL
FROM EMPLEADO
WHERE CODIGO_JEFE = 7;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT puesto, nombre,CONCAT_WS(' & ',APELLIDO1, APELLIDO2)as apellidos, email
FROM empleado
WHERE puesto ='Director general';


-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre, CONCAT_WS(' & ',APELLIDO1, APELLIDO2)as apellidos, puesto
FROM empleado
WHERE puesto <> 'Representante Ventas';
#WHERE puesto != 'Representante Ventas';

-- Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente
FROM cliente
WHERE pais = 'Spain';

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado
FROM pedido;

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
SELECT DISTINCT codigo_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;

-- Utilizando la función DATE_FORMAT de MySQL.
SELECT DISTINCT codigo_cliente, fecha_pago
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%m')=10;
#WHERE DATE_FORMAT(fecha_pago, '%Y)=2008;

-- Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT codigo_cliente, fecha_pago
FROM pago 
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

-- SELECT DISTINCT codigo_cliente
-- FROM pago 
-- where fecha_pago like '2008%';


-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, estado
FROM pedido
WHERE fecha_entrega > fecha_esperada and estado='rechazado';

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- Utilizando la función ADDDATE de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);

-- Utilizando la función DATEDIFF de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
where fecha_esperada >=  fecha_entrega + 2;
-- resta -?
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
 where fecha_esperada - fecha_entrega >=2;

-- Devuelve un listado con el codigo pedido, codigo de cliente y los dias de retraso o adelanto en la entrega respecto a la fecha esperada
 SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, datediff(fecha_entrega, fecha_esperada) as 'dias total', estado
FROM pedido
WHERE fecha_entrega is not null ;


-- Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT *
FROM pedido
WHERE estado ='Rechazado'and year(fecha_pedido)=2009;


-- Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT *
FROM pedido
WHERE estado ='Entregado'and month(fecha_pedido)=1;

-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT *
FROM pago
where forma_pago = 'PayPal'  and  year(fecha_pago)=2008 order by total desc ;

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT distinct forma_pago
FROM pago;

-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
select *
from producto
where  gama = 'Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;

-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
select *
from cliente
where  ciudad = 'Madrid' and  codigo_empleado_rep_ventas in (11,30);