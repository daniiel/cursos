SET SERVEROUTPUT ON

EXECUTE DBMS_OUTPUT.PUT_LINE(DBMS_WARNING.GET_CATEGORY(&message));