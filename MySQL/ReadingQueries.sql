


# creating table and inserting data into the table
create table students
(
id varchar(4),
name varchar(30),
age int
);

insert into students values ('1000','Marilyn Manson', 24);
insert into students values ('1000','Marliyn Monroe', 27);
insert into students values ('1000','Audrey Hepburn', 34);
insert into students values ('1000','Elvis Presley', 18);

# getting datas from table
select * from students;
select id from students;
select id,name from students;
drop table students;


/*
select-regexp_like
REGEXP_LIKE can be used for complicater patterns
'c' => means case-sensitive
'i' => means case-insensitive
in SQL as default, case-insensitive is active

syntax:
regexp_like(columnName, 'patern[]', 'c')
*/

CREATE TABLE words (
    id INT UNIQUE,
    word VARCHAR(50) NOT NULL,
    numberOfLetter INT
);
    INSERT INTO words VALUES (1001, 'hot', 3);
    INSERT INTO words VALUES (1002, 'hat', 3);
    INSERT INTO words VALUES (1003, 'hit', 3);
    INSERT INTO words VALUES (1004, 'hbt', 3);
    INSERT INTO words VALUES (1005, 'hct', 3);
    INSERT INTO words VALUES (1006, 'kelly', 4);
    INSERT INTO words VALUES (1007, 'sally', 5);
    INSERT INTO words VALUES (1008, 'jenny', 5);
    INSERT INTO words VALUES (1009, 'hip', 3);
    INSERT INTO words VALUES (1010, 'HOT', 3);
    INSERT INTO words VALUES (1011, 'hOt', 3);
    INSERT INTO words VALUES (1012, 'h9t', 3);
    INSERT INTO words VALUES (1013, 'hoot', 4);
    INSERT INTO words VALUES (1014, 'haaat', 5);
    INSERT INTO words VALUES (1015, 'hooooot', 5);

 select * from words;

 #Q16=> list words containing the letters 'ot' or 'at', paying attention to case sensitivity
 select * from words where regexp_like(word, 'ot|at', 'c');
 #we use " | " character for "or" in regexp_like expressions

 #Q17=> list words containing the letters 'ot' or 'at', not paying attention to case sensitivity

 select * from words where regexp_like(word, 'ot|at', 'i');
 select * from words where regexp_like(word, 'ot|at');
 #we don't have to use 'i' to catch case-insensitivity
 #because SQL is already case-insensitive as default

 #Q18=> list words starting with "ho" or "hi" , not paying attention to case sensitivity
 select * from words where regexp_like(word,'^ho|^hi');
 # " ^ " character indicates the beginning
 #that is "^a" ==> means the word starts with "a"

 #Q19=> list three-letter-words start with 'h' and end with 'm', paying attention to case sensitivity
 select * from words where regexp_like(word, 'h[a-zA-Z-0-9]t','c');
 #3 letter ==> 1st letter/[inside the brackets] 2nd letter/3rd letter

 #Q20=> list three-letter-words start with "h", end with "t", its second letter is "a" or "i"
 select * from words where regexp_like(word,'^h[a|i]t');

 #Q21=> list four-letter-words start with 'h' and end with 'm', paying attention to case sensitivity
 select * from words where regexp_like(word,'h[a-zA-Z-0-9][a-zA-Z-0-9]t','c');

 #Q22=> list words ending with "t" or "m"
 select * from words where regexp_like(word, 't$|m$'); # or wecan use 't$|m'

 #Q23=> list words including "m","i" or "e"
 select * from words where regexp_like(word, 'm|i|e');
 select * from words where regexp_like(word, '[mie]');

 #Q24=> list words start with "a" or "s"
 select * from words where regexp_like(word, '^a|^s');

 #Q25=> list words including at least two "o"
 select * from words where regexp_like(word,'oo');

  #Q26=> list words including at least four "o"
   select * from words where regexp_like(word,'oooo');

#Q27=> list five-letter-words starting with "s" or "b", 3rd letter is "l"
select * from words where regexp_like(word, '^s|^b_[l]__','c');





###############################################


#select - like
#like: it provides certain patterns when we do queries

/*
select column1, column2, ....
from tableName where columnName like pattern
for patterns
% => indicates 0 or more character
_ => indicates just single character
*/

 #Q9=> list personals whose name starts with "A"
 select * from personal where name like'A%'; #'1001', 'Ali Can', '70000'

#Q10=> list personals whose name ends with "N"
select * from personal where name like '%N';
/*'1001', 'Ali Can', '70000'
'1002', 'Canan Yaman', '85000'
'1003', 'Meltem Tan', '65000'
*/

#Q11=> list personals whose name's second letter is "E"
select * from personal where name like '_E%'; #'1003', 'Meltem Tan', '65000'

#Q12=> list personals whose name's second letter is "E" and its other letters have "N"
select * from personal where name like '_E%N'; # '1003', 'Meltem Tan', '65000'

#Q13=> list personals whose name has not "E"
select * from personal where name not like '%E%';
/*
'1001', 'Ali Can', '70000'
'1002', 'Canan Yaman', '85000'
*/

#Q14=> list personals whose salary is with six-digits
select * from personal where salary like '______';

#Q15=> list personals whose name's first letter is "C" and 7th letter is "Y"
select * from personal where name like 'C_____Y%'; # '1002', 'Canan Yaman', '85000'











