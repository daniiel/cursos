SELECT	last_name, hire_date, salary
FROM	employees
WHERE	(salary, NVL(commission_pct,0)) IN 
			      (SELECT	salary, NVL(commission_pct,0)
			      FROM	employees
			      WHERE	last_name = 'Kochhar')
AND	last_name != 'Kochhar'
/
