REM
REM Note: Using the PUT_LINE is more natural for PL/SQL developers.
REM However, the orginal examples of using PUTF are shown in comments.
REM
CREATE OR REPLACE PROCEDURE sal_status(p_dir IN VARCHAR2, p_filename IN VARCHAR2) IS
  f_file UTL_FILE.FILE_TYPE;
  CURSOR cur_emp IS
    SELECT last_name, salary, department_id
    FROM employees ORDER BY department_id;
 v_newdeptno employees.department_id%TYPE;
 v_olddeptno employees.department_id%TYPE := 0;
BEGIN
  f_file:= UTL_FILE.FOPEN (p_dir, p_filename, 'W');
  UTL_FILE.PUT_LINE(f_file, 'REPORT: GENERATED ON ' ||SYSDATE);
  UTL_FILE.NEW_LINE (f_file);
  FOR emp_rec IN cur_emp LOOP
    IF emp_rec.department_id <> v_olddeptno THEN
      /*
       * UTL_FILE.PUTF (file, 'DEPARTMENT: %s\n', emp_rec.department_id);
       */
      UTL_FILE.PUT_LINE (f_file, 'DEPARTMENT: ' || emp_rec.department_id);
 UTL_FILE.NEW_LINE (f_file);
    END IF;
    /*
     * UTL_FILE.PUTF (f_file,'  EMPLOYEE: %s earns: %s\n',
     *  emp_rec.last_name, emp_rec.salary);
     */
     UTL_FILE.PUT_LINE (f_file,'  EMPLOYEE: ' || emp_rec.last_name || 
                         ' earns: ' || emp_rec.salary);
     v_olddeptno := emp_rec.department_id;
     UTL_FILE.NEW_LINE (f_file);
  END LOOP;
  UTL_FILE.PUT_LINE(f_file,'*** END OF REPORT ***');
  UTL_FILE.FCLOSE (f_file);
EXCEPTION
 WHEN UTL_FILE.INVALID_FILEHANDLE THEN
   RAISE_APPLICATION_ERROR(-20001,'Invalid File.');
 WHEN UTL_FILE.WRITE_ERROR THEN
   RAISE_APPLICATION_ERROR (-20002, 'Unable to write to file');
END sal_status;
/
