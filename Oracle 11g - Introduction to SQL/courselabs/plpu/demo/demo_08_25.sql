SET SERVEROUTPUT ON
SET ECHO ON

-- ensure the demo table is deleted prior to starting this demonstration
pause <press enter>
DROP TABLE employees_table;

pause <press enter>
-- create the table used for this demonstration
CREATE TABLE employees_table
    AS select  e.EMPLOYEE_ID   
        ,e.FIRST_NAME    
        ,e.LAST_NAME     
        ,e.SALARY        
        ,JOB_ID           
        ,j.MIN_SALARY    
        ,j.MAX_SALARY  
from employees e JOIN jobs j
USING (job_id);

pause <press enter>
-- add a check constraint to the demonstration table
ALTER TABLE employees_table
  ADD CONSTRAINT EMP_CHK_SALARY
  CHECK (SALARY <= MAX_SALARY);

pause <press enter>
-- create a trigger to restrict salaries to the 
-- maximum for their job title
CREATE OR REPLACE TRIGGER restrict_salary
  BEFORE UPDATE OF salary ON employees_table
  FOR EACH ROW 
  WHEN (NEW.salary > OLD.max_salary)
BEGIN
  :NEW.salary := :OLD.max_salary;
END;
/

DECLARE
-- define a record containing employee information
  TYPE EMP_REC IS RECORD 
        (
         EMPLOYEE_ID   employees.employee_id%TYPE
        ,FIRST_NAME    employees.first_name%TYPE
        ,LAST_NAME     employees.last_name%TYPE
        ,SALARY        employees.salary%TYPE
        ,JOB_ID        employees.job_id%TYPE        
        ,MIN_SALARY    jobs.min_salary%TYPE
        ,MAX_SALARY    jobs.min_salary%TYPE
       );
        
 l_ThisEmployee EMP_REC;
 l_counter BINARY_INTEGER := 1;

  TYPE list_of_employees_t IS TABLE OF l_ThisEmployee%TYPE
    INDEX BY PLS_INTEGER;
  list_of_employees list_of_employees_t; 
  
  BIG_RAISE NUMBER;
  i NUMBER;

BEGIN
  -- increase salary by 2000 - this will put some records over their maximum salary
  BIG_RAISE := 2000;
  -- build a record to hold information before putting it into a collection
  FOR emp_record IN (SELECT   e.EMPLOYEE_ID   
                             ,e.FIRST_NAME    
                             ,e.LAST_NAME     
                             ,e.SALARY        
                             ,JOB_ID        
                             ,j.MIN_SALARY    
                             ,j.MAX_SALARY  
                   FROM employees_table e JOIN jobs j
                   USING (job_id))
  LOOP  -- build the collection of records of employee, tracking their salary, min sal and max sal 
        -- for their job grade
     list_of_employees (l_counter) := emp_record;
     l_counter := l_counter + 1;
  END LOOP;

-- Let's see the values in our collection for raises that exceed the max salary for a job grade
-- this is for display purposes only
  i := list_of_employees.FIRST;
  WHILE (i IS NOT NULL)
    LOOP
      IF ((list_of_employees (i).SALARY + BIG_RAISE) > list_of_employees (i).MAX_SALARY) THEN
        dbms_output.put_line('employee OVER the limit: ' || list_of_employees (i).LAST_NAME  || '  '
                                          || list_of_employees (i).FIRST_NAME || '  '
                                          || list_of_employees (i).SALARY  || '  '
                                          || list_of_employees (i).MAX_SALARY  || '  ' );
      END IF;   
      i := list_of_employees.NEXT (i);
    END LOOP;   

-- Give everyone a BIG_RAISE - this will violate the check constraint EMP_CHK_SALARY for some records.
  i := list_of_employees.FIRST;
  WHILE (i IS NOT NULL)
     LOOP
       UPDATE  employees_table
       SET SALARY = list_of_employees (i).SALARY + BIG_RAISE
       WHERE EMPLOYEE_ID = list_of_employees (i).EMPLOYEE_ID;
       i := list_of_employees.NEXT (i);
   END LOOP;   

-- Let's list all the values in our collection. 
-- For employees whose raise exceeded the max salary, their salary is set to the max for their job grade
  i := list_of_employees.FIRST;
  WHILE (i IS NOT NULL)
    LOOP
      dbms_output.put_line('employee: ' || list_of_employees (i).LAST_NAME  || '  '
                                       || list_of_employees (i).FIRST_NAME || '  '
                                       || list_of_employees (i).SALARY  || '  '
                                       || list_of_employees (i).MAX_SALARY  || '  '  );  
      i := list_of_employees.NEXT (i);                       
    END LOOP;   
END;
/


