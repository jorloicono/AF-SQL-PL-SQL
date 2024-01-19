-- TASK 1

CREATE TABLE my_employee
(id NUMBER(4) CONSTRAINT my_employee_id_pk PRIMARY Key,
last_name VARCHAR2(25),
first_name VARCHAR2(25),
userid VARCHAR2(8),
salary NUMBER(9,2));

-- TASK 2

DESCRIBE my_employee

-- TASK 3

INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

-- TASK 4

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

-- TASK 5

SELECT *
FROM my_employee;

-- TASK 6

INSERT INTO my_employee
VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary);

-- TASK 7

INSERT INTO my_employee
VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary);

-- TASK 8

SELECT *
FROM my_employee;

-- TASK 9

COMMIT;

-- TASK 10

UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

-- TASK 11

UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

-- TASK 12

SELECT *
FROM my_employee;

-- TASK 13

DELETE
FROM my_employee
WHERE last_name = 'Dancs';

-- TASK 14

SELECT *
FROM my_employee;

-- TASK 15

COMMIT;
Control the data transaction to the MY_EMPLOYEE table.

-- TASK 16

INSERT INTO my_employee
VALUES (&p_id, '&p_last_name', '&p_first_name',
'&p_userid', &p_salary);

-- TASK 17. 
SELECT *
FROM my_employee;

-- TASK 18

SAVEPOINT step_17;

-- TASK 19

DELETE
FROM my_employee;

-- TASK 20

SELECT *
FROM my_employee;

-- TASK 21

ROLLBACK TO step_17;

-- TASK 22

SELECT *
FROM my_employee;

-- TASK 23

COMMIT;

-- TASK 24

SET ECHO OFF
SET VERIFY OFF
INSERT INTO my_employee
VALUES (&p_id, '&&p_last_name', '&&p_first_name',
lower(substr('&p_first_name', 1, 1) ||
substr('&p_last_name', 1, 7)), &p_salary);
SET VERIFY ON
SET ECHO ON
UNDEFINE p_first_name
UNDEFINE p_last_name

-- TASK 25

-- TASK 26

SELECT *
FROM my_employee
WHERE ID='6';