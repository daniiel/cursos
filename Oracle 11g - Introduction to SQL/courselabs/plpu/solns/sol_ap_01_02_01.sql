CREATE OR REPLACE PROCEDURE new_job(
  p_jobid  IN jobs.job_id%TYPE,
  p_title  IN jobs.job_title%TYPE,
  v_minsal IN jobs.min_salary%TYPE) IS
  v_maxsal  jobs.max_salary%TYPE := 2 * v_minsal;
BEGIN
  INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
  VALUES (p_jobid, p_title, v_minsal, v_maxsal);
  DBMS_OUTPUT.PUT_LINE ('New row added to JOBS table:');
  DBMS_OUTPUT.PUT_LINE (p_jobid || '  ' || p_title ||' '||
                        v_minsal || '  ' || v_maxsal);
END new_job;
/
SHOW ERRORS
