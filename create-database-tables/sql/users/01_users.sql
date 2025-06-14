-- Удаление таблиц, если существуют
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE users PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE users (
    USERID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    LOGIN      VARCHAR2(100) NOT NULL UNIQUE,
    CREATED_AT DATE DEFAULT SYSDATE,
    CONSTRAINT login_min_length CHECK (LENGTH(login) >= 3)
);
-- Add comments to the table 
comment on table USERS
  is 'Таблицы пользователей';
-- Add comments to the columns 
comment on column USERS.userid
  is 'Идентификатор пользователя';
comment on column USERS.login
  is 'Логин пользователя';
comment on column USERS.created_at
  is 'Дата создания пользователя';


/* Функция получения id пользователя */
CREATE OR REPLACE FUNCTION f_get_user_id(p_login IN VARCHAR2)
	RETURN NUMBER IS
	v_user_id        NUMBER;
	e_user_not_found EXCEPTION;
	PRAGMA EXCEPTION_INIT(e_user_not_found, -20001);
BEGIN
	-- Проверка на NULL
	IF p_login IS NULL THEN
		RAISE_APPLICATION_ERROR(-20002, 'Логин не может быть NULL');
	END IF;

	-- Проверка на минимальную длину
	IF LENGTH(p_login) < 3 THEN
		RAISE_APPLICATION_ERROR(-20003, 'Логин должен содержать минимум 3 символа');
	END IF;

	-- Поиск пользователя
	BEGIN
		SELECT userid INTO v_user_id FROM users WHERE login = p_login;
	
		RETURN v_user_id;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RAISE e_user_not_found;
		WHEN TOO_MANY_ROWS THEN
			RAISE_APPLICATION_ERROR(-20004, 'Найдено несколько пользователей с таким логином');
	END;

EXCEPTION
	WHEN e_user_not_found THEN
		RAISE_APPLICATION_ERROR(-20001, 'Пользователь с логином ' || p_login || ' не найден');
	WHEN OTHERS THEN
		RAISE_APPLICATION_ERROR(-20000, 'Ошибка при получении ID пользователя: ' || SQLERRM);
END f_get_user_id;
/