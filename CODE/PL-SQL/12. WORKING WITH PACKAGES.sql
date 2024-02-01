-- Overloading Procedures Example: Creating the Package Specification

CREATE OR REPLACE PACKAGE dept_pkg IS
PROCEDURE add_department
(p_deptno hr.departments.department_id%TYPE,
p_name hr.departments.department_name%TYPE :='unknown',
p_loc hr.departments.location_id%TYPE := 1700);

PROCEDURE add_department
(p_name hr.departments.department_name%TYPE := 'unknown',
p_loc hr.departments.location_id%TYPE := 1700);
END dept_pkg;
/

-- Overloading Procedures Example: Creating the Package Body

CREATE OR REPLACE PACKAGE BODY dept_pkg IS
PROCEDURE add_department –- First procedure’s declaration
(p_deptno hr.departments.department_id%TYPE,
p_name hr.departments.department_name%TYPE := 'unknown',
p_loc hr.departments.location_id%TYPE := 1700) IS
BEGIN
INSERT INTO departments(department_id,
department_name, location_id)
VALUES (p_deptno, p_name, p_loc);
END add_department;

PROCEDURE add_department –- Second procedure’s declaration
(p_name hr.departments.department_name%TYPE := 'unknown',
p_loc hr.departments.location_id%TYPE := 1700) IS
BEGIN
INSERT INTO departments (department_id,
department_name, location_id)
VALUES (departments_seq.NEXTVAL, p_name, p_loc);
END add_department;
END dept_pkg; /

EXECUTE dept_pkg.add_department(980,'Education',2500)
SELECT * FROM departments
WHERE department_id = 980;

EXECUTE dept_pkg.add_department ('Training', 2400)
SELECT * FROM departments
WHERE department_name = 'Training';

-- Package Function in SQL: Example

CREATE OR REPLACE PACKAGE taxes_pkg IS
FUNCTION tax (p_value IN NUMBER) RETURN NUMBER;
END taxes_pkg;
/
CREATE OR REPLACE PACKAGE BODY taxes_pkg IS
FUNCTION tax (p_value IN NUMBER) RETURN NUMBER IS
v_rate NUMBER := 0.08;
BEGIN
RETURN (p_value * v_rate);
END tax;
END taxes_pkg;
/
SELECT taxes_pkg.tax(salary), salary, last_name
FROM employees;