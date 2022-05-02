-- Contributed by Fer Lango et al
select *
from payment p 
where (p.customer_id != 5
and p.amount > 8)
or p.payment_date between '2005-08-23 00:00:00' and '2005-08-23 23:59:59';
-- Contributed by Sara
select count(*)
from payment p
where p.customer_id = 5
and not p.amount > 6
and p.payment_date not between '2005-06-19 00:00:00' and '2005-06-19 23:59:59';
--
select p.payment_id , p.customer_id 
from payment p 
where p.amount = '1.98' or p.amount = '7.98' or p.amount = '9.98';
--
select *
from customer c 
where c.last_name like '_A%' and c.last_name like '%A%W';
--
select sum(p.amount ) 
from payment p join customer c using (customer_id)
where c.last_name like '_A%' and c.last_name like '%A%W';
--
select sum(p.amount)
from payment p
where p.customer_id = '358';
--
