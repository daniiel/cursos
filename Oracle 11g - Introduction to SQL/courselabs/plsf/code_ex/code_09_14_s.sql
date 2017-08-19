SET SERVEROUTPUT ON

BEGIN
 IF (check_sal IS NULL) THEN
   DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
 ELSIF (check_sal) THEN  
   DBMS_OUTPUT.PUT_LINE('Salary > average');
 ELSE
   DBMS_OUTPUT.PUT_LINE('Salary < average');
 END IF;
END;
/