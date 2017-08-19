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

sqlplus / as sysdba  << EOF

set echo on

exec dbms_advisor.set_default_task_parameter('ADDM','DB_ACTIVITY_MIN',30);

connect spct/oracle_4U

drop table spct purge;
create table spct(id number, name varchar2(2000));

exec DBMS_STATS.GATHER_TABLE_STATS(-
ownname=>'SPCT', tabname=>'SPCT',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();

exit;
EOF
