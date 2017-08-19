-- This code example will result an integrity constraint error. 

UPDATE employees SET department_id = 999 
 WHERE employee_id = 170;  
