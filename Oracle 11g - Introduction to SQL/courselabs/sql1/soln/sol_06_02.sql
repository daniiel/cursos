SELECT last_name, department_id, department_name
FROM   employees 
JOIN   departments 
USING (department_id);
