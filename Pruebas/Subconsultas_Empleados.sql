-- Con operadores básicos de comparación
-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
 select *
 from empleado
 where codigo_departamento = ( select codigo from departamento where nombre = 'Sistemas');
 
 -- Utilizando Inner Join
 
 select empleado.codigo_departamento, empleado.nif, empleado.nombre, departamento.nombre
 from empleado
 inner join departamento on empleado.codigo_departamento= departamento.codigo
 where departamento.nombre = 'sistemas';

-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
 select nombre, presupuesto as 'Mayor Presupuesto'
 from departamento
 where  presupuesto = ( select max(presupuesto) from departamento );

-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
 select nombre, presupuesto as 'Menor Presupuesto'
 from departamento
 where  presupuesto = ( select min(presupuesto) from departamento );


-- 3  Devuelve el nombre del departamento con menor gasto y la cantidad que tiene asignada

 select nombre, gastos as 'Menor Gasto'
 from departamento
 where  gastos = ( select min(gastos) from departamento );

-- Subconsultas con ALL y ANY
-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
select nombre, presupuesto    
FROM departamento
WHERE presupuesto >= All
  (SELECT   
    presupuesto  FROM departamento );
    
    select nombre, presupuesto    
FROM departamento
WHERE presupuesto >= Any
  (SELECT   
    presupuesto  FROM departamento where  presupuesto = 150000  );

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.

select nombre, presupuesto  as 'Menor Prosupuesto'  
FROM departamento
WHERE presupuesto <= All
  (SELECT   
    presupuesto  FROM departamento );
    
    
-- 5bis. Devuelve el nombre del departamento con menor gasto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.    
select nombre, gastos as 'Menor Gasto'
FROM departamento
WHERE gastos <= All
  (SELECT   
    gastos  FROM departamento );

-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).



-- 7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).

 -- Subconsultas con IN y NOT IN
-- 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

-- 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
      select nombre

-- Subconsultas con EXISTS y NOT EXISTS
-- 10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

-- 11. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).