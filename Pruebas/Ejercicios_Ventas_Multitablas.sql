use ventas;
show columns from cliente;

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

SELECT DISTINCT cli.id, cli.nombre, concat(ifnull(cli.apellido1, ' No Tiene'), '--', ifnull(cli.apellido2,'No Tiene'))as 'Apellidos'
 FROM  pedido  ped  JOIN cliente cli ON cli.id = ped.id_cliente
 ORDER BY cli.nombre ASC; 

-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT ped.*, cli.* 
FROM pedido ped INNER JOIN cliente cli ON ped.id_cliente = cli.id 
ORDER BY cli.nombre ASC;

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
-- El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT ped.id as 'Pedido', com.id as 'Id Comercial', com.nombre 
from pedido ped join comercial com on ped.id_comercial = com.id
ORDER BY com.nombre ASC;

-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados
--  a cada pedido.

SELECT cli.*, ped.*, com.* 
FROM cliente cli INNER JOIN pedido ped ON cli.id = ped.id_cliente 
INNER JOIN comercial com ON com.id = ped.id_comercial; 

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.


SELECT cli.*, ped.fecha 
FROM pedido ped INNER JOIN cliente cli ON ped.id_cliente = cli.id
 WHERE fecha LIKE '%2017%' AND total BETWEEN 300 AND 1000;

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT pedido.* 
FROM pedido 
WHERE id_cliente = (SELECT id 
                    FROM cliente 
                    WHERE nombre = 'Maria' AND apellido1 = 'Santana' AND apellido2 = 'Moreno');


-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

-- (II parte)
-- 1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los clientes que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.

-- 2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. 
-- Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

-- 3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

-- 4. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

