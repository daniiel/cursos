VARIABLE b_emp_salary NUMBER
BEGIN
   SELECT salary  INTO :b_emp_salary 
   FROM  employees WHERE employee_id = 178;  
END;
/
Print b_emp_salary
SELECT first_name, last_name
FROM  employees
WHERE salary = :b_emp_salary;


