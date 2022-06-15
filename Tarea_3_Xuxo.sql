-- nombres y correos de Canadá
select cl."name", c.email 
from customer c 
join customer_list cl on c.customer_id  = cl.id 
where country = 'Canada';
-- mas rentas de adultos (son varios iguales porlo que hay que hacer querie sin asc o desc)
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
-- peliculas mas rentadas (se usa desc para encontrar el mayor numero de rentas limitados a 15)
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
-- revenue
select store, total_sales
from sales_by_store sbs ;
--
