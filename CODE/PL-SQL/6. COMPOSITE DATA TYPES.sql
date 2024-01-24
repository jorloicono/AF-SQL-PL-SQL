-- Creating a PL/SQL Record

DECLARE
type t_rec is record (v_sal number(8),
v_minsal number(8) default 1000, v_hire_date employees.hire_date%type, v_rec1 employees%rowtype);
v_myrec t_rec; BEGIN
v_myrec.v_sal := v_myrec.v_minsal + 500; v_myrec.v_hire_date := sysdate;
SELECT * INTO v_myrec.v_rec1
FROM employees WHERE employee_id = 100; DBMS_OUTPUT.PUT_LINE(v_myrec.v_rec1.last_name ||' '|| to_char(v_myrec.v_hire_date) ||' '|| to_char(v_myrec.v_sal));
END;

-- %ROWTYPE Attribute

DECLARE
v_employee_number number:= 124; v_emp_rec	employees%ROWTYPE;
BEGIN
SELECT * INTO v_emp_rec FROM employees WHERE employee_id = v_employee_number;
INSERT INTO retired_emps(empno, ename, job, mgr,
hiredate, leavedate, sal, comm, deptno) VALUES (v_emp_rec.employee_id, v_emp_rec.last_name,
v_emp_rec.job_id, v_emp_rec.manager_id, v_emp_rec.hire_date, SYSDATE, v_emp_rec.salary, v_emp_rec.commission_pct, v_emp_rec.department_id);
END;
/

-- Inserting a Record by Using %ROWTYPE

DECLARE
v_employee_number number:= 124; v_emp_rec retired_emps%ROWTYPE;
BEGIN
SELECT employee_id, last_name, job_id, manager_id, hire_date, hire_date, salary, commission_pct, department_id INTO v_emp_rec FROM employees
WHERE employee_id = v_employee_number; INSERT INTO retired_emps VALUES v_emp_rec;
END;
/
SELECT * FROM retired_emps;

-- Updating a Row in a Table by Using a Record

DECLARE
v_employee_number number:= 124; v_emp_rec retired_emps%ROWTYPE;
BEGIN
SELECT * INTO v_emp_rec FROM retired_emps; v_emp_rec.leavedate:=CURRENT_DATE;
UPDATE retired_emps SET ROW = v_emp_rec WHERE empno=v_employee_number;
END;
/
SELECT * FROM retired_emps;

-- INDEX BY Table of Records

DECLARE
TYPE emp_table_type IS TABLE OF employees%ROWTYPE INDEX BY PLS_INTEGER;
my_emp_table emp_table_type; max_count	NUMBER(3):= 104;
BEGIN
FOR i IN 100..max_count LOOP
SELECT * INTO my_emp_table(i) FROM employees WHERE employee_id = i;
END LOOP;
FOR i IN my_emp_table.FIRST..my_emp_table.LAST LOOP
DBMS_OUTPUT.PUT_LINE(my_emp_table(i).last_name); END LOOP;
END;
/
