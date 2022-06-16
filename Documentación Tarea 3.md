# TAREA 3 
En esta tarea se trabaja con queries de agrupaciones que contengan 
esencialmente join y group by

### 1. ¿Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña? 

Se usa un join donde los valores coinciden ya que customer_id y id no están en ambas tablas pero están relacionados 

 ~~~
select cl."name", c.email 
from customer c 
join customer_list cl on c.customer_id  = cl.id 
where country = 'Canada';
~~~

### 2. ¿Qué cliente ha rentado más de nuestra sección de adultos?



 ~~~~
select *  from (
select nombre, count(rental_id)
as cant 
from (
select c.last_name  
as nombre, rental_id, rating, film_id 
from customer c
join store s using (store_id)
join inventory i using (store_id)
join rental r using (inventory_id)
join film f using (film_id)
where rating = 'NC-17')
as tabla1
group by nombre)
as tabla2
where cant = (
select max(cant)
from (
select nombre, count(rental_id)
as cant
from (
select c.last_name  
as nombre, rental_id, rating, film_id 
from customer c
join store s using (store_id)
join inventory i using (store_id)
join rental r using (inventory_id)
join film f using (film_id)
where rating = 'NC-17')
as tabla3
group by nombre)
as cant1);
~~~~


### 3. ¿Qué películas son las más rentadas en todas nuestras stores?

 ~~~~
select title, rentas 
from (
select film_id, count(rental_id)
as rentas 
from rental r 
join inventory i using (inventory_id)
join film f using (film_id)
group by film_id)
as tabla1
join film f2 using (film_id)
order by rentas desc
limit 15;
~~~~

### 4. ¿Cuál es nuestro revenue por store?

 ~~~
 select store, total_sales
from sales_by_store sbs ;
~~~

