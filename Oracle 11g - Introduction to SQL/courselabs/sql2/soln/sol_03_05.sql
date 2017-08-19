COMMENT ON TABLE departments IS 
  'Company department information including name, code, and location.';

SELECT COMMENTS 
FROM   user_tab_comments
WHERE  table_name = 'DEPARTMENTS';
