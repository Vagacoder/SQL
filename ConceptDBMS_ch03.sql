-- Concepts of DataBases Management 8th Edition 
-- Chapter 3 SQL

-- use tysql
use tysql;
show tables;
select * from customers;
select * from orders;
select cust_id, cust_address, cust_zip from customers where cust_address = '200 Maple Lane';

-- built-in functions
select count(*), sum(cust_id) from customers where cust_id
 between 1000000001 and 1000000007;

-- grouping 
-- group by clause
-- please note error 1055, only full group
select  cust_id, count(order_num) 
	from orders group by cust_id;
-- having clause
select cust_id, count(order_num) 
	from orders group by cust_id having count(order_num) >1;
    
-- join table
-- 1. SELECT--FROM--WHERE col_from_t1 = col_from_t2

select customers.cust_id, cust_name, cust_contact, order_num, order_date 
from customers, orders 
where customers.cust_id = orders.cust_id
order by customers.cust_id;

