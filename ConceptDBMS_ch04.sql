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
create index cust_name_index on customers (cust_name);

alter table customers add unique cust_state_index(cust_state);

-- delete an index
drop index cust_state_index on customers;
drop index cust_name_index on customers;
alter table customers drop index cust_name_index;

-- Security
Grant select, insert, update on customers to jack;
revoke select, insert, update on customers from jack;

-- Integrity rules
-- -- Entity integrity
-- ---- primary key
-- -- Referential integrity
-- ---- foreign key
-- -- Legal-value integrity
-- ---- check

-- STRUCTURE CHANGE
-- view systables (all)
SELECT * FROM information_schema.tables;
-- view syscolumns (all)
SELECT * FROM information_schema.columns;
-- view specific columns
select column_name, column_key, data_type from information_schema.columns where table_name = 'customers';
-- view VIEWS (all)
select * from information_schema.views;

-- PROCEDURE
-- this is for mysql terminal, need switch delimiter before input procedure
delimiter //
-- input procedure
CREATE PROCEDURE dorepeat(p1 INT)
BEGIN
	SET @x = 0;
	REPEAT SET @x = @x + 1; UNTIL @x > p1 END REPEAT;
END
//
-- switch delimiter back to ';'
delimiter ;
-- call procedure
CALL dorepeat(1000);
-- check result
SELECT @x;


