drop table emp8 cascade constraints;

Create Table emp8 as select * from employees;

ALTER TABLE emp8 
  ADD CONSTRAINT email_addr    
  CHECK(REGEXP_LIKE(email,'@'))NOVALIDATE ;















