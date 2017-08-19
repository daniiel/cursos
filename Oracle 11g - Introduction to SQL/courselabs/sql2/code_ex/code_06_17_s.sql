SELECT last_name, salary, department_id
FROM   employees outer
WHERE  salary > (SELECT AVG(salary)
          FROM   employees
          WHERE  department_id =  
          outer.department_id);