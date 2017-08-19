CREATE OR REPLACE PACKAGE jobs_pkg IS
  PROCEDURE initialize;
  FUNCTION get_minsalary(p_jobid VARCHAR2) RETURN NUMBER;
  FUNCTION get_maxsalary(p_jobid VARCHAR2) RETURN NUMBER;
  PROCEDURE set_minsalary(p_jobid VARCHAR2, p_min_salary NUMBER);
  PROCEDURE set_maxsalary(p_jobid VARCHAR2, p_max_salary NUMBER);
END jobs_pkg;
/
SHOW ERRORS
