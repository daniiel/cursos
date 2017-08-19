SELECT employee_id, last_name
FROM employees e
 WHERE ((SELECT location_id
          FROM departments d
          WHERE e.department_id = d.department_id )
          IN   (SELECT location_id
                FROM locations l
                WHERE STATE_province =
               'California') );