-- Using Case-Conversion Functions

SELECT employee_id, last_name, department_id
FROM hr.employees
WHERE last_name = 'higgins';

SELECT employee_id, last_name, department_id
FROM hr.employees
WHERE LOWER(last_name) = 'higgins';

-- Using the Character-Manipulation Functions

SELECT employee_id, CONCAT(first_name, last_name) NAME,
job_id, LENGTH (last_name),
INSTR(last_name, 'a') "Contains 'a'?"
FROM hr.employees
WHERE SUBSTR(job_id, 4) = 'REP';

-- Nesting Functions: Example

SELECT last_name,
UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US'))
FROM hr.employees
WHERE department_id = 60;

-- Using the ROUND Function

SELECT ROUND(45.923,2), ROUND(45.923,0),
ROUND(45.923,-1)
FROM DUAL;

-- Using the TRUNC Function

SELECT TRUNC(45.923,2), TRUNC(45.923),
TRUNC(45.923,-1)
FROM DUAL;

-- Using the MOD Function

SELECT last_name, salary, MOD(salary, 5000)
FROM hr.employees
WHERE job_id = 'SA_REP';

-- Working with Dates

SELECT last_name, hire_date
FROM hr.employees
WHERE hire_date < '01-FEB-08';

-- Using the SYSDATE Function

SELECT sysdate
FROM dual;

-- Using Arithmetic Operators with Dates

SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM hr.employees
WHERE department_id = 90;

-- Using Date Functions

SELECT employee_id, hire_date, MONTHS_BETWEEN (SYSDATE, hire_date)
TENURE, ADD_MONTHS (hire_date, 6) REVIEW, NEXT_DAY (hire_date,
'FRIDAY'), LAST_DAY(hire_date)
FROM hr.employees WHERE MONTHS_BETWEEN (SYSDATE, hire_date) < 150;


-- Using ROUND and TRUNC Functions with Dates

SELECT employee_id, hire_date,
ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'MONTH')
FROM hr.employees
WHERE hire_date LIKE '%04;