-- Таблица customers
CREATE TABLE customers (
  customer_id   NUMBER PRIMARY KEY,
  name          VARCHAR2(100),
  region        VARCHAR2(50),

  created_at    DATE DEFAULT SYSDATE,
  created_by    VARCHAR2(50),
  modified_at   DATE,
  modified_by   VARCHAR2(50),

  is_active     CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
  deleted_at    DATE,
  deleted_by    NUMBER
);

-- Таблица products
CREATE TABLE products (
  product_id    NUMBER PRIMARY KEY,
  name          VARCHAR2(100),
  category      VARCHAR2(50),

  created_at    DATE DEFAULT SYSDATE,
  created_by    VARCHAR2(50),
  modified_at   DATE,
  modified_by   VARCHAR2(50),

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
  created_by    VARCHAR2(50),
  modified_at   DATE,
  modified_by   VARCHAR2(50),
  is_active     CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
  deleted_at    DATE,
  deleted_by    NUMBER
);
