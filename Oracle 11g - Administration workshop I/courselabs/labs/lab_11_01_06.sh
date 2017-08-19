# Oracle Database 11g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script stops and restarts the database

cd ~/labs

. set_db.sh

echo Stopping the orcl database

srvctl stop database -d orcl -o immediate

echo Starting the orcl database
srvctl start database -d orcl -o open

echo Startup completed

