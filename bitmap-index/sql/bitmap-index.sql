-- включаем простую метрику времени
SET timing ON

-- 1. Без индекса
DROP INDEX idx_cust_is_active;
SELECT /*+ gather_plan_statistics */ COUNT(*)
FROM demo_customers
WHERE is_active = 'Y';
SELECT * FROM TABLE(dbms_xplan.display_cursor(NULL,NULL,'ALLSTATS LAST'));

-- 2. С индексом
CREATE BITMAP INDEX idx_cust_is_active
  ON demo_customers(is_active);

SELECT /*+ gather_plan_statistics */ COUNT(*)
FROM demo_customers
WHERE is_active = 'Y';
SELECT * FROM TABLE(dbms_xplan.display_cursor(NULL,NULL,'ALLSTATS LAST'));
