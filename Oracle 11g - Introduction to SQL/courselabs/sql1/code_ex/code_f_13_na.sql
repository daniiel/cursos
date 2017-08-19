SELECT e.last_name, d.department_name, l.city
   FROM   employees e, departments d, locations l
   WHERE  e.department_id = d.department_id
   AND    d.location_id = l.location_id;
