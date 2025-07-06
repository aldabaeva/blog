# Bitmap Index в Oracle — когда ускоряет, а когда мешает

Этот репозиторий содержит рабочий пример использования битовых индексов (BITMAP INDEX) в Oracle: где они эффективны, а где — нет. 
Отлично подойдёт для разработчиков и DBA, которые хотят понять поведение BITMAP-индексов на практике.

---

## Что внутри

1. Таблицы demo_customers, demo_orders, demo_products с полями is_active, region и др.
   Исходные файлы можно найти в [GIT](https://github.com/aldabaeva/blog/tree/main/create-database-tables/sql)
2. Скрипт создания BITMAP-индексов - oracle-bitmap-index.sql
3. Сравнение скорости выполнения запросов с индексом и без

---

## 👩‍💻 Контакты
[personal@aldabaeva.com](mailto:personal@aldabaeva.com) | [Telegram](https://t.me/skiperkrut) | [aldabaeva.com](https://aldabaeva.com)