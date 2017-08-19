connect / as sysdba

-- Find the file and block numbers

SELECT DISTINCT 
   MIN(DBMS_ROWID.ROWID_RELATIVE_FNO(rowid)) as FILE_NO,
   MIN(DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid)) as BLOCK_NO
 FROM JS.JSCOPY;

ALTER SYSTEM FLUSH BUFFER_CACHE;
-- corrupt the first 2 blocks
PROMPT 'Enter Block number when prompted'

! ./lab_corrupt.sh "$ORACLE_BASE/oradata/orcl/jstbs01.dbf" &block_no 8196

SELECT * from js.jscopy;

exit;
