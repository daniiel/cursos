SET SERVEROUTPUT ON

DECLARE
myage number:=31;
BEGIN
IF myage < 11
 THEN
    DBMS_OUTPUT.PUT_LINE(' I am a child ');  
END IF;
END;
/
