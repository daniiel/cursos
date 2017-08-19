-- You must run code_01_24_as.sql before running this code example. 

CREATE OR REPLACE PROCEDURE process_employees
IS
   CURSOR cur_emp_cursor IS
      SELECT employee_id
      FROM   employees;
BEGIN
   FOR emp_rec IN cur_emp_cursor 
   LOOP
     raise_salary(emp_rec.employee_id, 10);
   END LOOP;    
   COMMIT;
END process_employees;
/
