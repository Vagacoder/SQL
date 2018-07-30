show tables;
show columns from Rep;
select distinct RepNum, LastName, FirstName, Street from Rep limit 3;
select RepNum, Street from Rep limit 5;
select Rep.City from Rep;
select City from Rep order by FirstName;
select * from Rep order by FirstName;