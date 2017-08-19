SELECT last_name
FROM    employees outer
WHERE outer.salary < (SELECT AVG(inner.salary)
                                 FROM employees inner
                                WHERE inner.department_id = outer.department_id)                      
/
