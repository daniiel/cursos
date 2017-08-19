CREATE OR REPLACE VIEW six_figure_salary AS
SELECT * FROM employees
WHERE salary >= 100000;