
--How to create table

--1. Way: Create table from scratch

create table students
(
    studentId smallint,
    studentName varchar(50),
    studentAge smallint,
    studentDob date
);

--2. Way: Create table by using another table
create table studentNameAge
as select studentName,studentAge from students;

select * from students;

---------------CONSTRAINTS------------------------

--While we create a table, we can put some "Constraints" for fields
--Constraints:
--a) Unique
--b) Not Null
--c) Primary Key
--d) Foreign Key
--e) Check Constraint

--There are 2 ways to create Primary Key

--1. Way to create Primary Key:

create table students
(
studentId smallint primary key,
--student_id field can not have duplicate and null value. Because it is primary key.
studentName varchar(50) not null,--student_name field can not have null value
studentAge smallint,
studentDob date unique  --student_dob fiels can not have dublicate value
);

--2. Way to create Primary Key
create table students
(
studentId smallint,
studentName varchar(50),
studentAge smallint,
studentDob date,

constraint studentId_pk primary key(studentId)
);

--How to add "Foreign Key" Constraint

create table parents
(
studentId smallint,
studentName varchar(50),
phoneNumber char(10),

constraint studentId_pk primary key(studentId)
);

create table students
(
studentId smallint,
studentName varchar(50),
studentAge smallint,
studentDob date,

constraint studentId_fk foreign key(studentId) references parents(studentId)
);

--How to add "Check" constraint

create table students
(
studentId smallint,
studentName varchar(50),
studentAge smallint,
studentDob date,

constraint studentAge_check check(studentAge between 15 and 20)
--15 and 20 are inclusive
constraint studentNameUpperCase check(studentName = upper(studentName))
);


##############################################################################






-----------------ALTER TABLE-----------------------
--1)The Alter Table statement is used to add, delete or modify columns in an existing table.
--2)The Alter Table statement is used to add and drop constraints in an existing table.


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


--1) We can add a column to an existing table
alter table workers
add companyIndustry varchar(20);

--2) How to add a field with default value
alter table workers
add workerAddress varchar(100) default 'Miami, FL, USA';

--3) How to add multiple fields into a table
alter table workers
add numberOfWorkers smallint default 0,
add nameOfCeo varchar(20);

--4)How to drop fields from a table
alter table workers
drop column nameOfCeo;

--5)How to rename a field/column
alter table workers
rename column companyIndustry to companyProfession;

--6)How to rename table
alter table workers
rename to employees;
drop table employees;

------------------------------------------------

--7)How to modify(Add constraints, change data type, change the size) a field
--Note: Be careful about the existing data when you add a constraint into a field.

--a) How to add constraint
--Add "NOT NULL" constraint to number_of_workers field
alter table employees
alter column numberOfWorkers set not null;

--Add "UNIQUE" constraint to company_profession field
alter table employees
add constraint companyProfessionUnique unique(companyProfession);
--Unique constraint can accept duplicated null!!

--Add "UNIQUE" constraint to worker_address field
alter table employees
add constraint workerAddressUnique unique(workerAddress);
--Unique constraint can not accept duplicated data.



--b) How to change data size/type of a field
--Note: Be careful about existing data size when you change the data size of a field

--Change the data type of the company_profession field to CHAR(5)

alter table employees
alter column companyProfession type char(5);

--Change the data type of the worker_address field to CHAR(5)

alter table employees
alter column workerAddress type char(5);
--value too long for type character(5)==>
--You can not decrease column length because some values are greater than 5 chars.

--Change the data type of the worker_address field to CHAR(30)
alter table employees
alter column workerAddress type char(30);

select * from employees;






































