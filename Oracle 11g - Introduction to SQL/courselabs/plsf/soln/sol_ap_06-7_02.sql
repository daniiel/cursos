SET SERVEROUTPUT ON
DECLARE
TYPE Table_Ename
IS
  TABLE OF employees.last_name%TYPE INDEX BY BINARY_INTEGER;
TYPE Table_dept
IS
  TABLE OF employees.department_id%TYPE INDEX BY BINARY_INTEGER;
  Tename Table_Ename;
  Tdept Table_dept;
  i BINARY_INTEGER :=0;
  CURSOR Namedept
  IS
    SELECT last_name,department_id FROM employees WHERE employee_id < 115;
BEGIN
  FOR emprec IN Namedept
  LOOP
    i         := i +1;
    Tename(i) := emprec.last_name;
    Tdept(i)  := emprec.department_id;
    DBMS_OUTPUT.PUT_LINE ('Employee: ' || Tename(i) || ' is in department number: ' || Tdept(i));
  END LOOP;
END;
/