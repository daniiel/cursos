SELECT employee_id, salary, commission_pct, job_id
FROM employees  
WHERE job_id = 'SA_REP'
FOR UPDATE 
ORDER BY employee_id;
