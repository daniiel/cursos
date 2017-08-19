-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***

-- ***Not appropriate for production use***

--

CONNECT / as sysdba


spool lab_07_01_01.txt


CREATE USER DBA1 PROFILE "DEFAULT" IDENTIFIED BY oracle_4U  DEFAULT TABLESPACE "SYSTEM" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;


GRANT  dba, sysdba to dba1;


prompt Lab_07_01_01 completed. You may now login as:
prompt   dba1/oracle_4U

prompt

 spool off 
exit

