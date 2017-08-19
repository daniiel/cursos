drop table empl6;

create table empl6 as select * from employees;

ALTER TABLE empl6
ADD(department_name VARCHAR2(25));


