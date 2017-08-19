SELECT	e.last_name, d.department_name, e.salary
FROM	employees e, departments d
WHERE	e.department_id = d.department_id
AND	(salary, NVL(commission_pct,0)) IN 
                               (SELECT	salary, NVL(commission_pct,0)
			       FROM	employees e, departments  d
			       WHERE	e.department_id = d.department_id
			       AND	d.location_id = 1700)
/
