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
-- people mentioned that this is one of inner join
select *  from customers, orders where customers.cust_id = orders.cust_id order by customers.cust_id desc;

-- types of joins
-- custome names for tables
select * from customers as ct, orders as od where ct.cust_id = od.cust_id;
-- 1 , inner join
-- 1.1, using select + where
select customers.cust_id, orders.cust_id, customers.cust_name, customers.cust_address, orders.order_date from customers, orders where customers.cust_id = orders.cust_id;
-- 1.2, using select + inner join + on/where
select customers.cust_id, orders.cust_id, customers.cust_name, customers.cust_address, orders.order_date from customers inner join orders where customers.cust_id = orders.cust_id;

-- 2, left outer join
select customers.cust_name, vendors.vend_name from customers left outer join vendors on customers.cust_name = vendors.vend_name; 

-- 3, right outer join
select customers.cust_name, vendors.vend_name from customers right outer join vendors on customers.cust_name = vendors.vend_name; 

-- set operation, union and unionall
select cust_name,  cust_id from customers union select vend_name, null from vendors;
select cust_id, cust_name from customers union select null, vend_name from vendors;

-- insert data to table
select * from customers;
-- insert a row (use NULL if some cell is missed)
insert into customers values (1000000010, 'Who knows', '110 State Street', 'Santa Fe', 'CA', 91010, 'USA', null,null);

-- insert data to a/some column(s)
insert into customers (cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country) 
values(1000000011, 'Impossible', '2310 Main Street', 'Houston', 'TX', 87110, 'USA');

-- update data
update customers set cust_contact = 'Kitty Song', cust_email = 'sales@whoknows.com' where cust_id = 1000000010;

-- delete data
delete from customers where cust_id = 1000000011;

-- create table
create table warehouse (
whouse_id	int(10),
whouse_address		char(100),
whouse_city		char(50),
whouse_state	char(50),
whouse_zip	int(5),
whouse_manager	char(50)
);
select * from warehouse;

-- using constraints and auto increment
create table warehouse1 (
whouse_id	int(10) primary key not null auto_increment,
whouse_address		char(100) not null,
whouse_city		char(50),
whouse_state	char(50),
whouse_zip	int(5),
whouse_manager	char(50) not null
);
select * from warehouse1;

-- add, delete and modify columns of table
alter table warehouse1 add information char(100);
alter table warehouse1 change information info int(10);
alter table warehouse1 drop column info;

-- delete and rename table
rename table warehouse1 to warehouseextra;
drop table warehouseextra;

-- view
-- create views
create view newV as select * from customers;
select * from newV order by cust_id desc;
-- update views
create or replace view newV as select cust_id, cust_name from customers;
select * from newV;
-- delete views
drop view newV;
