-- Run code_10_35_bn.sql before running this code example. 

CREATE OR REPLACE PROCEDURE p(i IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO t(col_a) VALUES (i);
  EXCEPTION
    WHEN OTHERS THEN null;
  END p;
/
ALTER PROCEDURE P COMPILE
  PLSQL_warnings = 'enable:all' REUSE SETTINGS;
