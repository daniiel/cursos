-- You must run code_01_32_as.sql before running this code example. 

EXECUTE add_dept
EXECUTE add_dept ('ADVERTISING', p_loc => 1200)
EXECUTE add_dept (p_loc => 1200)

SELECT *
FROM departments;
