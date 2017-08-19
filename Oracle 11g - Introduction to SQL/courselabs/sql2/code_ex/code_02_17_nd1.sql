drop table newemp_details cascade constraints;

create table newemp_details(emp_id number, emp_name varchar2(20),
constraint newemp_det_pk primary key(emp_id));

