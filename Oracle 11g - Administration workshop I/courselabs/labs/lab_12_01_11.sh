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

drop user spct cascade;

drop tablespace tbsspc including contents and datafiles;

drop tablespace tbsspc2 including contents and datafiles;

exit;
END
