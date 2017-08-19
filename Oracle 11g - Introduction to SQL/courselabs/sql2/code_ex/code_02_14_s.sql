ALTER TABLE Emp2 ADD CONSTRAINT emp_dt_fk 
FOREIGN KEY (Department_id) 
REFERENCES Departments(department_id) ON DELETE CASCADE;

