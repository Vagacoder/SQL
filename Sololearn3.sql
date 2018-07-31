-- SoloLearn, an Android app, a quick tutorial for fundamental SQL 
-- part III, JOIN, table operations
-- use tysql
use tysql;
show tables;
select * from customers;
select * from orderitems;
select * from orders;
select * from products;
select * from vendors;

-- Joining tables
select *  from customers, orders where customers.cust_id = orders.cust_id order by customers.cust_id desc;


