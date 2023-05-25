----------------DELETE-----------------
create table people
(
ssn int,
name varchar(50),
address varchar(80)
);
insert into people values(123456789, 'Mark Star', 'Florida');
insert into people values(234567890, 'Angie Way', 'Virginia');
insert into people values(345678901, 'Maryy Tien', 'New Jersey');
insert into people (ssn, address) values (456789012, 'Michigan');
insert into people (ssn, address) values(567890123, 'California');
insert into people (ssn, name) values(567890123, 'California');

--How to Delete record from a table
--Delete 'Angie Way' record from table

delete from people
where name = 'Angie Way';

--Delete records which do not have name
delete from people
where name = 'Name will be inserted later';

--Delete all records

delete from people;
--Delete command deletes just records but does not drop(delete) table

--Delete all records whose name is null or address is null
delete from people
where name is null or address is null;

--Delete all records whose SSN is greater than 123456789 and less than 345678901
delete from people
where ssn > 123456789 and ssn <345678901;

--Delete all records whose name is not null
delete from people
where name is not null;

--Delete all records with TRUNCATE
truncate table people;
--Truncate can not be used with 'where' so it deletes all records.
--If you delete records with Truncate you can not roll them back.

--Drop Table
drop table people;
drop table workers;

-------------------------------------------------------------------------

create table students
(
id smallint,
name varchar(20),
address varchar(100),
examGrade smallint,
registrationDate date
);


insert into students values(120, 'Ali Can', 'Ankara', 70, '11.Feb.2023');
insert into students values('121', 'Veli Han', 'Trabzon', 75, '11.02.2022');
insert into students values(122, 'Ayşe Tan', 'Bursa', 85, '11.Aug.2021');
insert into students values(123, 'Mary Star', 'İstanbul', 95, 'Jan.1.2020');
insert into students values(124, 'Terry Star', 'Ankara', 95, '1.Sep.19');
insert into students values(125, 'Herry Star', 'Antalya', 95, '1.2.18');
insert into students values(126, 'Sally Otar', 'İzmir', 100, '30.6.17');

--Delete the record whose address is 'Antalya'
delete from students
where address = 'Antalya';

--Delete the lines (record/row) whose names are 'Ali Can', 'Veli Han' and 'Sally Otar'.
delete from students
where name in('Ali Can','Veli Han','Sally Otar');

-- Delete the first and last created records
delete from students
where registrationDate in((select min(registrationDate)from students),select max(registrationDate) from students);


--Delete all rows whose ids are greater than 122
delete from students
where id >122;

--Delete all records
delete from students;

--or TRUNCATE
truncate students;

--Drop the table
drop table students;





select * from people;


#################################################################

create table students
(
    studentId smallint primary key,
    studentName varchar(50) unique,
	studentAge smallint not null,
	studentDob date

	constraint studentAge_check check(studentAge between 15 and 20)
	--15 and 20 are inclusive
	constraint studentNameUpperCase check(studentName = upper(studentName))
);

--1. way: insert data for all fields

insert into students values(100,'ALI CAN', 16, '10-Aug-2007');
insert into students values('101', 'VELI HAN', 20, '01-Jan-2003');

--For integer we do not use single quotes but if you use it will work as well
insert into students values(102, 'AYSE TAN', 15, '29-Feb-2008');

--For varchar and date we have to use single quotes
insert into students values(103, 'JOHN DOE', 19, '22-05-2004');
insert into students values(107, 'TOM JONNY', 18, '22-05-2005');

--2. Way: How to insert data for specific field

insert into students(studentName,studentage,studentid) values('MARK TWAIN', 16, 104);
insert into students(studentName,studentage,studentid) values('MARY STAR', 17, 105);
insert into students(studentage,studentid) values(20,106);
--UNIQUE constraint can not have duplicate values but it can have duplicate 'null'
insert into students(studentage,studentid)values(20,108);

--how to update existing data
update students
set studentName = 'LEO OCEAN'
where studentId = 106;

--Update the dob of Ali to 11-Dec-1997
update students
set studentDob = '11-Dec-1997'
where studentName = 'ALI CAN';

--How to update multiple cell
--Update the dob of 105 to 11-Apr-2006 and name to 'TOM HANKS'
update students
set studentDob = '11-Apr-2006',
StudentName = 'TOM HANKS'
where studentId = 105;

--How to update multiple records(rows)
--Make the dob of all students 01-Aug-2021 if their ids are less than 104

update students
set studentDob = '01-Aug-2021'
where studentId < 104;

--Select maximum age from students table
select max(studentAge) from students;


--Select minimum age from students table
select min(studentAge) from students;

--Select average id from students table
select avg(studentAge) from students;

--Update all students's age to the maximum age
update students
set studentAge = (select max(studentAge) from students);

--Update all students' dob to the minimum dob

update students
set studentDob = (select min(studentDob) from students);


-----------------------------------------------------------------------

--Create workers table whose fields are worker_id, worker_name, worker_salary.
--worker_id will have primary key with the name worker_id_pk
--Insert 4 records into the workers table
--See the table on the console


create table workers
(
workerId smallint,
workerName varchar(50),
workerSalary smallint,
constraint workerId_pk primary key(workerId)
);

insert into workers values(101, 'Ali Can', 10000);
insert into workers values(102, 'Veli Han', 2000);
insert into workers values(103, 'Ayse Kan', 7000);
insert into workers values(104, 'Angie Ocean', 8500);

--Increase the salary of Veli Han to 20 percent less than the highest salary
update workers
set workerSalary = (select max(workerSalary) * 0.8 from workers)
where workerName = 'Veli Han';

--Decrease the salary of Ali Can to 30 percent more than the lowest salary
update workers
set workerSalary = (select min(workerSalary) * 1.3 from workers)
where workerName = 'Ali Can';

--Increase the salaries by 1000 if the salaries are less then the average salary
update workers
set workerSalary = workerSalary + 1000
where workerSalary < (select avg(workerSalary) from workers);

-----------------------------------------
--IS NULL

create table people
(
ssn int,
name varchar(50),
address varchar(80)
);
insert into people values(123456789, 'Mark Star', 'Florida');
insert into people values(234567890, 'Angie Way', 'Virginia');
insert into people values(345678901, 'Maryy Tien', 'New Jersey');
insert into people (ssn, address) values (456789012, 'Michigan');
insert into people (ssn, address) values(567890123, 'California');
insert into people (ssn, name) values(567890123, 'California');

--Change null names to "Name will be inserted later"
update people
set name = 'Name will be inserted later'
where name is null;

--Change null addresses to "Address will be inserted later"
update people
set address = 'Address will be inserted later'
where address is null;







select * from people;
drop table students, workers;


#######################################################


create table students
(
    studentId smallint primary key,
    studentName varchar(50) unique,
	studentAge smallint not null,
	studentDob date

	constraint studentAge_check check(studentAge between 15 and 20)
	--15 and 20 are inclusive
	constraint studentNameUpperCase check(studentName = upper(studentName))
);

--1. way: insert data for all fields

insert into students values(100,'ALI CAN', 16, '10-Aug-2007');
insert into students values('101', 'VELI HAN', 20, '01-Jan-2003');

--For integer we do not use single quotes but if you use it will work as well
insert into students values(102, 'AYSE TAN', 15, '29-Feb-2008');

--For varchar and date we have to use single quotes
insert into students values(103, 'JOHN DOE', 19, '22-05-2004');
insert into students values(107, 'TOM JONNY', 18, '22-05-2005');

--2. Way: How to insert data for specific field

insert into students(studentName,studentage,studentid) values('MARK TWAIN', 16, 104);
insert into students(studentName,studentage,studentid) values('MARY STAR', 17, 105);
insert into students(studentage,studentid) values(20,106);
--UNIQUE constraint can not have duplicate values but it can have duplicate 'null'
insert into students(studentage,studentid)values(20,108);








