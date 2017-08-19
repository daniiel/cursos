
drop table dept80;

Create table dept80 (employee_id, last_name, annsal, hire_date)
as select employee_id, last_name, salary, hire_date from employees where department_id =80;

ALTER TABLE dept80
ADD (job_id VARCHAR2(9));

select * from dept80;