-- You must run code_02_18_cn.sql before attempting to run this code example.
-- This code example generates an expected error message. 

UPDATE employees SET salary = query_call_sql(100)
WHERE employee_id = 170;
