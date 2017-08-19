-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Load data into the PRODUCT_MASTER table
--
LOAD DATA
infile '/home/oracle/labs/lab_17_02_01.dat'
INTO TABLE INVENTORY.PRODUCT_MASTER
APPEND
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(product_id,
product_name char(50),
code char(10),
reorder_threshold,
cost,
price,
primary_source char(50),
secondary_source char(50),
obsoleted date(12) 'DD-MON-YYYY')

