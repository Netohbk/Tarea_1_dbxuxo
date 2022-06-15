-- piden las deltas y usamos la funcion lead que se mencionó en una tarea anterior
-- pudimos usar el mismo proceso de quantify - lag(quantify) pero usamos lead() - quantify pues es lo mismo, solo
-- hay que tener cuidado de tener los datos correctos, si no tuvieramos en algun lado el siguiente pago, nos daria error
-- pues no hay de donde restar
with s as(
with s1 as(
select contact_name 
as nombre, quantity 
from order_details od 
join orders o using (order_id)
join customers c using (customer_id)
)
select nombre, lead(quantify) - quantify
over (partition by nombre) 
as deltas
from s1
)
select nombre, avg(deltas) as prome
from s 
group by nombre;