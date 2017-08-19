SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE get_departments(p_loc NUMBER,p_nrows NUMBER) IS
  CURSOR dept_csr IS SELECT * 
  FROM departments
  WHERE location_id = p_loc;                         
  TYPE dept_tabtype IS TABLE OF dept_csr%ROWTYPE;
  depts dept_tabtype;
BEGIN
  OPEN dept_csr;
  FETCH dept_csr BULK COLLECT INTO depts LIMIT p_nrows;
  CLOSE dept_csr;
  DBMS_OUTPUT.PUT_LINE(depts.COUNT||' rows read');
END;
/