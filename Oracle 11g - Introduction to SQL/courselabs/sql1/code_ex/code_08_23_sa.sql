SELECT employee_id
FROM   employees
MINUS
SELECT employee_id
FROM   job_history;
