SET SERVEROUTPUT ON

DECLARE
	v_custid	NUMBER(4) := 1600;
	v_custname	VARCHAR2(300) := 'Women Sports Club';
	v_new_custid	NUMBER(3) :=500;
BEGIN
				
	  DECLARE
		  v_custid	  NUMBER(4) := 0;
		  v_custname      VARCHAR2(300) := 'Shape up Sports Club';
		  v_new_custid	  NUMBER(3) := 300;
		  v_new_custname	  VARCHAR2(300) := 'Jansports Club';
	 
  	  BEGIN
		  v_custid := v_new_custid;
		  v_custname := v_custname || ' ' ||  v_new_custname;
		  DBMS_OUTPUT.PUT_LINE('v_custid in the sub block is  ' || v_custid);
		  DBMS_OUTPUT.PUT_LINE('v_custname  in the sub block ' || v_custname);
		 DBMS_OUTPUT.PUT_LINE('v_new_custname in the sub block ' || v_new_custname);
  	  END;
v_custid := (v_custid *12) / 10;

DBMS_OUTPUT.PUT_LINE('v_new_custid  in the main block ' || v_new_custid);
DBMS_OUTPUT.PUT_LINE('v_custid in the main block ' || v_custid);
DBMS_OUTPUT.PUT_LINE('v_custname in the main block ' || v_custname);
END;
/
