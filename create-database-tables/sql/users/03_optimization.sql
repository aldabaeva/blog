CREATE INDEX idx_users_login ON users(login);
/

CREATE TABLE user_audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY,
    userid NUMBER,
    login VARCHAR2(50),
    action VARCHAR2(10),
    changed_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE OR REPLACE TRIGGER trg_users_audit
AFTER INSERT OR UPDATE OR DELETE ON users
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO user_audit(userid, login, action)
        VALUES (:NEW.userid, :NEW.login, 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO user_audit(userid, login, action)
        VALUES (:NEW.userid, :NEW.login, 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO user_audit(userid, login, action)
        VALUES (:OLD.userid, :OLD.login, 'DELETE');
    END IF;
END;
/