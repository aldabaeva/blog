CREATE OR REPLACE FUNCTION get_employees
  RETURN emp_table_type
  PIPELINED
AS
BEGIN
  PIPE ROW(emp_row_type('Alice', 5000));
  PIPE ROW(emp_row_type('Bob', 7000));
  PIPE ROW(emp_row_type('Charlie', 6000));
  RETURN;
END;
/