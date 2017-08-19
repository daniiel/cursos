SELECT last_name,manager_id,department_id
FROM employees
WHERE (manager_id,department_id) IN (SELECT manager_id,department_id FROM employees WHERE last_name in ('Gietz','Whalen'));