SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
FROM   employees e, departments d
WHERE  e.department_id = d.department_id;

