-- Declaring and Initializing PL/SQL Variables

DECLARE
v_myName VARCHAR2(20); 
BEGIN
DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName); v_myName := 'John';
DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName); 
END;
/

DECLARE
v_myName VARCHAR2(20):= 'John'; 
BEGIN
v_myName := 'Steven';
DBMS_OUTPUT.PUT_LINE('My name is: '|| v_myName); 
END;
/

-- Delimiters in String Literals
    
DECLARE
v_event VARCHAR2(15); BEGIN
v_event := q'!Father's day!'; DBMS_OUTPUT.PUT_LINE('3rd Sunday in June is :
'|| v_event );
v_event := q'[Mother's day]'; DBMS_OUTPUT.PUT_LINE('2nd Sunday in May is :
'|| v_event ); END;
/

-- Declare and initialize a Boolean variable

DECLARE
	flag BOOLEAN := FALSE; 
BEGIN
	flag := TRUE;
END;
/

-- Bind variables doesnt work on Live SQL

VARIABLE b_emp_salary NUMBER BEGIN
SELECT salary INTO :b_emp_salary
FROM employees WHERE employee_id = 178; END;
/
PRINT b_emp_salary
SELECT first_name, last_name FROM employees WHERE salary=:b_emp_salary;