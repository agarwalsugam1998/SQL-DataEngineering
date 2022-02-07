select A.customer_id,sum(B.price) as amount  from (
(SELECT customer_id, product_id from dannys_diner.sales) as A 
inner join 
(SELECT product_id,price from dannys_diner.menu) as B 
on A.product_id = B.product_id) group by 1
