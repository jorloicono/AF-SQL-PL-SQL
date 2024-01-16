-- UNION Operator

SELECT employee_id, job_id, department_id FROM	employees
UNION
SELECT employee_id, job_id, department_id FROM	job_history;

-- UNION ALL Operator

SELECT	employee_id, job_id,department_id FROM	employees
UNION ALL
SELECT	employee_id, job_id,department_id FROM	job_history
ORDER BY employee_id;

-- INTERSECT Operator

SELECT employee_id, job_id, department_id FROM	employees
INTERSECT
SELECT employee_id, job_id, department_id FROM	job_history;

-- MINUS Operator

SELECT	employee_id FROM employees
MINUS
SELECT	employee_id FROM job_history;

-- Matching the SELECT Statements

SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse location"
FROM departments UNION
SELECT location_id, TO_CHAR(NULL) "Department", state_province
FROM locations;

-- Using the ORDER BY Clause in Set Operations

SELECT employee_id, job_id,salary FROM	employees
UNION
SELECT employee_id, job_id,0 FROM	job_history
ORDER BY 2;
