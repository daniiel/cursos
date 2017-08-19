-- Oracle Database 11g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
-- Execute a OS commands from within a PL/SQL code block
--
-- Feel free to copy, duplicate, etc but please leave this header information intact.
-- ***SECURITY WARNING***  DO NOT RUN THIS SCRIPT IN A PRODUCTION DATABASE!!!
--    It makes it possible for ANY database user to execute ANY operating system
--    command that the user who started the database has permission to do, including
--    deleting data files, controlfile, oracle executables, etc.
--
-- Usage note: Commands are passed to the pl/sql stored procedure execmd
--     like this: exec execcmd('DEL E:\ORACLE\PRODUCT\10.1.0\ORADATA\ORCL\control01.ctl')
--     notice that the operating system command must include the full path.
--     
--

connect system/oracle_4U

--Create a java stored procedure to execute the operating system command
--    Have to use java because PL/SQL doesn't allow for operating system command
--    execution except through the use of EXTPROC (a much more secure way to 
--    implement this by the way).

CREATE OR REPLACE JAVA SOURCE NAMED "ExecuteCmd" as
 import java.lang.Runtime;
 import java.lang.Process;
 import java.io.IOException;
 import java.lang.InterruptedException;
 public class ExecuteCmd {
      public static void main(String args[]) {
          System.out.println("Start executing");
          try {
              Process p = Runtime.getRuntime().exec(args[0]);
                try {
                p.waitFor();}
              catch (InterruptedException intexc) {
                 System.out.println("Interrupted Exception on waitFor: " +  intexc.getMessage());}
                 System.out.println("Return code from process: "+ p.exitValue());
                 System.out.println("Done executing");}
              catch (IOException e) {
                 System.out.println("IO Exception from exec: " + e.getMessage());
                 e.printStackTrace();}
              }
     }
 /

--Create a PL/SQL wrapper function to call the java stored procedure
--
CREATE OR REPLACE PROCEDURE execcmd (S1 VARCHAR2) 
   AS LANGUAGE JAVA 
   name 'ExecuteCmd.main(java.lang.String[])'; 
/ 

--Grant the JVM permission to interface with the operating system. Notice the first 
--   grants give the JVM permission to call rm,ls and kill. You will have to add any OS commands
--   that you want executed using this format.
exec dbms_java.grant_permission( 'SYSTEM', 'SYS:java.io.FilePermission', '/bin/rm','execute')
exec dbms_java.grant_permission( 'SYSTEM', 'SYS:java.io.FilePermission', '/bin/ls','execute')
exec dbms_java.grant_permission( 'SYSTEM', 'SYS:java.io.FilePermission', '/bin/kill','execute')
exec dbms_java.grant_permission( 'SYSTEM', 'SYS:java.io.FilePermission', '<<ALL FILES>>', 'execute' )
exec dbms_java.grant_permission( 'SYSTEM','SYS:java.lang.RuntimePermission', 'writeFileDescriptor', '' )
exec dbms_java.grant_permission( 'SYSTEM','SYS:java.lang.RuntimePermission', 'readFileDescriptor', '' )

create public synonym execcmd for execcmd;

grant execute on execcmd to public;
