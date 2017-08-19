-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Create two application users, connect as one of them, and lock a row in 
--   HR's EMPLOYEES table
--

prompt Creating users...
-- Drop the users just in case they already exist
drop user smavris;
drop user ngreenberg;
drop role hremployee;

-- Create a role with the permissions needed for this application
create role hremployee;
grant create session to hremployee;

-- This is a new feature in Oracle 10g. Prior versions only allowed the owner of
--  an object to grant permissions on that object.
grant select, update on hr.employees to hremployee;

-- The next two statements create the application users and grant them the application role.
grant hremployee to smavris identified by oracle_4U;
grant hremployee to ngreenberg identified by oracle_4U;

-- Now connect in as Nancy Greenberg (Department Manager) and update John Chen's record.
prompt Connecting as ngreenberg ...
connect ngreenberg/oracle_4U 
set echo on
show user
update hr.employees set phone_number='650.555.1212' where employee_id = 110;
prompt User "ngreenberg" made an update and left it uncommitted in this session.


