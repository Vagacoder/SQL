-- SoloLearn, an Android app, a quick tutorial for fundamental SQL 
-- part I, Basic concepts

-- show all databases at current server
show databases;

-- select one database
use taldistributor;

-- show all tables from selected database
show tables;

-- show all columns from one specific table
show columns from Rep;

-- distinct and limit keywords
select distinct RepNum, LastName, FirstName, Street from Rep limit 3;
select RepNum, Street from Rep limit 5;

-- qualified full name of column
select Rep.City from Rep;

-- how to sort using order by
select City from Rep order by FirstName;

-- using "*" to select all columns
select * from Rep order by FirstName;