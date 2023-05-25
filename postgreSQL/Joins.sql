
-----------------------JOINS-------------------------

create table myCompanies
(
companyId char(3),
companyName varchar(20)
);

insert into myCompanies values (100, 'IBM');
insert into myCompanies values (101, 'GOOGLE');
insert into myCompanies values (102, 'MICROSOFT');
insert into myCompanies values (103, 'APPLE');

select * from myCompanies;
drop table orders;
select * from orders;

create table orders
(
companyId char(3),
orderId char(3),
orderDate date
);

insert into orders values (101, 11, '17-Apr-2020');
insert into orders values (102, 22, '18-Apr-2020');
insert into orders values (103, 33, '19-Apr-2020');
insert into orders values (104, 44, '20-Apr-2020');
insert into orders values (105, 55, '21-Apr-2020');


--JOINS: 1) INNER JOIN: Returns common data
--		 2) LEFT JOIN: Returns all data from first table
--		 3) RIGHT JOIN: Returns all data from second table
--		 4) FULL JOIN: Returns all data from both table
--		 5) SELF JOIN: You will have a single table but you will use it as two tables



--1) INNER JOIN: Returns common data

--Select company name, order id, order date for common companies

select mc.companyName, o.orderId, o.orderDate
from myCompanies mc inner join orders o
on mc.companyId = o.companyId;


--2) LEFT JOIN: Returns all data from first table
--left join returns all the data of the left and the common data of the right
--so the join table can contain null values from the left table

--Get companyName, orderId and orderDate for the companies in myCompanies table
select mc.CompanyName,o.orderId,o.orderDate
from myCompanies mc left join orders o
on mc.companyId = o.companyId;


--3) RIGHT JOIN: Returns all data from second table
--right join returns all the data of the right and the common data of the left
--so the join table can contain null values from the right table

--Get company_name, order id and order date for the companies in orders table
--1. Way:
select mc.companyName,o.orderId,o.orderDate
from myCompanies mc right join orders o
on mc.companyId = o.companyId;
order by o.orderDate desc;

--2. Way:Right join is not used common,
-- use left join by taking 2nd table as first table.
select mc.companyName,o.orderId,o.orderDate
from orders o left join myCompanies mc
on o.companyId = mc.companyId
order by o.orderDate asc;


--4) FULL JOIN: Returns all data from both table

--Get company_name, order id and order date from both of the tables
select mc.companyname,o.orderId,o.orderDate
from orders o full join myCompanies mc
on mc.companyId = o.companyId;


-- 5) SELF JOIN: You will have a single table but you will use it as two tables
drop table workers;
select * from workers;
create table workers
(
id char(2),
name varchar(20),
title varchar(20),
managerId char(2)
);

insert into workers values (1, 'Ali Can', 'SDET', 2);
insert into workers values (2, 'John Walker', 'QA', 3);
insert into workers values (3, 'Angie Star', 'QA Lead', 4);
insert into workers values (4, 'Amy Sky', 'CEO', 5);

--Create a table which displays the manager of employees
select employee.name as employee, manager.name as manager
from workers employee inner join workers manager
on employee.managerId = manager.id




