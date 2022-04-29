select * from products p limit 10;

# TE AMO MARGEL

select * from products p order by product_id desc limit 10;

select p.product_name, p.quantity_per_unit from products p ;

select p.product_name , p.product_id from products p ;

select p.product_name , p.product_id , p.discontinued 
from products p 
where p.discontinued = 1
;

select p.product_name , p.unit_price  
from products p 
order by p.unit_price desc limit 1;

select p.product_name , p.unit_price  , p.product_id -- aquí dejar el id al final ayuda a no confundirse con la columna de datos
from products p 
where p.unit_price < 20;

select p.product_name , p.unit_price , p.product_id 
from products p 
where p.unit_price >= 15 and p.unit_price <= 25;

select p.product_name , p.unit_price , p.product_id 
from products p 
where p.unit_price > (select avg(p2.unit_price) from products p2 ); -- colapsar porque simpificas en una variable

select count(*) 
from products p 
where p.discontinued = 1 and p.units_in_stock != 0;
--
-- Una manera para optimizar recursos o si tenemos otras tablas de referencia o JOIN
--
select count(p.supplier_id)
from products p; 

select p.product_name , p.units_in_stock , p.units_on_order
from products p 
where p.units_on_order > p.units_in_stock ;
--
select count(*) from orders o where shipped_date is not null;
--
-- elementos distintos
--
select distinct p.product_id ,p.product_name 
from categories c join products p using (category_id) 
join order_details od using (product_id)
join orders o using (order_id)
where shipped_date is not null 
and c.description ='Cheeses' ;
--
select count(*), p.product_name 
from categories c join products p using (category_id) 
join order_details od using (product_id)
join orders o using (order_id)
where shipped_date is not null 
and c.description ='Cheeses' 
group by p.product_name ;
--
-- Macths
--
select c.customer_id , o.order_id 
from orders o  
 join customers c on (o.customer_id =c.customer_id);
 --
select c.contact_name , c.city from customers c 
union
select p.quantity_per_unit  , p.product_name  from products p ;
--
select c.contact_name , c.city , s.contact_name ,s.city  from customers c 
full join suppliers s using(contact_name);
