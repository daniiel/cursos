-- Run code_04_6_s.sql before running this code example. 

CREATE OR REPLACE PACKAGE BODY dept_pkg
IS
PROCEDURE add_department 
  (
    p_deptno departments.department_id%TYPE,
    p_name departments.department_name%TYPE := 'unknown',
    p_loc departments.location_id%TYPE      := 1700)
IS
BEGIN
  INSERT
  INTO departments
    (
      department_id,
      department_name,
      location_id
    )
    VALUES
    (
      p_deptno,
      p_name,
      p_loc
    );
END add_department;
PROCEDURE add_department 
  (
    p_name departments.department_name%TYPE := 'unknown',
    p_loc departments.location_id%TYPE      := 1700
  )
IS
BEGIN
  INSERT
  INTO departments
    (
      department_id,
      department_name,
      location_id
    )
    VALUES
    (
      departments_seq.NEXTVAL,
      p_name,
      p_loc
    );
END add_department;
END dept_pkg;
/