SELECT employee_id, last_name,
       get_annual_comp(salary,commission_pct) "Annual Compensation"
FROM   employees
WHERE department_id=30
/

