CREATE OR REPLACE TYPE emp_row_type AS OBJECT
(
	emp_name   VARCHAR2(100),
	emp_salary NUMBER
);
/  

CREATE OR REPLACE TYPE emp_table_type AS TABLE OF emp_row_type; 
/