-- Fetching Data from the Cursor

DECLARE
CURSOR c_emp_cursor IS
SELECT employee_id, last_name FROM hr.employees WHERE department_id =30;
v_empno hr.employees.employee_id%TYPE; v_lname hr.employees.last_name%TYPE;
BEGIN
OPEN c_emp_cursor;
FETCH c_emp_cursor INTO v_empno, v_lname; DBMS_OUTPUT.PUT_LINE( v_empno ||' '||v_lname);
END;
/

DECLARE
CURSOR c_emp_cursor IS
SELECT employee_id, last_name FROM hr.employees WHERE department_id =30;
v_empno hr.employees.employee_id%TYPE; v_lname hr.employees.last_name%TYPE;
BEGIN
OPEN c_emp_cursor; LOOP
FETCH c_emp_cursor INTO v_empno, v_lname; EXIT WHEN c_emp_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE( v_empno ||' '||v_lname); END LOOP;
END;
/

-- Cursors and Records
DECLARE
CURSOR c_emp_cursor IS
SELECT employee_id, last_name FROM hr.employees WHERE department_id =30;
v_emp_record	c_emp_cursor%ROWTYPE; BEGIN
OPEN c_emp_cursor; LOOP
FETCH c_emp_cursor INTO v_emp_record; EXIT WHEN c_emp_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE( v_emp_record.employee_id
||' '||v_emp_record.last_name);
END LOOP;
CLOSE c_emp_cursor; END;

-- Cursor FOR Loops

DECLARE
CURSOR c_emp_cursor IS
SELECT employee_id, last_name FROM employees WHERE department_id =30;
BEGIN
FOR emp_record IN c_emp_cursor LOOP
DBMS_OUTPUT.PUT_LINE( emp_record.employee_id
||' ' ||emp_record.last_name); END LOOP;
END;

DECLARE
CURSOR c_emp_cursor IS SELECT employee_id, last_name FROM employees;
v_emp_record c_emp_cursor%ROWTYPE; BEGIN
OPEN c_emp_cursor; LOOP
FETCH c_emp_cursor INTO v_emp_record;
EXIT WHEN c_emp_cursor%ROWCOUNT > 10 OR
c_emp_cursor%NOTFOUND; DBMS_OUTPUT.PUT_LINE( v_emp_record.employee_id
||' '||v_emp_record.last_name);
END LOOP;
CLOSE c_emp_cursor; END ; /

-- Cursors with Parameters

    DECLARE
  -- Declare variables to hold parameter values
  department_id_param NUMBER := 10;
  salary_threshold_param NUMBER := 5000;

  -- Declare a cursor with parameters
  CURSOR EmployeeCursor (dept_id NUMBER, salary_threshold NUMBER) IS
    SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE department_id = dept_id AND salary > salary_threshold;

  -- Declare variables to store values from the cursor
  emp_id NUMBER;
  emp_first_name VARCHAR2(50);
  emp_last_name VARCHAR2(50);
  emp_salary NUMBER;

BEGIN
  -- Open the cursor with specified parameters
  OPEN EmployeeCursor(department_id_param, salary_threshold_param);

  -- Fetch and process data from the cursor
  LOOP
    FETCH EmployeeCursor INTO emp_id, emp_first_name, emp_last_name, emp_salary;
    EXIT WHEN EmployeeCursor%NOTFOUND;

    -- Process the fetched data (you can replace this with your own logic)
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_id || ', Name: ' || emp_first_name || ' ' || emp_last_name || ', Salary: ' || emp_salary);
  END LOOP;

  -- Close the cursor
  CLOSE EmployeeCursor;
END;
/

