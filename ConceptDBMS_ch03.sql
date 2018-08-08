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

-- union
-- union 1: city = 'Houston' with 2: customers who have order on orders table.
select cust_id, cust_name from customers where cust_city = 'Houston'
union
select customers.cust_id, cust_name from customers, orders
where customers.cust_id = orders.cust_id;

-- update a table 
insert into orders (order_num, order_date, cust_id)
values (20010, '2012-05-01', 1000000010 );

update orders set cust_id = 1000000011 where order_num = 20010;

delete from orders where order_num = 20010;

-- create table frmo a query
-- INTO clause does not work in MySQL
select * into ca_customers from customers where cust_state = 'CA' ;
-- try create table
create table ca_customers select * from customers where cust_state = 'CA';
select * from ca_customers;
select count(order_num) as cust_count from orders where cust_id = 1000000001;


