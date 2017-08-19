SELECT * FROM jobs
WHERE job_id = 'SY_ANAL';

SELECT employee_id, last_name, salary
FROM  employees
WHERE job_id = 'SY_ANAL';

UPDATE jobs 
  SET min_salary = 5000, max_salary = 7000 
  WHERE job_id = 'SY_ANAL';

SELECT * FROM jobs
WHERE job_id = 'SY_ANAL';

