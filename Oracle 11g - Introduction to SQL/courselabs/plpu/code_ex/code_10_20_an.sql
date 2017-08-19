ALTER SESSION SET plsql_warnings = 'enable:severe', 'enable:performance', 'enable:informational';
SELECT value FROM v$parameter WHERE name='plsql_warnings';
