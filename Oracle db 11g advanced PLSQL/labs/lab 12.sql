--12_06
CREATE OR REPLACE PROCEDURE get_income_level (p_email VARCHAR2 DEFAULT NULL)
IS
  TYPE      cv_custtyp IS REF CURSOR;
  cv        cv_custtyp;
  v_income  customers.income_level%TYPE;
  v_stmt    VARCHAR2(400);
BEGIN
  v_stmt := 'SELECT income_level FROM customers WHERE cust_email = ''' || p_email || '''';
  DBMS_OUTPUT.PUT_LINE('SQL statement: ' || v_stmt);
  OPEN cv  FOR v_stmt;
  LOOP
    FETCH cv INTO v_income;
    EXIT WHEN cv%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Income level is: ' || v_income);
  END LOOP;
  CLOSE cv;
EXCEPTION 
  WHEN OTHERS THEN
    dbms_output.put_line(sqlerrm);
    dbms_output.put_line('SQL statement: ' || v_stmt);
END get_income_level;
/

--12_06_b
EXEC get_income_level('Sean.Olin@SCAUP.COM');

-- SQL injection
EXEC get_income_level('x'' union select username from all_users where ''x''=''x' );

--12_07 codigo que evita el SQL injection
CREATE OR REPLACE PROCEDURE get_income_level (p_email VARCHAR2 DEFAULT NULL) 
AS
BEGIN
  FOR i IN (SELECT income_level FROM customers WHERE cust_email = p_email) LOOP
    DBMS_OUTPUT.PUT_LINE('Income level is: ' || i.income_level);
  END LOOP;
END get_income_level;
/


