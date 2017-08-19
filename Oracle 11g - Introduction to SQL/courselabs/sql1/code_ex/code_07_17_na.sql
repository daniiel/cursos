SELECT last_name, salary, department_id
   FROM   employees
   WHERE  salary IN (SELECT   MIN(salary)
                     FROM     employees
                     GROUP BY department_id);
