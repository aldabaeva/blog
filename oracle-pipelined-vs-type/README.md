# 🚀 Pipelined Functions vs TYPE в Oracle PL/SQL

Этот репозиторий содержит простой и наглядный пример разницы между `TYPE` и `PIPELINED FUNCTION` в Oracle.

---

## 🔍 Что внутри

- `TYPE` — используется для описания пользовательского объекта и коллекции.
- `PIPELINED FUNCTION` — функция, которая возвращает данные построчно и может быть вызвана как таблица в SQL.

---

## 📦 Файлы

| Файл                             | Описание |
|----------------------------------|----------|
| `01_create_types.sql`           | Создание пользовательского object type и collection type |
| `02_create_pipelined_function.sql` | Создание pipelined-функции `get_employees()` |
| `03_select_from_function.sql`   | SELECT-запрос к функции через `TABLE()` |
| `04_drop_all.sql`               | Очистка схемы (удаление объектов) |

---

## 📌 Быстрый старт

1. Откройте SQL Developer / SQL*Plus.
2. Выполните последовательно:
   ```sql
   @sql/01_create_types.sql
   @sql/02_create_pipelined_function.sql
   @sql/03_select_from_function.sql
   @sql/04_drop_all.sql


---

## 📚 Полезные ссылки

1. [Oracle Docs — Pipelined Functions](https://docs.oracle.com/en/database/oracle/oracle-database/23/lnpls/plsql-subprograms.html#GUID-6FFDC003-3B1C-43D1-A1CE-59A8DA47145E)
2. [Oracle Live SQL Demo](https://livesql.oracle.com/)
3. [Oracle TYPE и COLLECTIONS](https://docs.oracle.com/en/database/oracle/oracle-database/23/lnpls/plsql-collections-and-records.html)

---

## 👩‍💻 Контакты
[personal@aldabaeva.com](mailto:personal@aldabaeva.com) | [Telegram](https://t.me/skiperkrut) | [aldabaeva.com](https://aldabaeva.com)