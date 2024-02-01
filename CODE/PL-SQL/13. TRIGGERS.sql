-- Creating a DML Statement Trigger Example: SECURE_EMP

CREATE TABLE emp
AS SELECT * FROM hr.EMPLOYEES
/
    
CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON emp
BEGIN
IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
(TO_CHAR(SYSDATE,'HH24:MI')
NOT BETWEEN '08:00' AND '18:00') THEN
RAISE_APPLICATION_ERROR(-20500, 'You may insert'
||' into EMPLOYEES table only during '
||' normal business hours.');
END IF;
END;

INSERT INTO emp (employee_id, last_name,
first_name, email, hire_date,
job_id, salary, department_id)
VALUES (300, 'Smith', 'Rob', 'RSMITH', SYSDATE,
'IT_PROG', 4500, 60);

-- Using Conditional Predicates

CREATE OR REPLACE TRIGGER secure_emp BEFORE
INSERT OR UPDATE OR DELETE ON emp
BEGIN
IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
(TO_CHAR(SYSDATE,'HH24')
NOT BETWEEN '08' AND '18') THEN
IF DELETING THEN RAISE_APPLICATION_ERROR(
-20502,'You may delete from EMPLOYEES table'||
'only during normal business hours.');
ELSIF INSERTING THEN RAISE_APPLICATION_ERROR(
-20500,'You may insert into EMPLOYEES table'||
'only during normal business hours.');
ELSIF UPDATING ('SALARY') THEN
RAISE_APPLICATION_ERROR(-20503, 'You may '||
'update SALARY only normal during business hours.');
ELSE RAISE_APPLICATION_ERROR(-20504,'You may'||
' update EMPLOYEES table only during'||
' normal business hours.');
END IF;
END IF;
END;

INSERT INTO emp (employee_id, last_name,
first_name, email, hire_date,
job_id, salary, department_id)
VALUES (300, 'Smith', 'Rob', 'RSMITH', SYSDATE,
'IT_PROG', 4500, 60);

-- Creating a DML Row Trigger

CREATE OR REPLACE TRIGGER restrict_salary
BEFORE INSERT OR UPDATE OF salary ON emp
FOR EACH ROW
BEGIN
IF NOT (:NEW.job_id IN ('AD_PRES', 'AD_VP'))
AND :NEW.salary > 15000 THEN
RAISE_APPLICATION_ERROR (-20202,
'Employee cannot earn more than $15,000.');
END IF;
END;/
    
UPDATE emp
SET salary = 15500
WHERE last_name = 'Russell';

-- Using OLD and NEW Qualifiers: Example

CREATE OR REPLACE TRIGGER audit_emp_values
AFTER DELETE OR INSERT OR UPDATE ON emp
FOR EACH ROW
BEGIN
INSERT INTO audit_emp(user_name, time_stamp, id,
old_last_name, new_last_name, old_title,
new_title, old_salary, new_salary)
VALUES (USER, SYSDATE, :OLD.employee_id,
:OLD.last_name, :NEW.last_name, :OLD.job_id,
:NEW.job_id, :OLD.salary, :NEW.salary);
END;
/

-- Using OLD and NEW Qualifiers: Example Using AUDIT_EMP
    
INSERT INTO emp (employee_id, last_name, job_id,
salary, email, hire_date)
VALUES (999, 'Temp emp', 'SA_REP', 6000, 'TEMPEMP',
TRUNC(SYSDATE));
/
UPDATE emp
SET salary = 7000, last_name = 'Smith'
WHERE employee_id = 999;
/
SELECT *
FROM audit_emp;

-- Using the WHEN Clause to Fire a Row Trigger Based on a Condition

CREATE OR REPLACE TRIGGER derive_commission_pct
BEFORE INSERT OR UPDATE OF salary ON employees
FOR EACH ROW
WHEN (NEW.job_id = 'SA_REP')
BEGIN
IF INSERTING THEN
:NEW.commission_pct := 0;
ELSIF :OLD.commission_pct IS NULL THEN
:NEW.commission_pct := 0;
ELSE
:NEW.commission_pct := :OLD.commission_pct+0.05;
END IF;
END;
/

-- Creating an INSTEAD OF Trigger to Perform DML on Complex Views
    
CREATE TABLE new_emps AS
SELECT employee_id,last_name,salary,department_id
FROM employees;

CREATE TABLE new_depts AS
SELECT d.department_id,d.department_name,
sum(e.salary) dept_sal
FROM employees e, departments d
WHERE e.department_id = d.department_id;

CREATE VIEW emp_details AS
SELECT e.employee_id, e.last_name, e.salary,
e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_id,d.department_name;

CREATE OR REPLACE TRIGGER new_emp_dept
INSTEAD OF INSERT OR UPDATE OR DELETE ON emp_details
FOR EACH ROW
BEGIN
IF INSERTING THEN
INSERT INTO new_emps
VALUES (:NEW.employee_id, :NEW.last_name,
:NEW.salary, :NEW.department_id);
UPDATE new_depts
SET dept_sal = dept_sal + :NEW.salary
WHERE department_id = :NEW.department_id;
ELSIF DELETING THEN
DELETE FROM new_emps
WHERE employee_id = :OLD.employee_id;
UPDATE new_depts
SET dept_sal = dept_sal - :OLD.salary
WHERE department_id = :OLD.department_id;
ELSIF UPDATING ('salary') THEN
UPDATE new_emps
SET salary = :NEW.salary
WHERE employee_id = :OLD.employee_id;
UPDATE new_depts
SET dept_sal = dept_sal +
(:NEW.salary - :OLD.salary)
WHERE department_id = :OLD.department_id;
ELSIF UPDATING ('department_id') THEN
UPDATE new_emps
SET department_id = :NEW.department_id
WHERE employee_id = :OLD.employee_id;
UPDATE new_depts
SET dept_sal = dept_sal - :OLD.salary
WHERE department_id = :OLD.department_id;
UPDATE new_depts
SET dept_sal = dept_sal + :NEW.salary
WHERE department_id = :NEW.department_id;
END IF;
END;
/