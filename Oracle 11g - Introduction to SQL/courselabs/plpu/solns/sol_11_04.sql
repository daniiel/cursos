DECLARE
-- the package_text variable contains the text to create the package spec and body
  package_text VARCHAR2(32767);
  FUNCTION generate_spec (pkgname VARCHAR2) RETURN VARCHAR2 AS
  BEGIN
     RETURN 'CREATE PACKAGE ' || pkgname || ' AS
       PROCEDURE raise_salary (emp_id NUMBER, amount NUMBER);
       PROCEDURE fire_employee (emp_id NUMBER);
       END ' || pkgname || ';';
  END generate_spec;
  FUNCTION generate_body (pkgname VARCHAR2) RETURN VARCHAR2 AS
  BEGIN
     RETURN 'CREATE PACKAGE BODY ' || pkgname || ' AS
       PROCEDURE raise_salary (emp_id NUMBER, amount NUMBER) IS
       BEGIN
UPDATE employees SET salary = salary + amount WHERE employee_id = emp_id;
       END raise_salary;
       PROCEDURE fire_employee (emp_id NUMBER) IS
       BEGIN
         DELETE FROM employees WHERE employee_id = emp_id;
       END fire_employee;
       END ' || pkgname || ';';
  END generate_body;

BEGIN

-- generate package spec
  package_text := generate_spec('emp_actions');  

-- create and wrap the package spec
  SYS.DBMS_DDL.CREATE_WRAPPED(package_text);  

-- generate package body
  package_text := generate_body('emp_actions');

-- create and wrap the package body
  SYS.DBMS_DDL.CREATE_WRAPPED(package_text); 
END;
/

-- call a procedure from the wrapped package

CALL emp_actions.raise_salary(120, 100);

-- Use the USER_SOURCE data dictionary view to verify that -- the code is hidden as follows: 

SELECT text FROM USER_SOURCE WHERE name = 'EMP_ACTIONS';
