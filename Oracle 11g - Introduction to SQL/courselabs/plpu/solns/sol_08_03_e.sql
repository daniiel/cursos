UPDATE employees
  set job_id = 'ST_MAN'
WHERE employee_id = (SELECT employee_id 
                     FROM employees 
                     WHERE last_name = 'Beh');
