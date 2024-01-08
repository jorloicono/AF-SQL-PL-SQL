-- Using the WHERE Clause

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90 ;

-- Character Strings and Dates

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen' ;

SELECT last_name
FROM employees
WHERE hire_date = '17-OCT-03' ;

-- Using Comparison Operators

SELECT last_name, salary
FROM employees
WHERE salary <= 3000 ;

-- Range Conditions Using the BETWEEN Operator

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500 ;

-- Membership Condition Using the IN Operator

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201) ;

-- Pattern Matching Using the LIKE Operator

SELECT first_name
FROM employees
WHERE first_name LIKE 'S%' ;

-- Using the NULL Conditions

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL ;

-- Using the AND Operator

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%' ;

-- Using the OR Operator

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%' ;

-- Using the NOT Operator

SELECT last_name, job_id
FROM employees
WHERE job_id
NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;

-- Rules of Precedence

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'
OR job_id = 'AD_PRES'
AND salary > 15000;

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'
OR job_id = 'AD_PRES')
AND salary > 15000;

-- Using the ORDER BY Clause

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- Sorting

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC ;

SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal ;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- SQL Row Limiting Clause Example

SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 5 ROWS ONLY;

SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- Using the Single-Ampersand Substitution Variable

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;

-- Character and Date Values with Substitution Variables

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title' ;

-- Specifying Column Names, Expressions, and Text

SELECT employee_id, last_name, job_id,&column_name
FROM employees
WHERE &condition
ORDER BY &order_column ;

-- Using the Double-Ampersand Substitution Variable

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name ;

-- Using the DEFINE Command

DEFINE employee_num = 200
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num ;
UNDEFINE employee_num

-- Using the VERIFY Command

SET VERIFY ON
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;