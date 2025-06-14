ALTER SESSION SET SQL_TRACE = TRUE; 

-- выполнить нужный запрос 
ALTER SESSION SET SQL_TRACE = FALSE; 

-- затем обработать трейс-файл через TKPROF