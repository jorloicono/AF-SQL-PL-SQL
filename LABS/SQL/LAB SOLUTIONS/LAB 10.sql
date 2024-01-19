-- TASK 1

CREATE TABLE dept
(id NUMBER(7)CONSTRAINT department_id_pk PRIMARY KEY,
name VARCHAR2(25));

-- TASK 2

CREATE TABLE emp
(id NUMBER(7),
last_name VARCHAR2(25),
first_name VARCHAR2(25),
dept_id NUMBER(7)
CONSTRAINT emp_dept_id_FK REFERENCES dept (id)
);

DESCRIBE emp

-- TASK 3

ALTER TABLE emp
ADD commission NUMBER(2,2);
DESCRIBE emp

-- TASK  4

ALTER TABLE emp
MODIFY (last_name VARCHAR2(50));
DESCRIBE emp

-- TASK 5

ALTER TABLE emp
DROP COLUMN first_name;
DESCRIBE emp

-- TASK 6

ALTER TABLE emp
SET UNUSED (dept_id);
DESCRIBE emp

-- TASK 7

ALTER TABLE emp
DROP UNUSED COLUMNS;

-- TASK 8

CREATE TABLE employees2 AS
SELECT employee_id id, first_name, last_name, salary,
department_id dept_id
FROM employees;
DESCRIBE employees2

-- TASK 9

ALTER TABLE employees2 READ ONLY;

-- TASK 10

ALTER TABLE employees2
ADD job_id VARCHAR2(9);

-- TASK 11

ALTER TABLE employees2 READ WRITE;
ALTER TABLE employees2
ADD job_id VARCHAR2(9);
DESCRIBE employees2

-- TASK 12

DROP TABLE emp;
DROP TABLE dept;
DROP TABLE employees2;
