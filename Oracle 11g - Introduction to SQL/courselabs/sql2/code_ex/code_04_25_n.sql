DROP TABLE managers2;
CREATE TABLE managers2 as select last_name, job_id, salary from employees where 1=2;
DROP TABLE richpeople;
DROP TABLE poorpeople;
CREATE TABLE richpeople(last_name VARCHAR2(30),job_id VARCHAR2(30),SALARY NUMBER);
create table poorpeople (last_name VARCHAR2(30),job_id VARCHAR2(30),SALARY NUMBER);

INSERT ALL
WHEN job_id IN 
(select job_id FROM jobs WHERE job_title LIKE '%Manager%') THEN
INTO managers2(last_name,job_id,SALARY)
VALUES (last_name,job_id,SALARY)
WHEN SALARY>10000 THEN 
INTO richpeople(last_name,job_id,SALARY)
VALUES (last_name,job_id,SALARY)
ELSE 
INTO poorpeople VALUES (last_name,job_id,SALARY)
SELECT * FROM employees; 