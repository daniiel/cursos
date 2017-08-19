CREATE OR REPLACE PROCEDURE add_job (
  p_jobid jobs.job_id%TYPE,
  p_jobtitle jobs.job_title%TYPE) IS
BEGIN
  INSERT INTO jobs (job_id, job_title)
  VALUES (p_jobid, p_jobtitle);
  COMMIT;
END add_job;
/
