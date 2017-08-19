-- You must run code_01_40_as.sql before running this code example. 

CREATE PROCEDURE create_departments_noex IS
BEGIN
  add_department_noex('Media', 100, 1800);
  add_department_noex('Editing', 99, 1800);
  add_department_noex('Advertising', 101, 1800);
END;
/
EXECUTE create_departments_noex
