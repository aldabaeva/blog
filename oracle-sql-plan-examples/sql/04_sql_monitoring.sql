-- Получить активные запросы 
SELECT * FROM v$sql_monitor_statname; 

-- Посмотреть подробности 
SELECT DBMS_SQLTUNE.REPORT_SQL_MONITOR(sql_id => '...', type => 'TEXT') FROM DUAL;