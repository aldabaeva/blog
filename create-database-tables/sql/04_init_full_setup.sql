-- ==================================================================
-- Полная инициализация: очистка, создание и наполнение таблиц
-- ==================================================================

-- Очистка
DROP TABLE demo_orders PURGE;
DROP TABLE demo_products PURGE;
DROP TABLE demo_customers PURGE;

-- ====================
-- Создание таблиц 
-- ====================

-- Таблица customers
CREATE TABLE demo_customers (
  customer_id   NUMBER PRIMARY KEY,
  name          VARCHAR2(1000),
  region        VARCHAR2(50),
  created_at    DATE DEFAULT SYSDATE,
  created_by    NUMBER,
  modified_at   DATE,
  modified_by   NUMBER,
  is_active     CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
  deleted_at    DATE,
  deleted_by    NUMBER
);

-- Таблица products
CREATE TABLE demo_products (
  product_id    NUMBER PRIMARY KEY,
  name          VARCHAR2(1000),
  category      VARCHAR2(50),
  created_at    DATE DEFAULT SYSDATE,
  created_by    NUMBER,
  modified_at   DATE,
  modified_by   NUMBER,
  is_active     CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
  deleted_at    DATE,
  deleted_by    NUMBER
);

-- Таблица orders
CREATE TABLE demo_orders (
  order_id      NUMBER PRIMARY KEY,
  customer_id   NUMBER REFERENCES demo_customers(customer_id),
  product_id    NUMBER REFERENCES demo_products(product_id),
  order_date    DATE,
  amount        NUMBER,
  region        VARCHAR2(50),
  created_at    DATE DEFAULT SYSDATE,
  created_by    NUMBER,
  modified_at   DATE,
  modified_by   NUMBER,
  is_active     CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
  deleted_at    DATE,
  deleted_by    NUMBER
);


-- ===================================
-- Заполнение тестовыми данными 
-- ===================================

-- Заполнение customers
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

  COMMIT;
END;