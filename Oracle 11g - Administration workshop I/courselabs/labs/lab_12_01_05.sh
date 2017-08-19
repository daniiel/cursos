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

sqlplus spct/oracle_4U  << END

set echo on

exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();

exec DBMS_STATS.GATHER_TABLE_STATS(-
ownname=>'SPCT', tabname=>'SPCT',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

exit;
END
