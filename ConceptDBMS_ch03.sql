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
select order_num, order_date, count(order_num) 
	from orders group by cust_id;
-- having clause
select order_num, order_date, count(order_num) 
	from orders group by cust_id having count(order_num) >1;


    

