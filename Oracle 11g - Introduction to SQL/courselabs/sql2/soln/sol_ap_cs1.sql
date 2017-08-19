SELECT table_name,column_name,data_type,nullable
FROM user_tab_columns
WHERE table_name IN('MEMBER','TITLE','TITLE_COPY','RENTAL','RESERVATION');