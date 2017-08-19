# Oracle Database 11g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script stops  the database

echo Starting the orcl database

srvctl start database -d orcl -o open

echo Startup completed

