-- Run code_07_07_as.sql before running this code example. 

BEGIN
  UPDATE employees
     SET salary  = salary + 200
  WHERE salary <= constant_pkg.c_min_sal;
END;
/
