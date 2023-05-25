
------------------------------HAVING CLAUSE-------------------------------------
create table workers
(
id char(9),
name varchar(50),
state varchar(50),
salary smallint,
company varchar(20)
);


insert into workers values(123456789, 'John Walker', 'Florida', 2500, 'IBM');
insert into workers values(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
insert into workers values(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
insert into workers values(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
insert into workers values(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
insert into workers values(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
insert into workers values(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');


select * from workers;
drop table workers;


--Find the total salary if it is greater than 2500 for every employee
select name, sum(salary) as totalSalary from workers
group  by name
having sum(salary) > 2500;
-->After Group By, Where can NOT be used. We have to use HAVING to filter

--SELECT name, SUM(salary) AS total_salary
--FROM workers
--WHERE SUM(salary) > 2500  --> We can NOT use aggregate functions with WHERE clause.(SUM(), AVG(), MIN(), MAX(), COUNT)
--GROUP BY name;

--Find the number of employees if it is more than 1 per state
select state, count(state) from workers
group by state
having count(state) > 1;
-->HAVING is for filtering(if) for group by.
--After HAVING we have to use aggregate function. DO not use field names.

--Find the minimum salary if it is more than 2000 for every company
select company, min(salary) as minSalary from workers
group by company
having min(salary) >2000;

--Find the maximum salary if it is less than 3000 for every state
select state, max(salary) as maxSalary from workers
group by state
having max(salary) < 3000;






