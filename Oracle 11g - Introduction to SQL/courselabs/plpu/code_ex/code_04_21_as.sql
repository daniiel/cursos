SET SERVEROUTPUT ON

EXECUTE curs_pkg.open
DECLARE
  v_more BOOLEAN := curs_pkg.next(3);
BEGIN
  IF NOT v_more THEN
    curs_pkg.close;
  END IF;
END;
/


