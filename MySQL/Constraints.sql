###############CONSTRAINTS########################
/*
NOT NULL - Ensures that a column does not contain NULL values, i.e., it cannot be empty.
UNIQUE - Ensures that all values in a column are unique, i.e., there are no duplicates.
PRIMARY KEY - Ensures that a column does not contain NULL values and all values in the column are unique,
i.e., it combines the functionalities of NOT NULL and UNIQUE.
FOREIGN KEY - Used to reference a Primary Key in another table, creating a relationship between the tables.
This allows for operations to be performed on rows with the same ID value without directly
connecting the tables, thus creating a parent-child relationship.
*/

drop table workers;

create table workers
(
id char(5) primary key,
name varchar(50) unique,
salary int not null,
dateOfStartToWork date
);
select * from workers;

INSERT INTO workers VALUES('10002', 'Mehmet Yilmaz' ,12000, '2018-04-14');
INSERT INTO workers VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO workers VALUES('10010', null, 5000, '2018-04-14');
INSERT INTO workers VALUES('10020', null, 5000, '2018-04-14'); #unique keyword does not prevent two pr more null values
INSERT INTO workers VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO workers VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
#INSERT INTO workers VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); # salary cannot be null
INSERT INTO workers VALUES('10003', 'CAN', 5000, '2018-04-14');
#INSERT INTO workers VALUES('10007', 'CAN', 5000, '2018-04-14'); #unique
#INSERT INTO workers VALUES('10009', 'cem', '', '2018-04-14');#Incorrect integer value: '' for column 'salary' at row 1
#INSERT INTO workers VALUES('', 'osman', 2000, '2018-04-14');
#INSERT INTO workers VALUES('', 'osman can', 2000, '2018-04-14'); #Error Code: 1062. Duplicate entry '' for key 'workers.PRIMARY'
#INSERT INTO workers VALUES('', 'veli can', 6000, '2018-04-14'); #Error Code: 1062. Duplicate entry '' for key 'workers.PRIMARY'
#INSERT INTO workers VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); #Error Code: 1062. Duplicate entry '10002' for key 'workers.PRIMARY'
#INSERT INTO workers VALUES( null, 'filiz ' ,12000, '2018-04-14'); #Error Code: 1048. Column 'id' cannot be null

create table addresses
(
addressId char(5),
street varchar(50),
avenue varchar(50),
city varchar(15),
constraint idWorker foreign key(addressId) references workers(id)
#we linked the "addressId" column in the "addresses" table to the "id" column in the "workers" table
#with a foreign key named "idWorker"
#(you can check the names from the info above when the table is selected on the left)
);
select * from workers;
select * from addresses;
insert into addresses values('10003','Mutlu Sok', '40.Cad.','IST');
insert into addresses values('10003','Can Sok', '50.Cad.','Ankara');
insert into addresses values('10002','Aga Sok', '30.Cad.','Antep');

# we cannot add to the child table with an id that is not in the parent table
# insert into addresses values('10012','Ağa Sok', '30.Cad.','Antep');
# because there is not '10012' id in the workers table

#we can assign null value to the foreign key
insert into addresses values(null,'Ağa Sok', '30.Cad.','Antep');
insert into addresses values(null,'Ağa Sok', '30.Cad.','Maras');

select * from addresses;
select * from workers;

select * from workers, addresses where workers.id = addresses.addressId;
/*
# id	name	    salary	dateOfStartToWork	addressId	street	 avenue	    city
10003	CAN	        5000	2018-04-14	         10003	  Mutlu Sok	 40.Cad.	IST
10003	CAN  	    5000	2018-04-14	         10003	  Can Sok	 50.Cad.	Ankara
10002 Mehmet Yılmaz	12000	2018-04-14	         10002	  Ağa Sok	 30.Cad.	Antep
*/

#we cannot remove the workers table, because we linked it with foreign key in addresses table
#constraint idWorker foreign key(addressId) references workers(id)
#so in the linked tables, the parent table cannot be deleted without deleting the child table
#drop table workers; ==> it does not work

delete from workers where id = '10002';
delete from addresses where addressId = '10002';

###################################################

#          ON DELETE CASCADE
/*
ON DELETE CASCADE instead of deleting the data in the child table first each time,
We can activate the delete feature.
For this, it is sufficient to write the ON DELETE CASCADE command at the end of the FK line.

*/

drop table students;
create table students
(
id char(3)primary key,
name varchar(50),
parentName varchar(50),
examGrade int
);

insert into students values (123, 'Ali Can', 'Hasan',75);
insert into students values (124, 'Merve Gul', 'Ayse',85);
insert into students values (125, 'Kemal Yasa', 'Hasan',85);
insert into students values (126, 'Nesibe Yılmaz', 'Ayse',95);
insert into students values (127, 'Mustafa Bak', 'Can',99);

select * from students;

create table examGrades
(
studentId char(3),
LessonName varchar(30),
parentName varchar(50),
examGrade int,
constraint examGradesFK foreign key (studentId) references students(id)
on delete cascade
);

insert into examGrades values(123, 'Ali Can', 'Hasan',75);
insert into examGrades values(124, 'Merve Gul', 'Ayse',85);
insert into examGrades values(125, 'Kemal Yasa', 'Hasan',85);
insert into examGrades values(126, 'Nesibe Yılmaz', 'Ayse',95);
insert into examGrades values(127, 'Mustafa Bak', 'Can',99);

drop table examGrades;
select * from examGrades;
select * from students;

/*
To pull all data from tables joined with FK
It is necessary to perform a JOIN operation.
*/
select * from students, examGrades where students.id = examGrades.studentId;

delete from examGrades where studentId = '123';# -->examGrade of child class
#When we delete the data in the child table, only the data in the child is deleted.
#The data in the parent is not deleted.
#parent table ==> students table
#child table ==> examGrades table
/*
foreign key constraint is in child table
constraint examGradesFK foreign key (studentId) references students(id)
on delete cascade
*/

#When we delete the data in the parent table, the data in the child is also deleted.
delete from students where id= '126';


##################################################################
drop table students;
CREATE TABLE students
(
    studentId SMALLINT PRIMARY KEY,
    studentName VARCHAR(50) UNIQUE,
    studentAge SMALLINT NOT NULL,
    studentDob DATE,
    CONSTRAINT studentAgeCheck CHECK(studentAge BETWEEN 15 AND 20), # 15 and 20 are inclusive
    CONSTRAINT studentNameUpperCase CHECK(studentName = UPPER(studentName))
);


INSERT INTO students VALUES(100,'ALI CAN', 16, '2007-08-10');
INSERT INTO students VALUES(101, 'VELI HAN', 20, '2003-01-01');

#For integer we do not use single quotes, but if you use it will work as well
INSERT INTO students VALUES(102, 'AYSE TAN', 15, '2008-02-29');

#For varchar and date we have to use single quotes
INSERT INTO students VALUES(103, 'JOHN DOE', 19, '2004-05-22');
INSERT INTO students VALUES(107, 'TOM JONNY', 18, '2005-05-22');

# second way to insert data for specific fiels

insert into students(studentName, studentAge, studentId) values('MARK TWAIN', 16, 104);
insert into students(studentName, studentAge, studentId) values('MARY STAR', 17, 105);
insert into students(studentAge,studentId) values (20,106);
#UNIQUE constraint can not have duplicate values but it can have duplicate 'null'
insert into students(studentAge,studentId) values (20,108);



