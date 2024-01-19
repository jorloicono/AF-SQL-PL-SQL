-- SELECT Statements in PL/SQL

DECLARE
v_fname VARCHAR2(25); BEGIN
SELECT first_name INTO v_fname
FROM hr.employees WHERE employee_id=200; DBMS_OUTPUT.PUT_LINE(' First Name is : '||v_fname);
END;
/

-- Retrieving Data in PL/SQL: Example

    DECLARE
    v_employee_id NUMBER;
    v_employee_name VARCHAR2(50);
    v_salary NUMBER;
BEGIN
    -- Selecting data into variables
    SELECT employee_id, salary
    INTO v_employee_id, v_salary
    FROM hr.employees
    WHERE employee_id = 101; -- Replace with your specific condition

    -- Displaying the retrieved data
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
END;
/

-- Inserting Data
    
CREATE TABLE employees_copy AS SELECT * FROM hr.employees;

begin
	insert into employees_copy
	(employee_id, first_name, last_name, email, hire_date, job_id, salary)
	values
	(300, 'jorge', 'lopez', 'abc@mail.com', sysdate, 'IT_PROG', 3000);
end;

-- Updating Data

declare
v_salary_increase number := 400;
begin
update employees_copy
set salary = salary + v_salary_increase
where employee_id = 300;
end;

-- Deleting Data

begin
delete from employees_copy
where employee_id = 300;
end loop;

-- SQL Cursor Attributes for Implicit Cursors

DECLARE
v_rows_deleted VARCHAR2(30)
v_empno employees.employee_id%TYPE := 176; BEGIN
DELETE FROM employees
WHERE employee_id = v_empno; v_rows_deleted := (SQL%ROWCOUNT ||
' row deleted.'); DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;

end;