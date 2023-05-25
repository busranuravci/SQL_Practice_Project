

create table practice.workers
        (
        id SMALLINT,
        name VARCHAR(20),
        address VARCHAR(100),
        exam_grade SMALLINT,
        registration_date DATE
        );

        INSERT INTO practice.workers VALUES(120, 'Mary Jane', 'Miami', 70, '2023-02-11');
        INSERT INTO practice.workers VALUES('121', 'Brad Pitt', 'Beverley', 75, '2023-03-14');
        INSERT INTO practice.workers VALUES(122, 'Jenny Penny', 'Paris', 85, '2023-02-27');
        INSERT INTO practice.workers VALUES(123, 'Mary Star', 'Floransa', 95, '2023-09-12');
        INSERT INTO practice.workers VALUES(124, 'Terry Star', 'Berlin', 95, '2023-01-30');
        INSERT INTO practice.workers VALUES(125, 'Herry Star', 'NY', 95, '2023-07-24');
        INSERT INTO practice.workers VALUES(126, 'Sally Otar', 'Hamburg', 100, '2023-12-19');
        -- id, name, address, exam_grade, registration_date
        -- '127', 'Busra Nur Avcı', 'Ankara', '95', '2023-03-05'  added with JDBC

        -- id, name, address, exam_grade, registration_date
        -- '128', 'Hennry Cavill', 'London', '99', '2023-01-01' added with JDBC

        -- update practice.workers set exam_grade = 90 where id = 127;
        -- id, name, address, exam_grade, registration_date
        -- '127', 'Busra Nur Avcı', 'Ankara', '90', '2023-03-05' updated with JDBC

        -- update practice.workers set exam_grade = 80,address = 'Istanbul' where id = ?;
        --  id, name, address, exam_grade, registration_date
        -- '127', 'Busra Nur Avcı', 'Istanbul', '80', '2023-03-05'  updated with JDBC

        -- delete from workers where id = ?;
        -- id, name, address, exam_grade, registration_date
        -- '128', 'Hennry Cavill', 'London', '99', '2023-01-01'  --> is deleted with JDBC










        select * from practice.workers;