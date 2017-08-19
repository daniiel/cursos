SELECT  e.last_name, e.department_id,
           d.department_name
   FROM   employees e, departments d
   WHERE  e.department_id = d.department_id
   AND    last_name = 'Matos';
