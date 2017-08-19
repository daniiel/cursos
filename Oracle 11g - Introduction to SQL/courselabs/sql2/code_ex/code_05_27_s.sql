 SELECT hire_date, 
       hire_date + TO_YMINTERVAL('01-02') AS        HIRE_DATE_YMININTERVAL
 FROM   employees WHERE department_id = 20; 