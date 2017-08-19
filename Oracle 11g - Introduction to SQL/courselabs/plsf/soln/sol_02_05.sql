VARIABLE b_basic_percent NUMBER
VARIABLE b_pf_percent NUMBER

DECLARE
   v_today DATE:=SYSDATE;
   v_tomorrow v_today%TYPE;
BEGIN
   :b_basic_percent:=45;
   :b_pf_percent:=12;

   v_tomorrow:=v_today +1;
   DBMS_OUTPUT.PUT_LINE(' Hello World ');
   DBMS_OUTPUT.PUT_LINE('TODAY IS : '|| v_today);
   DBMS_OUTPUT.PUT_LINE('TOMORROW IS : ' || v_tomorrow);
END;
/
PRINT b_basic_percent
PRINT b_pf_percent

-- You can use a single PRINT command without any parameters to print all 
-- bind variables.




