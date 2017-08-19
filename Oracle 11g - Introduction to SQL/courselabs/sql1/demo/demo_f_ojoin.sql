SELECT	d.*,
e.last_name, e.salary
from	departments d, employees e
where	d.department_id = e.department_id(+)
order by d.department_id
/
