CREATE TABLE dept_add_ext
  <TODO1>
   ORGANIZATION EXTERNAL
    (
     <TODO2>
     DEFAULT DIRECTORY emp_dir
     LOCATION
      ('oraxx_emp4.exp','oraxx_emp5.exp')
    )
   PARALLEL
<TODO3>;
 
