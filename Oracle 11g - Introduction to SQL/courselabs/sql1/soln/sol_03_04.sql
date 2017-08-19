SELECT  employee_id, last_name, salary, 
        ROUND(salary * 1.155, 0) "New Salary",
        ROUND(salary * 1.155, 0) - salary "Increase" 
FROM    employees;
