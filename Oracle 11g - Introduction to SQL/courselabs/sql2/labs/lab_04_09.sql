drop table emp_data;

CREATE TABLE emp_data
  (first_name  VARCHAR2(20)
  ,last_name   VARCHAR2(20)
  , email     VARCHAR2(30)
  )
ORGANIZATION EXTERNAL
(
 TYPE oracle_loader
 DEFAULT DIRECTORY emp_dir
 ACCESS PARAMETERS
 (
  RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
  NOBADFILE
  NOLOGFILE
  FIELDS
  ( first_name POSITION ( 1:20) CHAR
  , last_name POSITION (22:41) CHAR
  ,  email   POSITION (43:72) CHAR )
 )
 LOCATION ('emp.dat') ) ;

