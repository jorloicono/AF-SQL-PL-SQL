-- Retrieving Records with Natural Joins

SELECT employee_id,last_name,department_id,
department_name
from employees NATURAL JOIN departments;

-- Retrieving Records with the USING Clause

SELECT employee_id, last_name,
location_id, department_id
FROM employees JOIN departments
USING (department_id) ;

-- Using Table Aliases with the USING Clause

SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING (location_id)
WHERE d.location_id = 1400;

-- Retrieving Records with the ON Clause

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

-- Creating Three-Way Joins with the ON Clause

SELECT employee_id, city, department_name
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON d.location_id = l.location_id;

-- Applying Additional Conditions to a Join

SELECT e.employee_id, e.last_name, e.department_id,
d.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
AND e.manager_id = 149 ;

-- Self-Joins Using the ON Clause

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);

-- Retrieving Records with Nonequijoins

SELECT e.last_name, e.salary, j.grade_level
FROM employees e JOIN job_grades j
ON e.salary
BETWEEN j.lowest_sal AND j.highest_sal;

-- LEFT OUTER JOIN

SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id) ;

-- RIGHT OUTER JOIN

SELECT e.last_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id) ;

-- FULL OUTER JOIN

SELECT e.last_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id) ;

-- Creating Cross Joins

SELECT last_name, department_name
FROM employees
CROSS JOIN departments;























