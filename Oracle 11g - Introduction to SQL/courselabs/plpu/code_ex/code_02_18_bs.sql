-- You must run code_02_18_as.sql before attempting to run this code example.
-- This code example generates an expected error message. 

UPDATE employees
  SET salary = dml_call_sql(2000)
WHERE employee_id = 170;
