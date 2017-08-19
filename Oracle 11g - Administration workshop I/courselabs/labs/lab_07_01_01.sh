# Oracle Database 11g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
#***Not appropriate for production use***
#
# This script creates required file system directories that 
# will be used in upcoming practices and calls a script that
# creates the DBA1 oracle user.

cd /u01/app/oracle
mkdir oradata
cd oradata
mkdir orcl

cd ~/labs

. set_db.sh

sqlplus -S /nolog @lab_07_01_01.sql
