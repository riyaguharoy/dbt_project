{{
    config(
        materialized='view'
    )
}}

with customers as 
(select * from {{ref("stg_customers")}}),
--(select id as customer_id,first_name,last_name from RAW.JAFFLE_SHOP.customers),

orders as
(select * from {{ref("stg_orders")}}),
--(select id as order_id,user_id as customer_id,order_date,status from RAW.jaffle_shop.orders),

customer_orders as 
(select customer_id,
min(order_date) as first_order_date,
max(order_date) as most_recent_order_date,
count(order_id) as numbers_of_order
from orders group by 1),

final as 
(select 
customers.customer_id,
customers.first_name,
customers.last_name,
customer_orders.first_order_date,
customer_orders.most_recent_order_date,
coalesce(customer_orders.numbers_of_order,0) as number_of_orders
from customers left join customer_orders using (customer_id)
)
select * from final
