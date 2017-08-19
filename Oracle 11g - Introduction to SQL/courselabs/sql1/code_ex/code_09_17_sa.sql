UPDATE   employees
SET      job_id  = (SELECT  job_id 
                    FROM    employees 
                    WHERE   employee_id = 205), 
         salary  = (SELECT  salary 
                    FROM    employees 
                    WHERE   employee_id = 205) 
WHERE    employee_id    =  113;
