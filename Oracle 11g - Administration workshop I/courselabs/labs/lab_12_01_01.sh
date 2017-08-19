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

sqlplus / as sysdba  << END

set echo on

drop tablespace TBSSPC including contents and datafiles;

CREATE SMALLFILE TABLESPACE "TBSSPC"
DATAFILE '+DATA' SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M
LOGGING
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT MANUAL;

exit;
END
