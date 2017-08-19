SELECT w.last_name "Employee", w.employee_id "EMP#", 
       m.last_name "Manager", m.employee_id  "Mgr#"
FROM   employees w 
LEFT   OUTER JOIN employees m
ON     (w.manager_id = m.employee_id)
ORDER BY 2;
