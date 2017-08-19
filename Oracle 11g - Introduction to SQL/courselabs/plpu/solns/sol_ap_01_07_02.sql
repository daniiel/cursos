SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE('Employee 176 worked on ' ||
     get_job_count(176) || ' different jobs.');
END;
/
