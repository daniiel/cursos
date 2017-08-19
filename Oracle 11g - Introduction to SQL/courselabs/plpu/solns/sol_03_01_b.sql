CREATE OR REPLACE PACKAGE BODY job_pkg IS
  PROCEDURE add_job ( 
    p_jobid jobs.job_id%TYPE, 
    p_jobtitle jobs.job_title%TYPE) IS 
  BEGIN 
    INSERT INTO jobs (job_id, job_title) 
    VALUES (p_jobid, p_jobtitle); 
    COMMIT; 
  END add_job; 

  PROCEDURE del_job (p_jobid jobs.job_id%TYPE) IS 
    BEGIN 
      DELETE FROM jobs 
      WHERE job_id = p_jobid; 
      IF SQL%NOTFOUND THEN 
        RAISE_APPLICATION_ERROR(-20203, 'No jobs deleted.'); 
      END IF; 
    END DEL_JOB; 

  FUNCTION get_job (p_jobid IN jobs.job_id%type) 
    RETURN jobs.job_title%type IS 
    v_title jobs.job_title%type; 
    BEGIN 
      SELECT job_title 
      INTO v_title 
      FROM jobs 
      WHERE job_id = p_jobid; 
      RETURN v_title; 
    END get_job; 

  PROCEDURE upd_job( 
    p_jobid IN jobs.job_id%TYPE, 
    p_jobtitle IN jobs.job_title%TYPE) IS 
    BEGIN 
      UPDATE jobs 
      SET job_title = p_jobtitle 
      WHERE job_id = p_jobid; 
      IF SQL%NOTFOUND THEN 
        RAISE_APPLICATION_ERROR(-20202, 'No job updated.'); 
      END IF; 
    END upd_job; 

END job_pkg;
/
SHOW ERRORS

