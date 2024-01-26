-- Procedure

CREATE TABLE dept AS SELECT * FROM departments;
CREATE PROCEDURE add_dept IS v_dept_id dept.department_id%TYPE;
v_dept_name dept.department_name%TYPE; BEGIN
v_dept_id:=280; v_dept_name:='ST-Curriculum';
INSERT INTO dept(department_id,department_name) VALUES(v_dept_id,v_dept_name); DBMS_OUTPUT.PUT_LINE(' Inserted '|| SQL%ROWCOUNT
||' row '); END;

-- Invoking the Procedure

BEGIN
add_dept; END;
/
SELECT department_id, department_name FROM dept WHERE department_id=280;

-- Function

CREATE FUNCTION check_sal RETURN Boolean IS
v_dept_id employees.department_id%TYPE; v_empno	employees.employee_id%TYPE; v_sal	employees.salary%TYPE; v_avg_sal employees.salary%TYPE;
BEGIN
v_empno:=205;
SELECT salary,department_id INTO v_sal,v_dept_id FROM employees
WHERE employee_id= v_empno;
SELECT avg(salary) INTO v_avg_sal FROM employees WHERE department_id=v_dept_id;
IF v_sal > v_avg_sal THEN RETURN TRUE;
ELSE
RETURN FALSE; END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN RETURN NULL;
END;


-- Invoking the Function

BEGIN
IF (check_sal IS NULL) THEN DBMS_OUTPUT.PUT_LINE('The function returned
NULL due to exception'); ELSIF (check_sal) THEN
DBMS_OUTPUT.PUT_LINE('Salary > average'); ELSE
DBMS_OUTPUT.PUT_LINE('Salary < average'); END IF;
END;
/

-- Function definition with parameters
CREATE OR REPLACE FUNCTION my_function(
    p_parameter1 IN VARCHAR2,
    p_parameter2 IN NUMBER
) RETURN VARCHAR2
IS
    result VARCHAR2(50);
BEGIN
    -- Your logic here
    result := 'Result: ' || p_parameter1 || ' ' || TO_CHAR(p_parameter2);
    
    RETURN result;
END my_function;
/

-- Function call
DECLARE
    result_value VARCHAR2(50);
BEGIN
    -- Call the function with specific values
    result_value := my_function('Hello', 42);
    
    -- Print the result
    DBMS_OUTPUT.PUT_LINE(result_value);
END;
/


