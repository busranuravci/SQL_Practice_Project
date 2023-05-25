
create table employees
(
id char(9),
name varchar(50),
state varchar(50),
salary smallint,
company varchar(20)
);

insert into employees values(123456789, 'John Walker', 'Florida', 2500, 'IBM');
insert into employees values(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
insert into employees values(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
insert into employees values(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
insert into employees values(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
insert into employees values(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
insert into employees values(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');


create table companies
(
companyId char(9),
company varchar(20),
numberOfEmployees smallint
);

insert into companies values(100, 'IBM', 12000);
insert into companies values(101, 'GOOGLE', 18000);
insert into companies values(102, 'MICROSOFT', 10000);
insert into companies values(103, 'APPLE', 21000);

--Find the employee and company names whose company has more than 15000 employees
select name,company from employees
where company in(select company from companies where numberOfEmployees >15000);

--Find the company ids and company names which are in Florida
select companyId,company from companies
where company in (select company from employees where state = 'Florida');

--Find the employee name and state which has companies whose company ids are greater than 100

select name, state from employees
where company in(select company from companies where companyId > '100') ;

--Find the company name, number of employees and average salary for every company
select companies,company, companies.numberOfEmployees, avg(employees.salary)
as avgSalaryPerCompany from companies join employees
on employees.company = companies.company
group by companies.company, companies.numberOfEmployees;

--or we can do without using JOIN
select companies.company, companies.numberOfEmployees, avg(employees.salary) as avgSalaryPerCompany
from companies, employees where companies.company = employees.company
group by companies.company, companies.numberOfEmployees;

--Find the name of the companies, company ids, maximum and minimum salaries per company.
select company, companyId,
(select min(salary) from employees where employees.company = companies.company) as minSalaryPerCompany,
(select max(salary) from employees where employees.company = companies.company) as maxSalaryPerCompany,
from companies;










