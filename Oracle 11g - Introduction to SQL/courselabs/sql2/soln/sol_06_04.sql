SELECT	last_name, job_id, salary
FROM	employees
WHERE	salary > ALL (SELECT	salary
		   FROM		employees
		   WHERE	job_id = 'SA_MAN')
ORDER BY salary DESC
/
