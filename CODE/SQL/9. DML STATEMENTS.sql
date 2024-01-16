-- Inserting New Rows

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (70, 'Public Relations', 100, 1700);

-- Inserting Rows with Null Values

INSERT INTO departments (department_id, department_name)
VALUES	(30, 'Purchasing');

INSERT INTO departments
VALUES	(100, 'Finance', NULL, NULL);

-- Inserting Special Values

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES	(113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);

-- Copying Rows from Another Table

INSERT INTO sales_reps(id, name, salary, commission_pct) SELECT employee_id, last_name, salary, commission_pct FROM	employees
WHERE job_id LIKE '%REP%';

-- Updating Rows in a Table

UPDATE employees
SET	department_id = 50 WHERE employee_id = 113;

-- Updating Two Columns with a Subquery

UPDATE employees

SET (job_id,salary) = (SELECT job_id, salary
FROM employees 
WHERE employee_id =205)
WHERE employee_id = 103;

-- Deleting Rows from a Table

DELETE FROM departments
WHERE department_name = 'Finance';

DELETE FROM copy_emp;

-- Deleting Rows Based on Another Table

DELETE FROM employees WHERE department_id IN
(SELECT department_id FROM	departments WHERE department_name
LIKE '%Public%');

-- TRUNCATE Statement

TRUNCATE TABLE copy_emp;

-- Committing Data

DELETE FROM EMPLOYEES
WHERE employee_id=113;

INSERT INTO departments
VALUES (290, 'Corporate Tax', NULL, 1700);
COMMIT;

-- State of the Data After ROLLBACK

DELETE FROM copy_emp; 
ROLLBACK ;

-- FOR UPDATE Clause in a SELECT Statement

SELECT employee_id, salary, commission_pct, job_id FROM employees
WHERE job_id = 'SA_REP' FOR UPDATE
ORDER BY employee_id;

SELECT e.employee_id, e.salary, e.commission_pct FROM employees e JOIN departments d
USING (department_id) WHERE job_id = 'ST_CLERK' AND location_id = 1500 FOR UPDATE
ORDER BY e.employee_id;



