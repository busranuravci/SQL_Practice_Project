
----------------------GROUP BY------------------------------------

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

--Find the total salary for every employee
select name, sum(salary) as totalSalary from workers
group by name
order by totalSalary desc;

--Find the number of employees per state in descending order by employee number
select state, count(state) as "number of employees" from workers
group by state
order by "number of employees" desc;

--Find the number of the employees whose salary is more than $2000 per company
select company, count(company) as "number of employees higher than $2000" from workers
where salary >2000
group  by company
order by "number of employees higher than $2000";

--Find the minimum and maximum salary for every company
select  company, min(salary) as minimumSalary, max(salary) as maximumSalary from workers
group by company;






