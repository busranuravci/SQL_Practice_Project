-------------------------SELECT-REGEXP_LIKE---------------------------
/*
You can use Regular Expression with REGEXP_LIKE Condition
select-regexp_like
REGEXP_LIKE can be used for complicater patterns
'c' => means case-sensitive
'i' => means case-insensitive
in SQL as default, case-insensitive is active

syntax:
regexp_like(columnName, 'pattern[]', 'c')
*/

CREATE TABLE words (
    id INT UNIQUE,
    word VARCHAR(50) NOT NULL,
    numberOfLetter INT
);
    INSERT INTO words VALUES (1001, 'hater', 3);
    INSERT INTO words VALUES (1002, 'hat', 3);
    INSERT INTO words VALUES (1003, 'hit', 3);
    INSERT INTO words VALUES (1004, 'hbt', 3);
    INSERT INTO words VALUES (1005, 'hct', 3);
    INSERT INTO words VALUES (1006, 'adem', 4);
    INSERT INTO words VALUES (1007, 'selim', 5);
    INSERT INTO words VALUES (1008, 'yusuf', 5);
    INSERT INTO words VALUES (1009, 'hip', 3);
    INSERT INTO words VALUES (1010, 'HOT', 3);
    INSERT INTO words VALUES (1011, 'hush', 3);
    INSERT INTO words VALUES (1012, 'h9t', 3);
    INSERT INTO words VALUES (1013, 'hoot', 4);
    INSERT INTO words VALUES (1014, 'haaat', 5);
    INSERT INTO words VALUES (1015, 'hooooot', 5);

 select * from words;

--  #Q16=> list words containing the letters 'ot' or 'at', paying attention to case sensitivity
    select * from words where regexp_like(word, 'ot|at', 'c');
--  #we use " | " character for "or" in regexp_like expressions

--  #Q17=> list words containing the letters 'ot' or 'at', not paying attention to case sensitivity

 select * from words where regexp_like(word, 'ot|at', 'i');
 select * from words where regexp_like(word, 'ot|at');
--  #we don't have to use 'i' to catch case-insensitivity
--  #because SQL is already case-insensitive as default

--  #Q18=> list words starting with "ho" or "hi" , not paying attention to case sensitivity
 select * from words where regexp_like(word,'^ho|^hi');
--  # " ^ " character indicates the beginning
--  #that is "^a" ==> means the word starts with "a"

--  #Q19=> list three-letter-words start with 'h' and end with 'm', paying attention to case sensitivity
 select * from words where regexp_like(word, 'h[a-zA-Z-0-9]t','c');
--  #3 letter ==> 1st letter/[inside the brackets] 2nd letter/3rd letter

--  #Q20=> list three-letter-words start with "h", end with "t", its second letter is "a" or "i"
 select * from words where regexp_like(word,'^h[a|i]t');

--  #Q21=> list four-letter-words start with 'h' and end with 'm', paying attention to case sensitivity
 select * from words where regexp_like(word,'h[a-zA-Z-0-9][a-zA-Z-0-9]t','c');

--  #Q22=> list words ending with "t" or "m"
 select * from words where regexp_like(word, 't$|m$'); -- # or we can use 't$|m'

--  #Q23=> list words including "m","i" or "e"
 select * from words where regexp_like(word, 'm|i|e');
 select * from words where regexp_like(word, '[mie]');

--  #Q24=> list words start with "a" or "s"
 select * from words where regexp_like(word, '^a|^s');

--  #Q25=> list words including at least two "o"
 select * from words where regexp_like(word,'oo');

--   #Q26=> list words including at least four "o"
   select * from words where regexp_like(word,'oooo');

-- #Q27=> list five-letter-words starting with "s" or "b", 3rd letter is "l"
select * from words where regexp_like(word, '^s|^b_[l]__','c');


-----------------------------------------------------------------------

create table words
(
wordId char(10) unique,
word varchar(50) not null,
numberOfLetters smallint
);

insert into words values(1001, 'hot', 3);
insert into words values(1002, 'hat', 3);
insert into words values(1003, 'hit', 3);
insert into words values(1004, 'hbt', 3);
insert into words values(1008, 'hct', 3);
insert into words values(1005, 'sally', 4);
insert into words values(1006, 'selena', 6);
insert into words values(1007, 'kelly', 5);


--Select words whose first character is 'h', last character is 't' and second character is 'o', or 'a' or 'i'
/*
--if we solve with like condition it would be very long query
--in this case, we use regexp_like condition
--SELECT word
--FROM words
--WHERE word LIKE 'ho%t' OR word LIKE 'ha%t' OR word LIKE 'hi%t';
*/
 select word from words
 where regexp_like(word,'h[o|a|i](.*)t');

 --or use ~

select word from words
where word ~ 'h[o|a|i](.*)t';

--Select words whose first character is 'h',
--last character is 't' and second character is from 'a' to 'e'
select word from words
where ~ 'h[a-e]().*t'; --[a-e] ==> a,b,c,d,e

--Select words whose first character is 's' or 'a' or 'y'
select word from words
where regexp_like(word, '^[say](.*)');--> ^ means first character when you use it before the brackets.

--Select words whose last character is 'm' or 'a' or 'f'
select word from words
where regexp_like(word,'(.*)[maf]$');

--Select words which have 'a' in any position
select word from words
where ~ '(.*)a(.*)';

--or
select word from words
where ~ 'a';--> 'a' --> '(.*)a(.*)' ==> '%a%'

--Select words which have characters from 'd' to 't' at the beginning
--followed by any character then 'l'
select word from words
where ~ '^[d-t].l'; --> "." means one single character

--Select words which have characters from 'd' to 't' at the beginning
--followed by any 2 characters then 'e'
select word from words
where ~ '^[d-t]..e';

---------------------------------------------------------------

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

--Select employee names which do not start with 'E' and do not end with 'y'
--1st Way:
select name from workers
where name not like 'E%y';

--2nd Way:
select name from workers
where name ~ '^[^E](.*)[^y]$';
 --> If you use ^ inside the brackets it means 'NOT'/'Different From'

--Select states whose third character is 'o' or 'x'
select state from workers
where state ~ '..[0x]';

--Select states whose third character from the end is not 'n' or 'x'
select state from workers
where state ~ '[^n-x]..$';





