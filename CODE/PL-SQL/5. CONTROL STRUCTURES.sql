-- Simple IF Statement

DECLARE
v_myage number:=31; 
BEGIN
IF v_myage < 11 THEN
DBMS_OUTPUT.PUT_LINE(' I am a child '); END IF;
END;
/

-- IF THEN ELSE Statement

DECLARE
v_myage number:=31; 
BEGIN
IF v_myage < 11 THEN
DBMS_OUTPUT.PUT_LINE(' I am a child '); 
ELSE
DBMS_OUTPUT.PUT_LINE(' I am not a child '); 
END IF;
END;
/

-- IF ELSIF ELSE Clause

DECLARE
v_myage number:=31; 
BEGIN
IF v_myage < 11 THEN
DBMS_OUTPUT.PUT_LINE(' I am a child ');
ELSIF v_myage < 20 THEN 
DBMS_OUTPUT.PUT_LINE(' I am young ');
ELSIF v_myage < 30 THEN
DBMS_OUTPUT.PUT_LINE(' I am in my twenties'); 
ELSIF v_myage < 40 THEN
DBMS_OUTPUT.PUT_LINE(' I am in my thirties'); 
ELSE
DBMS_OUTPUT.PUT_LINE(' I am always young '); 
END IF;
END;
/

-- NULL Value in IF Statement

DECLARE
v_myage number; 
BEGIN
IF v_myage < 11 THEN 
DBMS_OUTPUT.PUT_LINE(' I am a child ');
ELSE
DBMS_OUTPUT.PUT_LINE(' I am not a child '); 
END IF;
END;
/

-- CASE Expressions

DECLARE
v_grade CHAR(1) := UPPER('a'); 
appraisal VARCHAR2(20);
BEGIN
appraisal := CASE v_grade
WHEN 'A' THEN 'Excellent' 
WHEN 'B' THEN 'Very Good' 
WHEN 'C' THEN 'Good'
ELSE 'No such grade' 
END;
DBMS_OUTPUT.PUT_LINE ('Grade: '|| v_grade || '
Appraisal: ' || appraisal);
END;

-- Basic Loops

DECLARE
  v_employee_id   employees.employee_id%TYPE;
  v_employee_name employees.first_name%TYPE;
  v_salary        employees.salary%TYPE;
  v_max_salary    NUMBER := 10000; -- Set the maximum salary condition
  v_row_count     NUMBER := 0;

BEGIN
  -- Process records with a WHILE loop
  WHILE v_row_count < 10 -- Limiting to the first 10 employees for the example
  LOOP
    -- Retrieve employee information
    SELECT employee_id, first_name, salary
    INTO v_employee_id, v_employee_name, v_salary
    FROM hr.employees
    WHERE ROWNUM = v_row_count + 1;

    -- Display employee information
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Name: ' || v_employee_name || ', Salary: ' || v_salary);

    -- Increment the row count
    v_row_count := v_row_count + 1;

    -- Check if the salary exceeds the maximum threshold
    IF v_salary > v_max_salary THEN
      EXIT; -- Exit the loop if the condition is met
    END IF;
  END LOOP;

END;
/

-- FOR Loop

DECLARE
  v_max_salary    NUMBER := 10000; -- Set the maximum salary condition

BEGIN
  -- Process records with a FOR loop
  FOR i IN 1..10 -- Limiting to the first 10 employees for the example
  LOOP
    -- Declare variables to store employee information
    DECLARE
      v_employee_id   employees.employee_id%TYPE;
      v_employee_name employees.first_name%TYPE;
      v_salary        employees.salary%TYPE;
    BEGIN
      -- Retrieve employee information
      SELECT employee_id, first_name, salary
      INTO v_employee_id, v_employee_name, v_salary
      FROM employees
      WHERE ROWNUM = i;

      -- Display employee information
      DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Name: ' || v_employee_name || ', Salary: ' || v_salary);

      -- Check if the salary exceeds the maximum threshold
      IF v_salary > v_max_salary THEN
        EXIT; -- Exit the loop if the condition is met
      END IF;
    END;
  END LOOP;

END;
/

-- PL/SQL CONTINUE Statement

DECLARE
v_total NUMBER := 0; BEGIN
<<BeforeTopLoop>>
FOR i IN 1..10 LOOP
v_total := v_total + 1; dbms_output.put_line
('Total is: ' || v_total); FOR j IN 1..10 LOOP
CONTINUE BeforeTopLoop WHEN i + j > 5; v_total := v_total + 1;
END LOOP; END LOOP;
END two_loop;
