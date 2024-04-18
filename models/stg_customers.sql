select id as customer_id,
first_name,last_name
--from RAW.JAFFLE_SHOP.customers
from {{source("jaffle_shop","customers")}}