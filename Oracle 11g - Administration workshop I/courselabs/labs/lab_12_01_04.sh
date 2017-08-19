# Oracle Database 11g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script supports the ADDM practice 

#!/bin/bash

cd ~/labs

. set_db.sh

. wkfctrfunc
 
users=12
cpufactor $users

x=1
y=$newval
UNPW="spct/oracle_4U"

while [ $x -le $y ]
do
    sqlplus -s $UNPW @lab_12_01_04.sql &
    x=`expr $x + 1`
done
