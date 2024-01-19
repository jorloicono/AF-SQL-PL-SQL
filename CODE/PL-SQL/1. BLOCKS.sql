/*
v_first_name varchar2(20);: This line declares a variable named v_first_name of type VARCHAR2 with a maximum length of 20 characters. 
VARCHAR2 is a data type in Oracle that is used to store variable-length character strings.

begin: This keyword marks the beginning of a PL/SQL block. 
A PL/SQL block is a group of one or more SQL and PL/SQL statements that are executed together.

select first_name into v_first_name from employees where employee_id=100;: 
This is a SQL query that retrieves the first_name column from the employees table for the employee with employee_id equal to 100. 
The result of this query is then stored in the variable v_first_name using the INTO clause.

end;: This keyword marks the end of the PL/SQL block.
*/

declare
v_first_name varchar2(20);
begin
select first_name into v_first_name from employees where employee_id=100;
end;

/*
v_first_name varchar2(20);: This line declares a variable named v_first_name of type VARCHAR2 with a maximum length of 20 characters. 
VARCHAR2 is a data type in Oracle used to store variable-length character strings.

begin: This keyword marks the beginning of a PL/SQL block. A PL/SQL block is a group of one or more SQL and PL/SQL statements that are executed together.

select first_name into v_first_name from employees where employee_id=100;: 
This is a SQL query that retrieves the value of the first_name column from the employees table for the employee with employee_id equal to 100. 
The result of this query is stored in the variable v_first_name using the INTO clause.

DBMS_OUTPUT.PUT_LINE('El nombre del empleado 100 es: ' || V_FIRST_NAME);: 
This line outputs a message to the console using the DBMS_OUTPUT.PUT_LINE procedure. 
It concatenates the string 'El nombre del empleado 100 es: ' with the value stored in the v_first_name variable. 
The result is then printed to the console.

end;: This keyword marks the end of the PL/SQL block.
*/

declare
v_first_name varchar2(20);
begin
select first_name into v_first_name
from employees where employee_id=100;
DBMS_OUTPUT.PUT_LINE('El nombre del empleado 100 es: '
|| V_FIRST_NAME);
end;

/*
v_first_name varchar2(20);: This line declares a variable named v_first_name of type VARCHAR2 with a maximum length of 20 characters. 
VARCHAR2 is a data type in Oracle used to store variable-length character strings.

begin: This keyword marks the beginning of the outermost PL/SQL block.

BEGIN: This marks the beginning of a nested block. In this case, it's not strictly necessary, as it doesn't contain multiple statements. 
However, it's syntactically valid.

select first_name into v_first_name from employees where employee_id=100;: 
This is a SQL query that retrieves the value of the first_name column from the employees table for the employee with employee_id equal to 100. 
The result is stored in the variable v_first_name using the INTO clause.

END;: This marks the end of the nested block. In this case, it encapsulates the single SQL statement.

DBMS_OUTPUT.PUT_LINE('El nombre del empleado 100 es: ' || V_FIRST_NAME);: 
This line outputs a message to the console using the DBMS_OUTPUT.PUT_LINE procedure. 
It concatenates the string 'El nombre del empleado 100 es: ' with the value stored in the v_first_name variable and then prints the result to the console.

end;: This marks the end of the outermost PL/SQL block.
*/


declare
v_first_name varchar2(20);
begin
BEGIN
select first_name into v_first_name
from employees where employee_id=100;
END;
DBMS_OUTPUT.PUT_LINE('El nombre del empleado 100 es: '
|| V_FIRST_NAME);
end;