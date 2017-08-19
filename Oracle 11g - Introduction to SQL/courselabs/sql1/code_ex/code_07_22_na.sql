SELECT emp.last_name
    FROM   employees emp
    WHERE  emp.employee_id  IN
                              (SELECT mgr.manager_id
                               FROM   employees mgr);
