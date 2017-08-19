--Execute the code demo_cre_sales_source_data.sql, demo_cre_sales_info.sql,
-- demo_ins_sales_source_data.sql before executing this code
INSERT ALL INTO sales_info VALUES (employee_id,week_id,sales_MON) 
INTO sales_info VALUES (employee_id,week_id,sales_TUE) 
INTO sales_info VALUES (employee_id,week_id,sales_WED) 
INTO sales_info VALUES (employee_id,week_id,sales_THUR) 
INTO sales_info VALUES (employee_id,week_id, sales_FRI) 
SELECT EMPLOYEE_ID, week_id, sales_MON, sales_TUE, sales_WED, sales_THUR,sales_FRI 
FROM sales_source_data;
