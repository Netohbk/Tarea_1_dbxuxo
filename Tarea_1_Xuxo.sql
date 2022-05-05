select s.contact_name 
from suppliers s  
where s.contact_title = 'Sales Representative';
--
select s.contact_name 
from suppliers s 
where s.contact_title != 'Marketing Manager';
--
-- En este caso podemos ir directo a las órdenes pues tienen una columna indicando de dónde provienen 
--las órdenes, de otra forma
-- usaríamos un join con la tabla de clientes para ligar la orden con el lugar de procedencia del cliente
select o.order_id , o.customer_id , o.employee_id , o.ship_country 
from orders o 
where o.ship_country != 'USA';
--
-- Ejemplo de usar join agregando información que puede ser de más utilidad, pues teniendo solo los id
-- de order y customer podríamos estar omitiendo detalles relevantes (¿De quién es la orden? 
-- ¿Qué significa BONAP? ¿con solo ver 11, 076 ubico detalles de la orden? )
select c.contact_name , o.order_id , o.customer_id 
from orders o join customers c using (customer_id) 
where o.ship_country != 'USA';
--
-- Esta pregunta fue contestada en clase
select distinct p.product_id ,p.product_name , c.description 
from categories c join products p using (category_id) 
join order_details od using (product_id)
join orders o using (order_id)
where shipped_date is not null 
and c.description ='Cheeses' ;
--
select c.contact_name 
from orders o join customers c using (customer_id)
where o.ship_country = 'France' or o.ship_country = 'Belgium';
--
-- Notar que si nos pidieran los clientes de las 96 órdenes tendríamos que usar un distinct
-- pues hay varias órdenes de provienen de un solo cliente
select distinct c.contact_name 
from orders o join customers c using (customer_id)
where o.ship_country = 'France' or o.ship_country = 'Belgium';
--
--Primero vemos todos los países a donde van las órdenes
select distinct o.ship_country 
from orders o;
--
select c.contact_name , c.country , o.ship_country 
from orders o join customers c using (customer_id)
where o.ship_country = 'Argentina' or o.ship_country = 'Venezuela' or o.ship_country = 'Mexico' or o.ship_country = 'Brazil';
--
select c.contact_name , c.country , o.ship_country 
from orders o join customers c using (customer_id)
where o.ship_country != 'Argentina' and  o.ship_country != 'Venezuela' and o.ship_country != 'Mexico' and o.ship_country != 'Brazil';
--
select concat(e.first_name, e.last_name)
from employees e ;
--
select sum(p.unit_price * p.units_in_stock)
from products p ;
--
select count (*), c.country  
from customers c 
group by c.country ;
--
select string_agg(c.category_name, ',')
from products p join categories c using (category_id)
group by c.category_name
