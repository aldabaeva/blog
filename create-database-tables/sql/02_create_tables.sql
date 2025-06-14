-- Таблица customers
CREATE TABLE demo_customers (
  customer_id   NUMBER PRIMARY KEY,
  name          VARCHAR2(100),
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
  name          VARCHAR2(100),
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
