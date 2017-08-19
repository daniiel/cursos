SELECT employee_id, last_name, 
	(SELECT department_name
 	FROM departments d
 	WHERE   e.department_id =
d.department_id ) department
FROM employees e
ORDER BY department;