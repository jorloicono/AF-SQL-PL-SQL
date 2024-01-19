-- Commenting Code

DECLARE
v_annual_sal NUMBER (9,2); 
BEGIN
/* Compute the annual salary based on the monthly salary input from the user */
v_annual_sal := 100 ;
--The following line displays the annual salary 
DBMS_OUTPUT.PUT_LINE(v_annual_sal);
END;
/

-- PL/SQL block demonstrating the LENGTH function
    
DECLARE
    v_string VARCHAR2(50) := 'Hello, World!';
    v_length NUMBER;
BEGIN
    v_length := LENGTH(v_string);
    DBMS_OUTPUT.PUT_LINE('Length of the string: ' || v_length);
END;
/

-- PL/SQL block demonstrating the MONTHS_BETWEEN function
    
DECLARE
    v_date1 DATE := TO_DATE('2022-01-01', 'YYYY-MM-DD');
    v_date2 DATE := TO_DATE('2023-06-15', 'YYYY-MM-DD');
    v_months NUMBER;
BEGIN
    v_months := MONTHS_BETWEEN(v_date2, v_date1);
    DBMS_OUTPUT.PUT_LINE('Months between the two dates: ' || v_months);
END;
/

-- Data Type Conversion

DECLARE
v_salary NUMBER(6):=6000; v_sal_hike VARCHAR2(5):='1000'; v_total_salary v_salary%TYPE;
BEGIN
v_total_salary:=v_salary + v_sal_hike; END;
/

-- Nested Blocks

DECLARE
	v_outer_variable VARCHAR2(20):='GLOBAL VARIABLE'; 
BEGIN
	DECLARE
	v_inner_variable VARCHAR2(20):='LOCAL VARIABLE'; 
	BEGIN
		DBMS_OUTPUT.PUT_LINE(v_inner_variable); 
		DBMS_OUTPUT.PUT_LINE(v_outer_variable);
	END;
	DBMS_OUTPUT.PUT_LINE(v_outer_variable); 
END;

-- Variable Scope and Visibility

DECLARE
	v_father_name VARCHAR2(20):='Patrick'; 
	v_date_of_birth DATE:='20-Apr-1972';
BEGIN
	DECLARE
		v_child_name VARCHAR2(20):='Mike';
		v_date_of_birth DATE:='12-Dec-2002';
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Father''s Name: '||v_father_name); 
		DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth);
		DBMS_OUTPUT.PUT_LINE('Child''s Name: '||v_child_name);
	END;
	DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth); 
END;
/

-- Qualify an Identifier
    
BEGIN <<outer>> 
DECLARE
	v_father_name VARCHAR2(20):='Patrick'; 
	v_date_of_birth DATE:='20-Apr-1972';
BEGIN
	DECLARE
		v_child_name VARCHAR2(20):='Mike'; 
		v_date_of_birth DATE:='12-Dec-2002';
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Father''s Name: '||v_father_name); 
        DBMS_OUTPUT.PUT_LINE('Date of Birth: '||outer.v_date_of_birth); 
        DBMS_OUTPUT.PUT_LINE('Child''s Name: '||v_child_name); 
        DBMS_OUTPUT.PUT_LINE('Date of Birth: '||v_date_of_birth);
	END; 
END;
END outer;

-- PL/SQL block demonstrating arithmetic operators
DECLARE
    v_number1 NUMBER := 10;
    v_number2 NUMBER := 5;
    v_result NUMBER;
BEGIN
    v_result := v_number1 + v_number2;
    DBMS_OUTPUT.PUT_LINE('Addition: ' || v_result);

    v_result := v_number1 - v_number2;
    DBMS_OUTPUT.PUT_LINE('Subtraction: ' || v_result);

    v_result := v_number1 * v_number2;
    DBMS_OUTPUT.PUT_LINE('Multiplication: ' || v_result);

    v_result := v_number1 / v_number2;
    DBMS_OUTPUT.PUT_LINE('Division: ' || v_result);
END;
/

-- PL/SQL block demonstrating comparison operators
DECLARE
    v_number1 NUMBER := 10;
    v_number2 NUMBER := 5;
    v_result BOOLEAN;
BEGIN
    v_result := (v_number1 = v_number2);
    DBMS_OUTPUT.PUT_LINE('Equal: ' || v_result);

    v_result := (v_number1 <> v_number2);
    DBMS_OUTPUT.PUT_LINE('Not Equal: ' || v_result);

    v_result := (v_number1 > v_number2);
    DBMS_OUTPUT.PUT_LINE('Greater Than: ' || v_result);

    v_result := (v_number1 < v_number2);
    DBMS_OUTPUT.PUT_LINE('Less Than: ' || v_result);
END;
/

-- PL/SQL block demonstrating logical operators
DECLARE
    v_condition1 BOOLEAN := TRUE;
    v_condition2 BOOLEAN := FALSE;
    v_result BOOLEAN;
BEGIN
    v_result := v_condition1 AND v_condition2;
    DBMS_OUTPUT.PUT_LINE('AND Operator: ' || v_result);

    v_result := v_condition1 OR v_condition2;
    DBMS_OUTPUT.PUT_LINE('OR Operator: ' || v_result);

    v_result := NOT v_condition1;
    DBMS_OUTPUT.PUT_LINE('NOT Operator: ' || v_result);
END;
/