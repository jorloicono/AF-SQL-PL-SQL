-- Using the AVG and SUM Functions

SELECT AVG(salary), MAX(salary),
MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

-- Using the MIN and MAX Functions

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

-- Using the COUNT Function

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 50;

-- Using the DISTINCT Keyword

SELECT COUNT(DISTINCT department_id)
FROM employees;

-- Group Functions and Null Values

SELECT AVG(commission_pct)
FROM employees;
SELECT AVG(NVL(commission_pct, 0))
FROM employees; 

-- Using the GROUP BY Clause

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id ;

SELECT AVG(salary)
FROM employees
GROUP BY department_id ;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY AVG(salary);

-- Using the GROUP BY Clause on Multiple Columns

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

-- Illegal Queries Using Group Functions

SELECT department_id, COUNT(last_name)
FROM employees;

SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) > 8000
GROUP BY department_id;

-- Using the HAVING Clause

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary)>10000 ;

SELECT job_id, SUM(salary) PAYROLL
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary);

-- Nesting Group Functions

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

































