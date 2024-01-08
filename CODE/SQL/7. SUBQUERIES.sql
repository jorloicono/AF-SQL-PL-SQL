-- Using a Subquery

SELECT last_name, salary
FROM employees
WHERE salary >
(SELECT salary
FROM employees
WHERE last_name = 'Abel');

-- Executing Single-Row Subqueries

SELECT last_name, job_id, salary
FROM employees
WHERE job_id =
(SELECT job_id
FROM employees
WHERE last_name = 'Taylor')
AND salary >
(SELECT salary
FROM employees
WHERE last_name = 'Taylor');

-- Using Group Functions in a Subquery

SELECT last_name, job_id, salary
FROM employees
WHERE salary =
(SELECT MIN(salary)
FROM employees);

-- HAVING Clause with Subqueries

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) >
(SELECT MIN(salary)
FROM employees
WHERE department_id = 50);

-- Multiple-Row Subqueries

SELECT last_name, salary, department_id
FROM employees
WHERE salary IN (2500, 4200, 4400, 6000, 7000, 8300,
8600, 17000);

-- Using the ANY Operator in Multiple-Row Subqueries

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- Using the ALL Operator in Multiple-Row Subqueries

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL
(SELECT salary
FROM employees
WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- Using the EXISTS Operator

SELECT employee_id,salary,last_name FROM employees M
WHERE EXISTS
(SELECT employee_id FROM employees W
WHERE (W.manager_id=M.employee_id) AND W.salary > 10000);

SELECT * FROM departments
WHERE NOT EXISTS
(SELECT * FROM employees
WHERE employees.department_id=departments.department_id);

-- Null Values in a Subquery

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
(SELECT mgr.manager_id
FROM employees mgr);



