-- Run this code example before you run code_08_27_s.sql. 

CREATE TABLE new_emps AS
 SELECT employee_id,last_name,salary,department_id FROM employees;

CREATE TABLE new_depts AS
 SELECT d.department_id,d.department_name,
        sum(e.salary) dept_sal FROM employees e, departments d
 WHERE e.department_id = d.department_id
 GROUP BY d.department_id,d.department_name;

CREATE VIEW emp_details AS
 SELECT e.employee_id, e.last_name, e.salary,
        e.department_id, d.department_name
 FROM employees e, departments d
 WHERE e.department_id = d.department_id;
