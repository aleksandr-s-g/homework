drop view if exists prod_cat;
create view prod_cat as
select products.name as pname, catalogs.name as cname FROM products JOIN catalogs on products.catalog_id = catalogs.id ;
select * from prod_cat;
