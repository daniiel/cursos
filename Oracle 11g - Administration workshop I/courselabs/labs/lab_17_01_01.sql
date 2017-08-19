-- Oracle Database 11g: Administration Workshop I

-- Oracle Server Technologies - Curriculum Development
--

-- ***Training purposes only***

-- ***Not appropriate for production use***
--


prompt   Create HR_TEST tablespace, HR_TEST_ROLE role, the HR_TEST users

prompt



spool lab_17_01_01.txt


set termout off


connect system/oracle_4U


-- Drop HR_TEST user, the HR_TEST tablespace and HR_TEST_ROLE in case they already exist



drop role hr_test_role;
drop tablespace hr_test including contents and datafiles cascade constraints;

drop user hr_test cascade;

drop user dp cascade;

set termout on



create tablespace hr_test
datafile '/u01/app/oracle/oradata/orcl/hr_test_01.dbf' size 10M;



create user hr_test identified by oracle_4U
default tablespace hr_test
temporary tablespace temp; 



create role hr_test_role;



GRANT 
  create table, 
  create procedure,    
  create sequence, 
  create trigger,
  create view,
  create any index, alter any index,
  create any indextype, alter any indextype,
  create any job,
  analyze any
  TO hr_test_role;

grant create session, hr_test_role to hr_test;



grant read on directory data_pump_dir to dba1;


grant read on directory data_pump_dir to dba1;






prompt   You may now login as: hr_test/oracle_4U
prompt   spool off
exit

