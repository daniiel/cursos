SET SERVEROUTPUT ON
DECLARE
	v_YEAR NUMBER(4) := &P_YEAR;
	v_REMAINDER1 NUMBER(5,2);
	v_REMAINDER2 NUMBER(5,2);
	v_REMAINDER3 NUMBER(5,2);
BEGIN
 	v_REMAINDER1 := MOD(v_YEAR,4);
	v_REMAINDER2 := MOD(v_YEAR,100);
	v_REMAINDER3 := MOD(v_YEAR,400);
	IF ((v_REMAINDER1 = 0 AND v_REMAINDER2 <> 0 ) OR v_REMAINDER3 = 0) THEN	
		DBMS_OUTPUT.PUT_LINE(v_YEAR || ' is a leap year');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_YEAR || ' is not a leap year');		
	END IF;
END;
/