use sakila;

-- 1.- Obtener la lista de clientes que han alquilado menos de 10 compras en el último mes, ordenados por la 
-- 	 cantidad de compras.
select customer.customer_id, concat(customer.first_name, '---', customer.last_name) as 'Clientes', count(rental.customer_id) as 'Numero de Peliculas' 
from customer  inner join  rental on customer.customer_id=  rental.customer_id
  where   rental.rental_date  BETWEEN '2005-05-15' AND '2005-05-31'
  group by customer.customer_id 
  having (count(customer.customer_id)>4);

-- 2.- Encontrar las 5 películas más populares según la cantidad de alquileres registrados.

-- 3.- Calcular el promedio de duración de las películas en cada categoría y mostrar las categorías ordenadas de 
-- 	 mayor a menor duración promedio.

-- 4.- Encontrar los actores que han aparecido en al menos 5 películas diferentes de una misma categoría.

-- 5.- Obtener la cantidad de clientes que alquilaron películas en cada año, ordenados de manera descendente.

-- 6.- Encontrar los clientes que han alquilado todas las películas disponibles en una categoría específica.

-- 7.- Calcular el total de ingresos generados por cada actor en base a las películas en las que ha participado.

-- 8.- Obtener la lista de películas que no han sido alquiladas en los últimos 3 meses.

-- 9.- Encontrar los actores que han trabajado con el mismo director en al menos 3 películas diferentes.

-- 10.- Calcular la duración promedio de las películas alquiladas por cada cliente y mostrar los clientes ordenados 
-- 	  de mayor a menor duración promedio.