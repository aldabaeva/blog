-- Вставка тестовых данных
INSERT INTO users (login) VALUES ('ivanov');
INSERT INTO users (login) VALUES ('petrov');

-- Вставка текущего пользователя в PL/SQL Developer
INSERT INTO users (login) 
SELECT USER FROM dual;

INSERT INTO users (login) 
SELECT ORA_INVOKING_USER FROM dual;

-- Успешный вызов
DECLARE
    v_id NUMBER;
BEGIN
    v_id := f_get_user_id('ivanov');
    DBMS_OUTPUT.PUT_LINE('ID пользователя: ' || v_id);
END;
/

-- Вызов с несуществующим логином (вызовет исключение)
BEGIN
    DBMS_OUTPUT.PUT_LINE(f_get_user_id('sidorov'));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
END;
/

-- Вызов с NULL (вызовет исключение)
BEGIN
    DBMS_OUTPUT.PUT_LINE(f_get_user_id(NULL));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
END;
/