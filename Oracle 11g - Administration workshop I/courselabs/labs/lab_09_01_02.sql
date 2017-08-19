-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Lock a row in HR's EMPLOYEES table
-- Because Nancy Greenberg has already locked this record, this statement
--   will appear to "hang" as it waits for Nancy to either commit or rollback.
prompt Sleeping for 20 seconds to ensure first process gets the lock first.
begin
sys.dbms_lock.sleep(20);
end;
/
prompt Sleep is finished.
connect smavris/oracle_4U
show user
prompt Update is being attempted now.
update hr.employees set phone_number='650.555.1212' where employee_id = 110;
prompt Update is completed.

-- The show user and prompt commands are SQL*Plus commands rather
-- than SQL commands. 
-- Notice that they do not have to be ended with a semicolon.

