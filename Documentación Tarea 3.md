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

### 3. ¿Qué películas son las más rentadas en todas nuestras stores?

### 4. ¿Cuál es nuestro revenue por store?

