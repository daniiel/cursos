SELECT employee_id, last_name, department_id
FROM    employees
WHERE department_id IN ( SELECT department_id
		  FROM departments
		  WHERE location_id IN  ( SELECT  location_id
			            FROM locations
			            WHERE city LIKE  'T%'))
/
