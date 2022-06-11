with first_visit as (select customer_id,min(order_date) as first_visit_date from 
customer_orders 
group by 1
),
 visit_flg as (
select co.*,fv.first_visit_date,
case when co.order_date = fv.first_visit_date then 1 else 0 end as first_vist_flg,
case when co.order_date != fv.first_visit_date then 1 else 0 end as repeat_vist_flg
 from customer_orders co
inner join 
first_visit fv on co.customer_id = fv.customer_id 
), 
final_table as (
select order_date,First_vist_flg as new_customers, Repeat_vist_flg as repeat_customers,
case when First_vist_flg = 1 then order_amount else 0 end as reven_first_visit,
case when Repeat_vist_flg = 1 then order_amount else 0 end as reven_repeat_visit
from 
visit_flg )


select order_date,sum(new_customers),sum(repeat_customers),sum(reven_first_visit),sum(reven_repeat_visit) from final_table
group by 1 
