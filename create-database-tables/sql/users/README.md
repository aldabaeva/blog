﻿# Модуль `users`: таблица пользователей, функция и аудит

## Содержимое

### 01_users.sql

- Создание таблицы `users` с колонками:
  - `userid` — автоинкрементный идентификатор
  - `login` — уникальный логин, не короче 3 символов
  - `created_at` — дата создания (по умолчанию `SYSTIMESTAMP`)
- Функция `f_get_user_id(p_login)`:
  - Возвращает ID пользователя по логину
  - Обрабатывает ситуации:
    - `NULL` значение
    - слишком короткий логин
    - пользователь не найден
    - найдено более одного пользователя (ошибка данных)

### 02_examples.sql

- Вставка 2 тестовых пользователей: `ivanov`, `petrov`
- Вызовы `f_get_user_id`:
  - Успешный (существующий логин)
  - Неуспешный (несуществующий логин, вывод ошибки)
  - Передача `NULL`, проверка обработки

### 03_optimization.sql

- Создание индекса по `login`
- Таблица `user_audit` — журнал аудита:
  - `audit_id`, `userid`, `login`, `action`, `changed_at`
- Триггер `trg_users_audit`:
  - Фиксирует `INSERT`, `UPDATE`, `DELETE` операций
  - Автоматически записывает изменения в `user_audit`



## Как использовать

1. Выполните `01_users.sql` — создаёт структуру и функцию.
2. Выполните `02_examples.sql` — демонстрация работы функции и обработки ошибок.
3. Выполните `03_optimization.sql` — создаёт аудит и индекс.

> Убедитесь, что таблица `users` отсутствует, либо предварительно запустите `01_drop_tables.sql` из корневой папки.



## Примечания

- Аудит реализован через **AFTER-триггер на уровне строк**.
- Используется `SYSTIMESTAMP` для точной фиксации времени.
- Стандартные коды ошибок (-20001...-20004) — для удобной отладки.