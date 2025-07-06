--==============================================================================
-- Создаем тестовую таблицу
--==============================================================================
CREATE TABLE theme_11_customers (
    customer_id    NUMBER PRIMARY KEY,
    name_short     VARCHAR2(1000),
    gender         CHAR(1),
    cu_status      NUMBER(1),
    created_at     DATE DEFAULT SYSDATE,
    created_by     NUMBER
);
-- Add comments to the table 
comment on table USERS is 'Таблицы заказчиков по теме 11. Битовый индекс';
-- Add comments to the columns 
comment on column theme_11_customers.customer_id is 'Идентификатор заказчика'; 
comment on column theme_11_customers.name_short  is 'Имя заказчика';
comment on column theme_11_customers.gender      is 'Пол М/Ж';
comment on column theme_11_customers.cu_status   is 'Статус';
comment on column theme_11_customers.created_at  is 'Когда создали запись';  
comment on column theme_11_customers.created_at  is 'Кто создал запись';

--==============================================================================
-- Заполняем тестовыми данными
--==============================================================================
-- Включаем DBMS_RANDOM
BEGIN
  DBMS_RANDOM.SEED(TO_NUMBER(TO_CHAR(SYSDATE,'SSSSS')));
END;
/

-- Вставка 100 случайных строк
INSERT INTO theme_11_customers (
  customer_id,
  name_short,
  gender,
  cu_status,
  created_at,
  created_by
)
SELECT
  LEVEL AS customer_id,
  'Customer_' || DBMS_RANDOM.STRING('U', 6) AS name_short,
  CASE WHEN MOD(LEVEL, 2) = 0 THEN 'M' ELSE 'F' END AS gender,
  TRUNC(DBMS_RANDOM.VALUE(0, 3)) AS cu_status,  -- Статусы: 0, 1, 2
  SYSDATE - DBMS_RANDOM.VALUE(0, 100) AS created_at,
  TRUNC(DBMS_RANDOM.VALUE(1, 10)) AS created_by
FROM dual
CONNECT BY LEVEL <= 1000;
