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

# dtf1 variable will hold the name of data file that is on +DATA
dbf1=`asmcmd ls +DATA/ORCL/DATAFILE/SYSTEM*`

# Remove the control file from +FRA
asmcmd rm -f +DATA/ORCL/DATAFILE/${dbf1}

. set_db.sh

./startdb.sh

exit

