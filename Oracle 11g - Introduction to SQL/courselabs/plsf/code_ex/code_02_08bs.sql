SET SERVEROUTPUT ON

DECLARE
  v_myName VARCHAR(20):= 'John';
BEGIN
  v_myName:= 'Steven';
  DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName);
END; 
/