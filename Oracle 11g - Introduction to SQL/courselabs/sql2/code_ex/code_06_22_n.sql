SELECT department_id, department_name
   FROM   departments 
   WHERE  department_id NOT IN (SELECT department_id
                                FROM   employees);