-- You must run code_02_08_as.sql before running this code example. 

VARIABLE b_salary NUMBER
EXECUTE :b_salary := get_sal(100)
PRINT b_salary
