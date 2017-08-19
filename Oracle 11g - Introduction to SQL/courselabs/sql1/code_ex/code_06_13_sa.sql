SELECT employee_id, last_name, 
       location_id, department_id
FROM   employees JOIN departments
USING (department_id) ;


