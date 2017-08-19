SET SERVEROUTPUT ON

DECLARE
 v_salary NUMBER(6):=6000;
 v_sal_hike VARCHAR2(5):='1000';
 v_total_salary v_salary%TYPE;
BEGIN
 v_total_salary:=v_salary+v_sal_hike;
 DBMS_OUTPUT.PUT_LINE(v_total_salary);
END;
/
