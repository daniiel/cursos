SELECT	 job_id, SUM(salary) PAYROLL
FROM	 employees
WHERE	 job_id <> 'AD_PRES'
GROUP BY job_id
ORDER BY payroll
/
