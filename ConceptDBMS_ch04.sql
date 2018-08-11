-- Concepts of DataBases Management 8th Edition 
-- Chapter 4 advanced topic

-- use tysql
use tysql;
show tables;
select * from customers;
select * from orders;

-- VIEW
-- create a view
create view newv1 as select customers.*, order_num, order_date from customers, orders 
where customers.cust_id = orders.cust_id;


-- any data in view will be updated automatically once original data is udated
-- check current data in view
select * from newv1 order by cust_id, order_num;

-- try update entries in both original tables
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('1000000015', 'ToyRus', '2121 State Street', 'Miami', 'FL', '77545', 'USA', 'Doug Johnson');
insert into orders (order_num, order_date, cust_id)
values (20010, '2013-01-01', 1000000015);

-- now check the view again, it is updated as well
-- newv1 has fewer columns than before
select * from newv1 order by cust_id, order_num;

-- update view ( changing fileds included in view)
create or replace view newv1 as select customers.cust_id, cust_name, cust_address, order_num from customers, orders
where customers.cust_id = orders.cust_id;

-- if you want to check a key which is not included in a view, you get an error
select cust_id, cust_name, cust_city from newv1 order by cust_id, order_num;
-- this is correct one (you cannot see cust_city column)
select cust_id, cust_name from newv1 order by cust_id, order_num;

-- delete a view
drop view newv1;


-- INDEXES
show index from customers;
show index from orders;

-- create an index on cust_id in the table of customers
select * from customers;
create index cust_id_index on customers (cust_id);
select cust_id_index, cust_name from customers;


-- delete an index
drop index customers.cust_id_index;


