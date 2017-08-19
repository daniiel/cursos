SELECT last_name, job_id
   FROM   employees
   WHERE  job_id =
                   (SELECT job_id
                    FROM   employees
                    WHERE  employee_id = 141);
