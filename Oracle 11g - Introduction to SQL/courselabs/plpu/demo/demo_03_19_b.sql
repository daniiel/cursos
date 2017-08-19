SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('The sales tax on $ 45.60 in Massachusetts is ' || 45.60 * state_tax.ma);
END;