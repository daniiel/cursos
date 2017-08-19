#!/bin/bash
#-- Cleanup the tablespace, and user from the corrupt blocks

cd ~/labs

. set_db.sh

sqlplus -S /nolog > /tmp/cleanup.lo 2>&1 <<EOF
connect / as sysdba

-- CLEANUP from previous run
DROP USER JS CASCADE;

DROP TABLESPACE JSTBS INCLUDING CONTENTS AND DATAFILES;

EXIT;
EOF


