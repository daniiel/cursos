SET SERVEROUTPUT ON

DECLARE
   TYPE location_type IS TABLE OF locations.city%TYPE;
    offices location_type;
    table_count NUMBER;
BEGIN
   offices := location_type('Bombay', 'Tokyo','Singapore', 'Oxford');
   FOR i in 1..offices.count() LOOP
     DBMS_OUTPUT.PUT_LINE(offices(i));
   END LOOP;
END;
/