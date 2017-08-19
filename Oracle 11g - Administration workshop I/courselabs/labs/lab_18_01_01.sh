#!/bin/bash

cd ~/labs

. set_db.sh

sqlplus -S /nolog > /tmp/setup.log 2>&1 <<EOF
connect / as sysdba

-- CLEANUP from previous run
DROP USER JS CASCADE;

DROP TABLESPACE JSTBS INCLUDING CONTENTS AND DATAFILES;

-- Create tablespace
CREATE TABLESPACE JSTBS 
DATAFILE '/u01/app/oracle/oradata/orcl/jstbs01.dbf' SIZE 10M
SEGMENT SPACE MANAGEMENT MANUAL;

-- Create user
CREATE USER JS IDENTIFIED BY oracle_4U 
DEFAULT TABLESPACE JSTBS
QUOTA UNLIMITED ON JSTBS;

GRANT CREATE SESSION TO js;

-- create table and populate 
-- be sure table is at least 2 blocks long
CREATE TABLE JS.JSCOPY
TABLESPACE JSTBS 
AS SELECT * FROM HR.EMPLOYEES;

INSERT INTO JS.JSCOPY
SELECT * FROM JS.JSCOPY;

INSERT INTO JS.JSCOPY
SELECT * FROM JS.JSCOPY;

EOF

#-- Create backup of the jstbs tablespace

rman target / > /tmp/rman.log 2>&1 <<EOF

BACKUP AS COPY TABLESPACE JSTBS;
EOF

#-- update the table
sqlplus -S /nolog >> /tmp/setup.log 2>&1 <<EOF
connect / as sysdba

UPDATE JS.JSCOPY SET salary = salary+1;

COMMIT;

EOF

