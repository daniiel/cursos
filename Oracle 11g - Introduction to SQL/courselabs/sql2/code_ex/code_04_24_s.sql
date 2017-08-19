--Execute demo_cre_emp_history.sql demo_cre_emp_sales.sql before executing this
INSERT  ALL
 WHEN HIREDATE < '01-JAN-95' THEN
   INTO emp_history VALUES(EMPID,HIREDATE,SAL)
 WHEN COMM IS NOT NULL THEN
   INTO emp_sales VALUES(EMPID,COMM,SAL)
   SELECT employee_id EMPID, hire_date HIREDATE, 
          salary SAL, commission_pct COMM
   FROM  employees