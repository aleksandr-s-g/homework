#1

SELECT id, name from users where id IN 
(select distinct user_id from orders);

#2
select products.id, products.name, catalogs.name
from products join catalogs
on products.catalog_id = catalogs.id;
