CREATE OR REPLACE PACKAGE BODY empjob_pkg IS 
  PROCEDURE add_job_hist( 
    p_emp_id IN employees.employee_id%TYPE, 
    p_new_jobid IN jobs.job_id%TYPE) IS 
  BEGIN 
    INSERT INTO job_history 
      SELECT employee_id, hire_date, SYSDATE, job_id, department_id 
      FROM employees 
      WHERE employee_id = p_emp_id;
    UPDATE employees 
      SET hire_date = SYSDATE, 
          job_id = p_new_jobid, 
          salary = (SELECT min_salary + 500 
                    FROM jobs 
          WHERE job_id = p_new_jobid) 
      WHERE employee_id = p_emp_id; 
    DBMS_OUTPUT.PUT_LINE ('Added employee ' || p_emp_id || 
       ' details to the JOB_HISTORY table'); 
    DBMS_OUTPUT.PUT_LINE ('Updated current job of employee ' || 
       p_emp_id|| ' to '|| p_new_jobid); 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR (-20001, 'Employee does not exist!'); 
  END add_job_hist; 
 
  FUNCTION get_job_count( 
    p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER IS 
    v_jobtab jobs_table_type; 
    CURSOR c_empjob_csr IS 
      SELECT job_id 
      FROM job_history 
      WHERE employee_id = p_emp_id 
      UNION 
      SELECT job_id
      FROM employees 
      WHERE employee_id = p_emp_id; 
  BEGIN 
    OPEN c_empjob_csr; 
    FETCH c_empjob_csr BULK COLLECT INTO v_jobtab; 
    CLOSE c_empjob_csr; 
    RETURN v_jobtab.count; 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR(-20348, 
        'Employee with ID '|| p_emp_id ||' does not exist!');
      RETURN 0;
  END get_job_count; 
 
  FUNCTION get_years_service( 
    p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER IS 
    CURSOR c_jobh_csr IS 
      SELECT MONTHS_BETWEEN(end_date, start_date)/12 v_years_in_job 
      FROM job_history 
      WHERE employee_id = p_emp_id; 
    v_years_service NUMBER(2) := 0; 
    v_years_in_job NUMBER(2) := 0; 
  BEGIN 
    FOR jobh_rec IN c_jobh_csr 
    LOOP 
      EXIT WHEN c_jobh_csr%NOTFOUND; 
      v_years_service := v_years_service + jobh_rec.v_years_in_job; 
    END LOOP; 
    SELECT MONTHS_BETWEEN(SYSDATE, hire_date)/12 INTO v_years_in_job 
    FROM employees 
    WHERE employee_id = p_emp_id; 
    v_years_service := v_years_service + v_years_in_job; 
    RETURN ROUND(v_years_service); 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR(-20348, 
        'Employee with ID '|| p_emp_id ||' does not exist.'); 
      RETURN 0;
  END get_years_service; 
 
  PROCEDURE new_job( 
    p_jobid IN jobs.job_id%TYPE, 
    p_title IN jobs.job_title%TYPE, 
    p_minsal IN jobs.min_salary%TYPE) IS 
    v_maxsal jobs.max_salary%TYPE := 2 * p_minsal; 
  BEGIN 
    INSERT INTO jobs(job_id, job_title, min_salary, max_salary) 
    VALUES (p_jobid, p_title, p_minsal, v_maxsal); 
    DBMS_OUTPUT.PUT_LINE ('New row added to JOBS table:'); 
    DBMS_OUTPUT.PUT_LINE (p_jobid || ' ' || p_title ||' '||
                          p_minsal || ' ' || v_maxsal); 
  END new_job; 

  PROCEDURE upd_jobsal( 
    p_jobid IN jobs.job_id%type, 
    p_new_minsal IN jobs.min_salary%type, 
    p_new_maxsal IN jobs.max_salary%type) IS 
    v_dummy PLS_INTEGER; 
    e_resource_busy EXCEPTION; 
    e_sal_error EXCEPTION; 
    PRAGMA EXCEPTION_INIT (e_resource_busy , -54); 
  BEGIN 
    IF (p_new_maxsal < p_new_minsal) THEN 
      RAISE e_sal_error; 
    END IF; 
    SELECT 1 INTO v_dummy 
    FROM jobs 
    WHERE job_id = p_jobid 
    FOR UPDATE OF min_salary NOWAIT; 
    UPDATE jobs 
      SET min_salary = p_new_minsal, 
          max_salary = p_new_maxsal 
    WHERE job_id = p_jobid; 
  EXCEPTION 
    WHEN e_resource_busy THEN 
      RAISE_APPLICATION_ERROR (-20001, 
        'Job information is currently locked, try later.'); 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR(-20001, 'This job ID does not exist'); 
    WHEN e_sal_error THEN 
      RAISE_APPLICATION_ERROR(-20001, 
        'Data error: Max salary should be more than min salary'); 
  END upd_jobsal;  
END empjob_pkg; 
/ 
SHOW ERRORS 
