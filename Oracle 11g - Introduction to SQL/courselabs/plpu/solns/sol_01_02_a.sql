CREATE OR REPLACE PROCEDURE upd_job(
  p_jobid IN jobs.job_id%TYPE,
  p_jobtitle IN jobs.job_title%TYPE) IS
BEGIN
  UPDATE jobs
  SET    job_title = p_jobtitle
  WHERE  job_id = p_jobid;
  IF SQL%NOTFOUND THEN
    RAISE_APPLICATION_ERROR(-20202, 'No job updated.');
  END IF;
END upd_job;
/
