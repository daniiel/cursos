SELECT department_id, job_id, COUNT(last_name)
FROM   employees
GROUP BY department_id;
