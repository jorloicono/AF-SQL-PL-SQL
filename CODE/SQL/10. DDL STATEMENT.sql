-- Creating Tables

CREATE TABLE dept
(deptno	NUMBER(2),
dname	VARCHAR2(14),
loc	VARCHAR2(13),
create_date DATE DEFAULT SYSDATE);

-- Defining Constraints

UPDATE employees
SET	department_id = 55 WHERE department_id = 110;

DELETE FROM departments WHERE department_id = 60;

-- Creating a Table Using a Subquery

CREATE TABLE dept80 AS
SELECT employee_id, last_name, salary*12 ANNSAL, hire_date
FROM	employees
WHERE	department_id = 80;

-- Adding a Column

ALTER TABLE dept80
ADD	(job_id VARCHAR2(9));

-- Modifying a Column

ALTER TABLE dept80
MODIFY (last_name VARCHAR2(30));

-- Dropping a Column

ALTER TABLE dept80
DROP (job_id);

-- Read-Only Tables

ALTER TABLE employees READ ONLY;

-- perform table maintenance and then
-- return table back to read/write mode

ALTER TABLE employees READ WRITE;

-- Dropping a Table

DROP TABLE dept80;


