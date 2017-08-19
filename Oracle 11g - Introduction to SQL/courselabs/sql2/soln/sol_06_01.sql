SELECT	last_name, department_id, salary
FROM	employees
WHERE	(salary, department_id) IN (SELECT salary, department_id
			  FROM		employees
			  WHERE		commission_pct IS NOT NULL)
/
