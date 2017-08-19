--Execute demo_cre_sal_history.sql and demo_cre_mgr_history.sql 
--before executing this code
INSERT  ALL INTO sal_history VALUES(EMPID,HIREDATE,SAL)   INTO mgr_history VALUES(EMPID,MGR,SAL)
   SELECT employee_id EMPID, hire_date HIREDATE,          salary SAL, manager_id MGR 
   FROM  employees WHERE employee_id > 200;
