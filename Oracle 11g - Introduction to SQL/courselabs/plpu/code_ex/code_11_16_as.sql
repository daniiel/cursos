-- Run code_11_15_s.sql before running this code example. 

CREATE OR REPLACE PROCEDURE circle_area(p_radius my_pkg.my_real) IS
  v_my_area my_pkg.my_real;
  v_my_datatype VARCHAR2(30);
BEGIN
  v_my_area := my_pkg.my_pi * p_radius * p_radius;
  DBMS_OUTPUT.PUT_LINE('Radius: ' || TO_CHAR(p_radius) 
                       || ' Area: ' || TO_CHAR(v_my_area) );
  $IF $$my_debug $THEN -- if my_debug is TRUE, run some debugging code
    SELECT DATA_TYPE INTO v_my_datatype FROM USER_ARGUMENTS 
       WHERE OBJECT_NAME = 'CIRCLE_AREA' AND ARGUMENT_NAME = 'RADIUS';
     DBMS_OUTPUT.PUT_LINE('Datatype of the RADIUS argument is: ' || v_my_datatype);
  $END
END; 
/
