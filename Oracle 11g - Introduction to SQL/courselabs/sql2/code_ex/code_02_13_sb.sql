ALTER TABLE     emp2
ADD CONSTRAINT  emp_mgr_fk 
  FOREIGN KEY(manager_id) 
  REFERENCES emp2(employee_id);

