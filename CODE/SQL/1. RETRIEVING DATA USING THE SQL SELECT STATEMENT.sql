-- Selecting All Columns

SELECT *
FROM hr.departments;

-- Selecting Specific Columns

SELECT department_id, location_id
FROM hr.departments;

-- Using Arithmetic Operators

SELECT last_name, salary, salary + 300
FROM hr.employees;

-- Operator Precedence

SELECT last_name, salary, 12*salary+100
FROM hr.employees;

SELECT last_name, salary, 12*(salary+100)
FROM hr.employees;

-- Defining a Null Value

SELECT last_name, job_id, salary, commission_pct
FROM hr.employees;

-- Using Column Aliases

SELECT last_name AS name, commission_pct comm
FROM hr.employees;

SELECT last_name "Name" , salary*12 "Annual Salary"
FROM hr.employees;

-- Concatenation Operator

SELECT last_name||job_id AS "Employees"
FROM hr.employees;

-- Using Literal Character Strings

SELECT last_name ||' is a '||job_id
AS "Employee Details"
FROM hr.employees;

-- Duplicate Rows

SELECT department_id
FROM hr.employees;
SELECT DISTINCT department_id
FROM hr.employees;

-- Using the DESCRIBE Command

DESCRIBE hr.employees;
