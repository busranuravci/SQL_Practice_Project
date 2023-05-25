--UPDATE THE EXISTING DATAS

CREATE TABLE students
(
    studentId SMALLINT PRIMARY KEY,
    studentName VARCHAR(50) UNIQUE,
    studentAge SMALLINT NOT NULL,
    studentDob DATE,
    CONSTRAINT studentAgeCheck CHECK(studentAge BETWEEN 15 AND 20), -- 15 and 20 are inclusive
    CONSTRAINT studentNameUpperCase CHECK(studentName = UPPER(studentName))
);


INSERT INTO students VALUES(100,'ALI CAN', 16, '2007-08-10');
INSERT INTO students VALUES(101, 'VELI HAN', 20, '2003-01-01');
INSERT INTO students VALUES(102, 'AYSE TAN', 15, '2008-02-29');
INSERT INTO students VALUES(103, 'JOHN DOE', 19, '2004-05-22');
INSERT INTO students VALUES(107, 'TOM JONNY', 18, '2005-05-22');
insert into students(studentName, studentAge, studentId) values('MARK TWAIN', 16, 104);
insert into students(studentName, studentAge, studentId) values('MARY STAR', 17, 105);
insert into students(studentAge,studentId) values (20,106);
insert into students(studentAge,studentId) values (20,108);

--how can we convert the date format
select date_format(studentDob,'%d-%b-%Y') from students;# it returns a temporary table

--converting by altering with modify clause
alter table students modify studentDob varchar(11);
update students
set studentDob = date_format(str_to_date(studentDob,'%Y-%m-%d'),'%d-%b-%Y');
--this code converted the date format to ==>'29-Feb-2008','22-May-2005','22-May-2004'



--How to Update existing data
update students
set studentName = 'LEO OCEAN' where studentId = 106;

--update the dob of Ali to 11-Dec-1997
update students set studentDob = '11-Dec-1997' where studentName = 'ALI CAN';

--How to update multiple cell
--Update the dob of 105 to 11-Apr-2006 and name to 'TOM HANKS'
update students
set studentName = 'TOM HANKS',
    studentDob = '11-Apr-2006'
where studentId =105;

--How to update multiple cell
--Update the dob of 105 to 11-Apr-2006 and name to 'TOM HANKS'
update students
set studentDob = '01-Aug-2021'
where studentId <104;

--Select maximum age from students table
select max(studentAge) from students;

--Select minimum age from students table
select min(studentAge) from students;

--Select average id from students table
select avg(studentAge) from students;

--Update all students' age to the maximum age
/*
#this way does not work
update students
set studentAge = (select max(studentAge) from students);
*/
/* we can do also like that
UPDATE students
SET studentAge = (
  SELECT maxAge
  FROM (
    SELECT MAX(studentAge) AS maxAge
    FROM students
  ) AS subquery
)
WHERE studentAge != (
  SELECT maxAge
  FROM (
    SELECT MAX(studentAge) AS maxAge
    FROM students
  ) AS subquery
);
*/

/*this set operation creates temporary table with subquery
UPDATE students
SET studentAge = (SELECT maxAge FROM (SELECT MAX(studentAge) AS maxAge FROM students)
AS subquery
);
*/

--This query will update all rows in the students table to have the maximum age
--without using a subquery.
UPDATE students
JOIN (SELECT MAX(studentAge) AS maxAge FROM students)
AS subquery
SET students.studentAge = subquery.maxAge;
/*
 This query works by joining the students table with a derived table that
 contains the maximum age,
 and then updating the studentAge column in the students table with the maximum age.
*/

--Update all students' age to the minimum age
UPDATE students
JOIN (SELECT min(studentAge) AS minAge FROM students)
AS subquery
SET students.studentAge = subquery.minAge;

/*
#we cannot update the table like that
#we have to create subquery just like the code above

update students
set studentAge = (select max(studentAge)from students) ;

*/

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
join (select min(workerSalary)*0.8 AS minSalary from workers)
as subquery
set workers.workerSalary = subquery.minSalary
where workerId = 102 ;

--Decrease the salary of Ali Can to 30 percent more than the lowest salary
update workers
join (select max(workerSalary)*1.3 as maxSalary from workers)
as subquery
set workers.workerSalary = subquery.maxSalary
where workerName = 'Ali Can';

--Increase the salaries by 1000 if the salaries are less then the average salary
/*
MySQL does not allow a table that is being updated
to be referenced in a subquery in the same statement.
This is to prevent potential conflicts that may arise
due to concurrent access to the same table.
To work around this issue, we can use a temporary table
or a derived table in our subquery.
*/
UPDATE workers
SET workerSalary = workerSalary + 1000
WHERE workerSalary < (SELECT AVG(salary)
FROM (SELECT workerSalary AS salary FROM workers) AS temp);

/*
UPDATE workers
SET workerSalary = workerSalary + 1000
WHERE workerSalary < (SELECT AVG(workerSalary) FROM workers);

--this code block does not work, because,
--MySQL does not allow a table that is being updated to be referenced in a subquery
in the same statement.
This is to prevent potential conflicts that
may arise due to concurrent access to the same table.
*/

--Make the salaries equal to the average salary
--if the salaries are less then the average salary
/*
UPDATE workers
SET workerSalary = (SELECT AVG(workerSalary) FROM workers)
WHERE workerSalary < (SELECT AVG(workerSalary) FROM workers);

--we cannot type like that because,when we try to update a table
and select from the same table in a subquery within the same statement.
--MySQL doesn't allow this to prevent unintended side effects such as infinite loops.
To fix this issue, we can use a derived table or a temporary table
to store the subquery result and then use it in the main query.
*/
UPDATE workers
SET workerSalary = (SELECT AVG_SALARY FROM (SELECT AVG(workerSalary) AS AVG_SALARY FROM workers) AS AVG_TABLE)
WHERE workerSalary < (SELECT AVG_SALARY FROM (SELECT AVG(workerSalary) AS AVG_SALARY FROM workers) AS AVG_TABLE);






drop table workers;
select * from workers;


















