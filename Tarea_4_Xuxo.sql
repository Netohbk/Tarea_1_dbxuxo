-- tiempo entre cada pago 
-- en esta ocasión se hace un anexo de algo no visto en clase para la realizacion de esta tarea pero que si viene en el repo
--18_window_functions que es la función lag
--se profundizó un poco en cómo hacer uso de lag (y lead) para evitar hacer más agrupaciones en la resta de fechas
-- la documentación de apoyo viene en el link, desconozco si fue bien realizado ya que  da resultados
-- en negativo y eso me provoca ruido, a pesar que hace algo de sentido, espero exponer mi duda en clase
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/lag-transact-sql?view=sql-server-ver16
-- https://www.sqlshack.com/es/como-usar-las-funciones-de-windows-en-sql-server/#:~:text=La%20funci%C3%B3n%20LAG%20permite%20acceder,la%20fecha%20de%20pedido%20anterior.
with s
as (
with s1
as (
select last_name || ' ' || first_name
as nombre, c.customer_id , p.payment_id, p.payment_date 
from payment p 
join customer c using (customer_id)
join rental r using ( rental_id))
select nombre, customer_id, payment_date - lag(payment_date)
over ( partition by nombre) 
as pagos from s1)
select nombre, avg(extract( day from pagos)) as promedio
from s
group by nombre
order by promedio;
-- distribución normal 
-- para este ejercicio la verdad se vieron algunos ejercicios en youtube para entender más la creación de histogramas
create view histog as (
with s
as (
with s1
as (
select last_name || ' ' || first_name 
as nombre, c.customer_id , p.payment_id, p.payment_date 
from payment p 
join customer c using (customer_id)
join rental r using ( rental_id))
select nombre, customer_id, payment_date - lag(payment_date)
over ( partition by nombre) 
as pagos from s1)
select nombre, avg(extract( day from pagos)) as promedio
from s
group by nombre
order by promedio);
--
select * from histog;
select count(*) as contados from histog;
-- existe la función width_bucket que guarda datos en pequños contenedores 
-- lo curioso o mejor dicho si tomamos un número menor de buckets parece que si es distribución normal
-- pero mientras crece ese número vemos que no es normal
-- pudimos usar cálculos de distribución normal pero quse ver si este recurso ayuda link de documentacion
--http://www.silota.com/docs/recipes/sql-histogram-summary-frequency-distribution.html
select width_bucket (promedio,-14,14,100) as bucket,
count(*) as contados
from histog
group by bucket
order by bucket;
-- nos piden la varianza y hay función así en sql
with s 
as (
with s1
as (
with s2
as (
select last_name || ' ' || first_name 
as nombre, c.customer_id , p.payment_id, p.payment_date 
from payment p 
join customer c using (customer_id)
join rental r using ( rental_id))
select nombre, customer_id, payment_date - lag(payment_date)
over ( partition by nombre) 
as pagos from s2)
select nombre, avg(extract( day from pagos)) as promedio
from s1
group by nombre
order by promedio)
select variance(promedio) as varianza, avg(promedio) as media from s;