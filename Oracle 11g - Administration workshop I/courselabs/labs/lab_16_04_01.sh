# Oracle Database 11g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
#***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script 
#   

cd ~/labs

. set_db.sh

./shutdb.sh

. set_asm.sh

# Ctrl1 variable will hold the name of control file that is on +FRA
ctrl1=`asmcmd ls +FRA/ORCL/CONTROLFILE`

# Remove the control file from +FRA
asmcmd rm -f +FRA/ORCL/CONTROLFILE/${ctrl1} 


# . set_db.sh

# ./startdb.sh

exit

