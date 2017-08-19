CREATE OR REPLACE PACKAGE empjob_pkg IS 
  TYPE jobs_table_type IS TABLE OF jobs.job_id%type;

  PROCEDURE add_job_hist( 
     p_emp_id IN employees.employee_id%TYPE, 
     p_new_jobid IN jobs.job_id%TYPE);
  
  FUNCTION get_job_count( 
     p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER;
  
  FUNCTION get_years_service(  
     p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER;
  
  PROCEDURE new_job( 
    p_jobid IN jobs.job_id%TYPE, 
    p_title IN jobs.job_title%TYPE, 
    p_minsal IN jobs.min_salary%TYPE);
  
  PROCEDURE upd_jobsal( 
    p_jobid IN jobs.job_id%type, 
    p_new_minsal IN jobs.min_salary%type, 
    p_new_maxsal IN jobs.max_salary%type);
END empjob_pkg; 
/
SHOW ERRORS
