SELECT   d.*,e.last_name, e.salary
FROM	 departments d, employees e
WHERE	 d.department_id = e.department_id
ORDER BY d.department_id
/
