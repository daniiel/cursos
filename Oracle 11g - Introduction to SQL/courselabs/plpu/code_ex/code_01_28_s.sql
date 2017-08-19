  -- You must run code_01_25_as.sql before running this code example. 

VARIABLE b_name VARCHAR2(25)
VARIABLE b_sal NUMBER

EXECUTE query_emp(171, :b_name, :b_sal)

PRINT 