CREATE OR REPLACE PACKAGE emp_pkg IS
  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_email employees.email%TYPE, 
    p_job employees.job_id%TYPE DEFAULT 'SA_REP', 
    p_mgr employees.manager_id%TYPE DEFAULT 145, 
    p_sal employees.salary%TYPE DEFAULT 1000, 
    p_comm employees.commission_pct%TYPE DEFAULT 0, 
    p_deptid employees.department_id%TYPE DEFAULT 30);

  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_deptid employees.department_id%TYPE);

PROCEDURE get_employee(
    p_empid IN employees.employee_id%TYPE, 
    p_sal OUT employees.salary%TYPE, 
    p_job OUT employees.job_id%TYPE);

/* New overloaded get_employees functions specs starts here: */

  FUNCTION get_employee(p_emp_id employees.employee_id%type)
    return employees%rowtype;
  
  FUNCTION get_employee(p_family_name employees.last_name%type)
    return employees%rowtype;

/* New overloaded get_employees functions specs ends here. */

END emp_pkg;
/
SHOW ERRORS

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
  FUNCTION valid_deptid(p_deptid IN departments.department_id%TYPE) RETURN BOOLEAN IS 
    v_dummy PLS_INTEGER; 
  BEGIN 
    SELECT 1 
    INTO v_dummy 
    FROM departments 
    WHERE department_id = p_deptid; 
    RETURN TRUE; 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
    RETURN FALSE; 
END valid_deptid; 

  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_email employees.email%TYPE, 
    p_job employees.job_id%TYPE DEFAULT 'SA_REP', 
    p_mgr employees.manager_id%TYPE DEFAULT 145, 
    p_sal employees.salary%TYPE DEFAULT 1000, 
    p_comm employees.commission_pct%TYPE DEFAULT 0, 
    p_deptid employees.department_id%TYPE DEFAULT 30) IS 
  BEGIN 
    IF valid_deptid(p_deptid) THEN 
      INSERT INTO employees(employee_id, first_name, last_name, email, 
        job_id, manager_id, hire_date, salary, commission_pct, department_id) 
      VALUES (employees_seq.NEXTVAL, p_first_name, p_last_name, p_email, 
        p_job, p_mgr, TRUNC(SYSDATE), p_sal, p_comm, p_deptid); 
    ELSE 
      RAISE_APPLICATION_ERROR (-20204, 'Invalid department ID. Try again.'); 
    END IF; 
  END add_employee; 
  
  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_deptid employees.department_id%TYPE) IS
    p_email employees.email%type;
  BEGIN
    p_email := UPPER(SUBSTR(p_first_name, 1, 1)||SUBSTR(p_last_name, 1, 7));
    add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
  END;

  PROCEDURE get_employee(
    p_empid IN employees.employee_id%TYPE, 
    p_sal OUT employees.salary%TYPE, 
    p_job OUT employees.job_id%TYPE) IS 
  BEGIN 
    SELECT salary, job_id 
    INTO p_sal, p_job 
    FROM employees 
    WHERE employee_id = p_empid; 
  END get_employee; 

/* New get_employee function declaration starts here */

FUNCTION get_employee(p_emp_id employees.employee_id%type)
    return employees%rowtype IS
    rec_emp employees%rowtype;
  BEGIN
    SELECT * INTO rec_emp
    FROM employees
    WHERE employee_id = p_emp_id;
    RETURN rec_emp;
  END;

  FUNCTION get_employee(p_family_name employees.last_name%type)
    return employees%rowtype IS
    rec_emp employees%rowtype;
  BEGIN
    SELECT * INTO rec_emp
    FROM employees
    WHERE last_name = p_family_name;
    RETURN rec_emp;
  END;

/* New overloaded get_employee function declaration ends here */

END emp_pkg;
/
SHOW ERRORS