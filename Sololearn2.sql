-- SoloLearn, an Android app, a quick tutorial for fundamental SQL 
-- part II, Filtering, function and subqueries
-- use tysql
use tysql;
show tables;

-- WHERE clause 
show columns from customers;

select * from customers;

select * from customers where cust_state = 'MI';
select * from customers where cust_zip = 44444;

-- SQL operators
select * from customers where cust_zip != 44444;
select * from customers where cust_zip >= 44444;
-- notice: between syntax: between n1 and n2, both n1 and n2 are inclusive
select * from customers where cust_zip between 42222 and 88888;
-- string inside single quotation
select * from customers where cust_name = 'Fun4All';

select * from orders where order_num between 20007 and 20010;

-- Logical operators (boolean operator, and, or, not,)
select * from orders where order_num = 20007 and order_num = 20009;
select * from orders where order_num = 20007 or order_num = 20009;

-- IN operator (one of logical operators)
select * from orders where order_num = 20005 or order_num = 20007 or order_num = 20009;
select * from orders where order_num in (20005, 20007, 20009);

-- NOT IN operator
select * from orders where order_num not in (20005, 20007, 20009);

-- CONCAT function
select concat(cust_name, ', ', cust_city) from customers;

-- AS keyword
select concat(cust_name, ', ', cust_city) as new_col from customers;

-- arithmetic operator
show columns from orderitems;
select * from orderitems;
select item_price from orderitems;
select order_num, order_item, item_price + 100 as quoted_price from orderitems;

-- UPPPER() and LOWER()
select cust_name from customers;
select upper(cust_name) as VIP_name from customers;

-- sqrt(), avg(), min() and sum()
select order_num, order_item, sqrt(item_price) from orderitems;
select avg(item_price) from orderitems;
select sum(item_price) from orderitems;
select min(item_price) from orderitems;
select max(item_price) from orderitems;

-- Subqueries
-- e.g. 1 first way 
select avg(item_price) from orderitems;
select * from orderitems where item_price > 5.74 order by item_price desc;
-- e.g. 2 using subqueries
select * from orderitems where item_price > (select avg(item_price) from orderitems) order by item_price desc;
-- Note1: subq enclosed in parenthese
-- Note2: there is no ";" after subq

-- LIKE operator
-- there are 2 wildcards for LIKE: %: 0-any char; _: single char
select cust_name from customers;
select * from customers where cust_name LIKE 'V%';
select * from customers where cust_name LIKE '%a%';
select * from customers where cust_name LIKE '_i%';

