SELECT employee_id, job_id
FROM   job_history
MINUS
SELECT  employee_id, job_id
FROM   employees
/
