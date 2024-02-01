-- Using the IN Parameter Mode: Example

CREATE OR REPLACE PROCEDURE raise_salary
(p_id IN employees.employee_id%TYPE,
p_percent IN NUMBER)
IS
BEGIN
UPDATE employees
SET salary = salary * (1 + p_percent/100)
WHERE employee_id = p_id;
END raise_salary;
/
EXECUTE raise_salary(176, 10)

-- Using the OUT Parameter Mode: Example

CREATE OR REPLACE PROCEDURE query_emp
(p_id IN employees.employee_id%TYPE,
p_name OUT employees.last_name%TYPE,
p_salary OUT employees.salary%TYPE) IS
BEGIN
SELECT last_name, salary INTO p_name, p_salary
FROM employees
WHERE employee_id = p_id;
END query_emp;
/
DECLARE
v_emp_name employees.last_name%TYPE;
v_emp_sal employees.salary%TYPE;
BEGIN
query_emp(171, v_emp_name, v_emp_sal);
DBMS_OUTPUT.PUT_LINE(v_emp_name||' earns '||
to_char(v_emp_sal, '$999,999.00'));
END;/

-- Using the IN OUT Parameter Mode: Example

CREATE OR REPLACE PROCEDURE format_phone
(p_phone_no IN OUT VARCHAR2) IS
BEGIN
p_phone_no := '(' || SUBSTR(p_phone_no,1,3) ||
') ' || SUBSTR(p_phone_no,4,3) ||
'-' || SUBSTR(p_phone_no,7);
END format_phone;
/

VARIABLE b_phone_no VARCHAR2(15)
EXECUTE :b_phone_no := '8006330575'
PRINT b_phone_no
EXECUTE format_phone (:b_phone_no)
PRINT b_phone_no

-- Passing Actual Parameters: Creating the add_dept Procedure

CREATE OR REPLACE PROCEDURE add_dept(
p_name IN departments.department_name%TYPE,
p_loc IN departments.location_id%TYPE) IS
BEGIN
INSERT INTO departments(department_id,
department_name, location_id)
VALUES (departments_seq.NEXTVAL, p_name , p_loc );
END add_dept;
/

-- Passing Actual Parameters: Examples
-- Passing parameters using the positional notation.
EXECUTE add_dept ('TRAINING', 2500)
-- Passing parameters using the named notation.
EXECUTE add_dept (p_loc=>2400, p_name=>'EDUCATION')

-- Using the DEFAULT Option for the Parameters

CREATE OR REPLACE PROCEDURE add_dept(
p_name departments.department_name%TYPE:='Unknown',
p_loc departments.location_id%TYPE DEFAULT 1700)
IS
BEGIN
INSERT INTO departments (department_id,
department_name, location_id)
VALUES (departments_seq.NEXTVAL, p_name, p_loc);
END add_dept;

EXECUTE add_dept
EXECUTE add_dept ('ADVERTISING', p_loc => 1200)
EXECUTE add_dept (p_loc => 1200)

-- Calling Procedures

CREATE OR REPLACE PROCEDURE process_employees
IS
CURSOR cur_emp_cursor IS
SELECT employee_id
FROM employees;
BEGIN
FOR emp_rec IN cur_emp_cursor
LOOP
raise_salary(emp_rec.employee_id, 10);
END LOOP;
COMMIT;
END process_employees;
/

-- Handled Exceptions: Example

CREATE PROCEDURE add_department(
p_name VARCHAR2, p_mgr NUMBER, p_loc NUMBER) IS
BEGIN
INSERT INTO DEPARTMENTS (department_id,
department_name, manager_id, location_id)
VALUES (DEPARTMENTS_SEQ.NEXTVAL, p_name, p_mgr, p_loc);
DBMS_OUTPUT.PUT_LINE('Added Dept: '|| p_name);
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Err: adding dept: '|| p_name);
END;

CREATE PROCEDURE create_departments IS
BEGIN
add_department('Media', 100, 1800);
add_department('Editing', 99, 1800);
add_department('Advertising', 101, 1800);
END;

-- Exceptions Not Handled: Example

CREATE PROCEDURE create_departments_noex IS
BEGIN
add_department_noex('Media', 100, 1800);
add_department_noex('Editing', 99, 1800);
add_department_noex('Advertising', 101, 1800);
END;
SET SERVEROUTPUT ON
CREATE PROCEDURE add_department_noex(
p_name VARCHAR2, p_mgr NUMBER, p_loc NUMBER) IS
BEGIN
INSERT INTO DEPARTMENTS (department_id,
department_name, manager_id, location_id)
VALUES (DEPARTMENTS_SEQ.NEXTVAL, p_name, p_mgr, p_loc);
DBMS_OUTPUT.PUT_LINE('Added Dept: '|| p_name);
END;

-- Viewing Procedure Information Using the Data Dictionary Views

SELECT text
FROM user_source
WHERE name = 'ADD_DEPT' AND type = 'PROCEDURE'
ORDER BY line;

DESCRIBE user_source