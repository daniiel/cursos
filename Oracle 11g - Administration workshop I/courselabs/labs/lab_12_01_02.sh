# Oracle Database 11g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script supports the ADDM practice 

cd ~/labs

. set_db.sh

sqlplus / as sysdba << END

set echo on

drop user spct cascade;

create user spct identified by oracle_4U account unlock
default tablespace TBSSPC
temporary tablespace temp;

grant connect, resource, dba to spct;

exit;
END
