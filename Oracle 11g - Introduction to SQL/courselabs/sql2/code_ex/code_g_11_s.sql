COLUMN org_chart FORMAT A12
SELECT LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_') 
       AS org_chart
FROM   employees 
START WITH first_name='Steven' AND last_name='King' 
CONNECT BY PRIOR employee_id=manager_id;
