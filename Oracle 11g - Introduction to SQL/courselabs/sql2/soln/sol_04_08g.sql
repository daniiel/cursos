INSERT ALL
      INTO emp_sales_info VALUES (id, week_id, QTY_MON)
      INTO emp_sales_info VALUES (id, week_id, QTY_TUE)
      INTO emp_sales_info VALUES (id, week_id, QTY_WED)
      INTO emp_sales_info VALUES (id, week_id, QTY_THUR)
      INTO emp_sales_info VALUES (id, week_id, QTY_FRI)
      SELECT ID, week_id, QTY_MON, QTY_TUE, QTY_WED, QTY_THUR,QTY_FRI FROM sales_week_data;