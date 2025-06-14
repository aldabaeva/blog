# EXPLAIN PLAN — Предварительный план выполнения

## Назначение
Показывает, как Oracle планирует выполнить запрос без фактического запуска.

## Как использовать
1. Запустите `01_explain_plan.sql` в SQL Developer или SQL*Plus.
2. Скрипт выполнит `EXPLAIN PLAN FOR` и отобразит план через `DBMS_XPLAN.DISPLAY`.

## Требования
- Таблицы `products`, `customers`, `orders` должны быть созданы.
- Доступ к `PLAN_TABLE`.

## Что посмотреть
- Типы соединений
- Используемые индексы
- Порядок операций

## Материалы к проекту

Можно почитать в [[Дзен]](https://m.dzen.ru/a/aE01qModsG8Hoykm) | [Teletype](https://teletype.in/@apworks/2XrCjwEKU5d)


## 👩‍💻 Контакты
[Написать автору](mailto:personal@aldabaeva.com) | [Telegram](https://t.me/skiperkrut) | [Сайт автора](https://aldabaeva.com)