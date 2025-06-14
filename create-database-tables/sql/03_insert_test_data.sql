BEGIN
  INSERT INTO demo_customers (customer_id, name, region, created_by)
  SELECT LEVEL, 'Customer ' || LEVEL,
        CASE WHEN MOD(LEVEL, 2) = 0 THEN 'Россия' ELSE 'Европа' END,
        2
  FROM DUAL
  CONNECT BY LEVEL <= 1000;

  -- Заполнение products
  INSERT INTO demo_products (product_id, name, category, created_by)
  SELECT LEVEL, 'Товар ' || LEVEL, 'Категория ' || TO_CHAR(MOD(LEVEL, 10)),
        2
  FROM DUAL
  CONNECT BY LEVEL <= 1000;

  -- Заполнение orders
  INSERT INTO demo_orders (order_id, customer_id, product_id, order_date, amount, region, created_by)
  SELECT LEVEL,
        MOD(LEVEL, 1000) + 1,
        MOD(LEVEL * 3, 1000) + 1,
        TRUNC(SYSDATE - MOD(LEVEL, 365)),
        ROUND(DBMS_RANDOM.VALUE(100, 1000), 2),
        CASE WHEN MOD(LEVEL, 2) = 0 THEN 'Россия' ELSE 'Европа' END,
        2
  FROM DUAL
  CONNECT BY LEVEL <= 1000;