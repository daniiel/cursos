REM  Script:  creteach.sql
REM  Purpose: To create the "teach" accounts for SQL1, SQL2, PLFU, and PLPU courses and bundles
REM  Created: By Nagavalli Pataballa on 16-MAR-2001
REM  Updated: By Chaitanya Koratamaddi, on 20-April-2006
REM  Updated: By Nancy Greenberg on 28-Apr-2009 
REM  This script is invoked by the setup.sql script
--Please replace the password for 'SYSTEM' and 
--connect string with your values.

--If the name of default tablespace, name of temporatry tablespace
--are different, replace them with your values.

-- ****TEACH_A setup****
CONNECT system/oracle

DROP USER teach_a CASCADE;
CREATE USER teach_a IDENTIFIED BY teach_a;
ALTER USER teach_a DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_a;

REM  connect to teach_a account and invoke the scripts that create schema objects.

CONNECT teach_a/teach_a
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_code.sql
@@hr_comnt.sql
@@dis_trigger.sql
@@del_data.sql

CONNECT system/oracle

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_a;
GRANT SCHEDULER_ADMIN TO teach_a;
GRANT DBA To teach_a;

REM  verify the number of rows created for each table
CONNECT teach_a/teach_a
spool teach_a.txt
@@confidence.sql
spool off
-- **** END OF TEACH_A setup****

-- ****TEACH_B setup****
CONNECT system/oracle

DROP USER teach_b CASCADE;
CREATE USER teach_b IDENTIFIED BY teach_b;
ALTER USER teach_b DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_b;

REM  connect to teach_b account and invoke the scripts that create schema objects.

CONNECT teach_b/teach_b
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_code.sql
@@hr_comnt.sql
@@dis_trigger.sql

CONNECT system/oracle

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_b;
GRANT SCHEDULER_ADMIN TO teach_b;
GRANT DBA To teach_b;

REM  verify the number of rows created for each table
CONNECT teach_b/teach_b
spool teach_b.txt
@@confidence.sql
spool off
-- **** END OF TEACH_B setup****


-- ****TEACH_C setup****
CONNECT system/oracle

DROP USER teach_c CASCADE;
CREATE USER teach_c IDENTIFIED BY teach_c;
ALTER USER teach_c DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;
      

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_c;

REM  connect to teach_c account and invoke the scripts that create schema objects.

CONNECT teach_c/teach_c
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_code.sql
@@hr_comnt.sql
@@dis_trigger.sql


CONNECT system/oracle

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_c;
GRANT SCHEDULER_ADMIN TO teach_c;
GRANT DBA To teach_c;

REM  verify the number of rows created for each table
CONNECT teach_c/teach_c
spool teach_c.txt
@@confidence.sql
spool off
-- **** END OF TEACH_C setup****


-- ****TEACH_D setup****
CONNECT system/oracle

DROP USER teach_d CASCADE;
CREATE USER teach_d IDENTIFIED BY teach_d;
ALTER USER teach_d DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;
      
GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_d;

GRANT orax TO teach_d;
grant select on v_$parameter to teach_d;

REM  connect to teach_d account and invoke the scripts that create schema objects.

CONNECT teach_d/teach_d
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_code.sql
@@hr_comnt.sql
@@dis_trigger.sql

CONNECT system/oracle

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_d;
GRANT SCHEDULER_ADMIN TO teach_d;
GRANT DBA To teach_d;

REM  verify the number of rows created for each table
CONNECT teach_d/teach_d
spool teach_d.txt
@@confidence.sql
spool off
-- **** END OF TEACH_D setup****