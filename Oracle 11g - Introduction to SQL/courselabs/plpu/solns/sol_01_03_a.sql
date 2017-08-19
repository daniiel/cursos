CREATE OR REPLACE PROCEDURE del_job (p_jobid jobs.job_id%TYPE) IS
BEGIN
  DELETE FROM jobs
  WHERE  job_id = p_jobid;
  IF SQL%NOTFOUND THEN 
    RAISE_APPLICATION_ERROR(-20203, 'No jobs deleted.');
  END IF;
END DEL_JOB;
/