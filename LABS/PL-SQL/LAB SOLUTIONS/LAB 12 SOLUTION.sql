CREATE OR REPLACE PACKAGE emp_pkg IS

  PROCEDURE add_employee(p_first_name hr.employees.first_name%TYPE,
                         p_last_name  hr.employees.last_name%TYPE,
                         p_email      hr.employees.email%TYPE,
                         p_job        hr.employees.job_id%TYPE DEFAULT 'SA_REP',
                         p_mgr        hr.employees.manager_id%TYPE DEFAULT 145,
                         p_sal        hr.employees.salary%TYPE DEFAULT 1000,
                         p_comm       hr.employees.commission_pct%TYPE DEFAULT 0,
                         p_deptid     hr.employees.department_id%TYPE DEFAULT 30);

  PROCEDURE add_employee(p_first_name hr.employees.first_name%TYPE,
                         p_last_name  hr.employees.last_name%TYPE,
                         p_deptid     hr.employees.department_id%TYPE DEFAULT 30);
  
  PROCEDURE get_employee(p_id     IN hr.employees.employee_id%TYPE,
                         p_salary OUT hr.employees.salary%TYPE,
                         p_job_id OUT hr.employees.job_id%TYPE);

  FUNCTION get_employee(p_emp_id hr.employees.employee_id%TYPE)
    RETURN hr.employees%ROWTYPE;

  FUNCTION get_employee(p_family_name hr.employees.last_name%TYPE)
    RETURN hr.employees%ROWTYPE;

  PROCEDURE print_employee(rec_employee hr.employees%ROWTYPE); 

END emp_pkg;

--package body

CREATE OR REPLACE PACKAGE BODY emp_pkg IS

  FUNCTION valid_deptid(p_deptid hr.employees.department_id%TYPE) RETURN BOOLEAN IS
    v_valid_deptid hr.departments.department_id%TYPE;
  BEGIN
    SELECT department_id
    INTO   v_valid_deptid
    FROM   hr.departments
    WHERE  department_id = p_deptid;
    RETURN TRUE;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN FALSE;
  END valid_deptid;

  PROCEDURE add_employee(p_first_name hr.employees.first_name%TYPE,
                         p_last_name  hr.employees.last_name%TYPE,
                         p_email      hr.employees.email%TYPE,
                         p_job        hr.employees.job_id%TYPE DEFAULT 'SA_REP',
                         p_mgr        hr.employees.manager_id%TYPE DEFAULT 145,
                         p_sal        hr.employees.salary%TYPE DEFAULT 1000,
                         p_comm       hr.employees.commission_pct%TYPE DEFAULT 0,
                         p_deptid     hr.employees.department_id%TYPE DEFAULT 30) IS
  BEGIN
    IF valid_deptid(p_deptid) THEN
      INSERT INTO emp
        (employee_id,
         first_name,
         last_name,
         email,
         hire_date,
         job_id,
         manager_id,
         salary,
         commission_pct,
         department_id)
      VALUES
        (employees_seq.NEXTVAL,
         p_first_name,
         p_last_name,
         p_email,
         TRUNC(SYSDATE),
         p_job,
         p_mgr,
         p_sal,
         p_comm,
         p_deptid);
    ELSE
      RAISE_APPLICATION_ERROR(-20200,
                              'The informed department ID is invalid');
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END add_employee;

  PROCEDURE get_employee(p_id     IN hr.employees.employee_id%TYPE,
                         p_salary OUT hr.employees.salary%TYPE,
                         p_job_id OUT hr.employees.job_id%TYPE) IS
  BEGIN
    SELECT salary,
           job_id
    INTO   p_salary,
           p_job_id
    FROM   hr.employees
    WHERE  employee_id = p_id;
  END get_employee;

  PROCEDURE add_employee(p_first_name hr.employees.first_name%TYPE,
                         p_last_name  hr.employees.last_name%TYPE,
                         p_deptid     hr.employees.department_id%TYPE DEFAULT 30) IS
    p_email hr.employees.email%TYPE;
  BEGIN
    p_email := UPPER(SUBSTR(p_first_name, 1, 1) ||
                     SUBSTR(p_last_name, 1, 7));
    add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
  END;

  FUNCTION get_employee(p_emp_id hr.employees.employee_id%TYPE)
    RETURN hr.employees%ROWTYPE IS
    rec_employee hr.employees%ROWTYPE;
  BEGIN
    SELECT *
    INTO   rec_employee
    FROM   hr.employees
    WHERE  employee_id = p_emp_id;
  
    RETURN rec_employee;
  END get_employee;

  FUNCTION get_employee(p_family_name hr.employees.last_name%TYPE)
    RETURN hr.employees%ROWTYPE IS
    rec_employee hr.employees%ROWTYPE;
  BEGIN
    SELECT *
    INTO   rec_employee
    FROM   hr.employees
    WHERE  last_name = p_family_name;
  
    RETURN rec_employee;
  END get_employee;

  PROCEDURE print_employee(rec_employee hr.employees%ROWTYPE) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(rec_employee.department_id || ' ' ||
                         rec_employee.employee_id || ' ' ||
                         rec_employee.first_name || ' ' ||
                         rec_employee.last_name || ' ' || 
                         rec_employee.job_id || ' ' ||
                         rec_employee.salary);
  END print_employee;

END emp_pkg;

EXECUTE emp_pkg.get_employee(100);

SELECT * 
FROM emp 
WHERE department_id = 30;
