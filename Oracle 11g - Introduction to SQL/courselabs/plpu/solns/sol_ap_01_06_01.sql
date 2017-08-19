CREATE OR REPLACE FUNCTION get_years_service(
  p_emp_empid_type IN employees.employee_id%TYPE) RETURN NUMBER IS
  CURSOR c_jobh_csr IS 
    SELECT MONTHS_BETWEEN(end_date, start_date)/12 v_years_in_job
    FROM   job_history
    WHERE  employee_id = p_emp_empid_type;
  v_years_service NUMBER(2) := 0;
  v_years_in_job  NUMBER(2) := 0;
BEGIN
  FOR jobh_rec IN c_jobh_csr
  LOOP
    EXIT WHEN c_jobh_csr%NOTFOUND;
    v_years_service := v_years_service + jobh_rec.v_years_in_job;
  END LOOP;
  SELECT MONTHS_BETWEEN(SYSDATE, hire_date)/12 INTO v_years_in_job
  FROM   employees
  WHERE  employee_id = p_emp_empid_type;
  v_years_service := v_years_service + v_years_in_job;
  RETURN ROUND(v_years_service);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20348, 
      'Employee with ID '|| p_emp_empid_type ||' does not exist.');
    RETURN NULL;
END get_years_service;
/
SHOW ERRORS
