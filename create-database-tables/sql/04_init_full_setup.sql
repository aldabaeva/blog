-- ==================================================================
-- Полная инициализация: очистка, создание и наполнение таблиц
-- ==================================================================

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE orders PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE products PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE customers PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

-- ====================
-- Создание таблиц 
-- ====================

-- Таблица customers
CREATE TABLE customers (
  customer_id   NUMBER PRIMARY KEY,
  name_short    VARCHAR2(1000),
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
CREATE TABLE products (
  product_id    NUMBER PRIMARY KEY,
  name_short    VARCHAR2(1000),
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
CREATE TABLE orders (
  order_id      NUMBER PRIMARY KEY,
  customer_id   NUMBER REFERENCES customers(customer_id),
  product_id    NUMBER REFERENCES products(product_id),
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
INSERT INTO customers (customer_id, name, region, created_by)
SELECT LEVEL, 'Customer ' || LEVEL,
       CASE WHEN MOD(LEVEL, 2) = 0 THEN 'Россия' ELSE 'Европа' END,
       'script_loader'
FROM DUAL
CONNECT BY LEVEL <= 1000;

-- Заполнение products
INSERT INTO products (product_id, name, category, created_by)
SELECT LEVEL, 'Product ' || LEVEL, 'Category ' || TO_CHAR(MOD(LEVEL, 10)),
       'script_loader'
FROM DUAL
CONNECT BY LEVEL <= 1000;

-- Заполнение orders
INSERT INTO orders (order_id, customer_id, product_id, order_date, amount, region, created_by)
SELECT LEVEL,
       MOD(LEVEL, 1000) + 1,
       MOD(LEVEL * 3, 1000) + 1,
       TRUNC(SYSDATE - MOD(LEVEL, 365)),
       ROUND(DBMS_RANDOM.VALUE(100, 1000), 2),
       CASE WHEN MOD(LEVEL, 2) = 0 THEN 'Россия' ELSE 'Европа' END,
       'script_loader'
FROM DUAL
CONNECT BY LEVEL <= 1000;

COMMIT;
