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

-- Creating the Package Body

CREATE OR REPLACE PACKAGE BODY dept_pkg IS
PROCEDURE add_department –- First procedure’s declaration
(p_deptno departments.department_id%TYPE,
p_name departments.department_name%TYPE := 'unknown',
p_loc departments.location_id%TYPE := 1700) IS
BEGIN
INSERT INTO departments(department_id,
department_name, location_id)
VALUES (p_deptno, p_name, p_loc);
END add_department;
PROCEDURE add_department –- Second procedure’s declaration
(p_name departments.department_name%TYPE := 'unknown',
p_loc departments.location_id%TYPE := 1700) IS
BEGIN
INSERT INTO departments (department_id,
department_name, location_id)
VALUES (departments_seq.NEXTVAL, p_name, p_loc);
END add_department;
END dept_pkg; /