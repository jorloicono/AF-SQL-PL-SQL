-- TASK 1

SELECT *
FROM employees
WHERE job_id = 'ST_CLERK'
AND hire_date > '31-DEC-1997';

-- TASK 2

SELECT last_name, job_id, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;

-- TASK 3

SELECT 'The salary of '||last_name||' after a 10% raise is '
|| ROUND(salary*1.10) "New salary"
FROM employees
WHERE commission_pct IS NULL;

-- TASK 4

SELECT last_name,
TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) YEARS,
TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, hire_date), 12))
MONTHS
FROM employees
ORDER BY years DESC, MONTHS desc;

-- TASK 5

SELECT last_name
FROM employees
WHERE SUBSTR(last_name, 1,1) IN ('J', 'K', 'L', 'M');

-- TASK 6

SELECT last_name, salary,
decode(commission_pct, NULL, 'No', 'Yes') commission
FROM employees;

-- TASK 7

SELECT d.department_name, d.location_id, e.last_name, e.job_id,
e.salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND d.location_id = &location_id;

-- TASK 8

SELECT COUNT(*)
FROM employees
WHERE SUBSTR(last_name, -1) = 'n';

-- TASK 9

SELECT d.department_id, d.department_name,
d.location_id, COUNT(e.employee_id)
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name, d.location_id;

-- TASK 10

SELECT DISTINCT job_id
FROM employees
WHERE department_id IN (10, 20);

-- TASK 11

SELECT e.job_id, count(e.job_id) FREQUENCY
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name IN ('Administration', 'Executive')
GROUP BY e.job_id
ORDER BY FREQUENCY DESC;

-- TASK 12

SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'DD') < 16;

-- TASK 13

SELECT last_name, salary, TRUNC(salary, -3)/1000 Thousands
FROM employees;

-- TASK 14

SELECT e.last_name, m.last_name manager, m.salary,
j.grade_level
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
JOIN job_grades j
ON m.salary BETWEEN j.lowest_sal AND j.highest_sal
AND m.salary > 15000;

-- TASK 15

SELECT d.department_id, d.department_name,
count(e1.employee_id) employees,
NVL(TO_CHAR(AVG(e1.salary), '99999.99'), 'No average' )
avg_sal,
e2.last_name, e2.salary, e2.job_id
FROM departments d RIGHT OUTER JOIN employees e1
ON d.department_id = e1.department_id
RIGHT OUTER JOIN employees e2
ON d.department_id = e2.department_id
GROUP BY d.department_id, d.department_name, e2.last_name,
e2.salary,
e2.job_id
ORDER BY d.department_id, employees;

-- TASK 16

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id);

-- TASK 17

SELECT *
FROM departments
WHERE department_id NOT IN(SELECT department_id
FROM employees
WHERE job_id = 'SA_REP'
AND department_id IS NOT NULL);

-- TASK 18

SELECT d.department_id, d.department_name, COUNT(*)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) < 3;

-- TASK 18

SELECT d.department_id, d.department_name, COUNT(*)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
FROM employees
GROUP BY department_id);

-- TASK 18

SELECT d.department_id, d.department_name, COUNT(*)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) = (SELECT MIN(COUNT(*))
FROM employees
GROUP BY department_id);

-- TASK 19

SELECT e.employee_id, e.last_name, e.department_id, e.salary,
AVG(s.salary)
FROM employees e JOIN employees s
ON e.department_id = s.department_id
GROUP BY e.employee_id, e.last_name, e.department_id,
e.salary;

-- TASK 20

SELECT last_name, TO_CHAR(hire_date, 'Month DD') BIRTHDAY
FROM employees
ORDER BY TO_CHAR(hire_date, 'DDD');