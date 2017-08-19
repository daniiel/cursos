CREATE OR REPLACE PACKAGE dept_pkg IS
  PROCEDURE add_department(p_deptno departments.department_id%TYPE,
                           p_name departments.department_name%TYPE :='unknown',
                           p_loc  departments.location_id%TYPE := 1700);

  PROCEDURE add_department(p_name departments.department_name%TYPE := 'unknown',
                           p_loc  departments.location_id%TYPE := 1700);
END dept_pkg;
/
