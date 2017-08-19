CREATE OR REPLACE PROCEDURE upd_jobsal(
  p_jobid       IN jobs.job_id%type,
  p_new_minsal  IN jobs.min_salary%type,
  p_new_maxsal  IN jobs.max_salary%type) IS
  v_dummy            PLS_INTEGER;
  e_resource_busy  EXCEPTION;
  e_sal_error        EXCEPTION;
  PRAGMA           EXCEPTION_INIT (e_resource_busy , -54);
BEGIN
  IF (p_new_maxsal < p_new_minsal) THEN
    RAISE e_sal_error;
  END IF;
  SELECT 1 INTO v_dummy
    FROM jobs
    WHERE job_id = p_jobid
    FOR UPDATE OF min_salary NOWAIT;
  UPDATE jobs
    SET min_salary =  p_new_minsal,
        max_salary =  p_new_maxsal
    WHERE job_id  = p_jobid;
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
/
SHOW ERRORS
