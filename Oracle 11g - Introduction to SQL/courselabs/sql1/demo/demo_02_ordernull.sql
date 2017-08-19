SELECT employee_id, job_id, salary, commission_pct
FROM employees
ORDER BY commission_pct DESC NULLS LAST;