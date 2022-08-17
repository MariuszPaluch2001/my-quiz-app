CREATE OR REPLACE TRIGGER fkntm_card_answer BEFORE
    UPDATE OF return_time, user_id, user_category_id, card_id ON card_answer
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Card_answer is violated');
END;
/

CREATE OR REPLACE TRIGGER fkntm_category BEFORE
    UPDATE OF creator_id ON category
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Category is violated');
END;
/

CREATE OR REPLACE TRIGGER fkntm_user_attempt BEFORE
    UPDATE OF user_id, user_category_id ON user_attempt
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table User_attempt is violated');
END;
/

CREATE OR REPLACE TRIGGER fkntm_user_category BEFORE
    UPDATE OF category_id, user_id ON user_category
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table User_category is violated');
END;
/

CREATE SEQUENCE card_sequence START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER card_trigger BEFORE
    INSERT ON card
    FOR EACH ROW
    WHEN ( new.card_id IS NULL )
BEGIN
    :new.card_id := card_sequence.nextval;
END;
/

CREATE SEQUENCE category_sequence START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER category_trigger BEFORE
    INSERT ON category
    FOR EACH ROW
    WHEN ( new.category_id IS NULL )
BEGIN
    :new.category_id := category_sequence.nextval;
END;
/

CREATE SEQUENCE attach_sequence START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER attach_trigger BEFORE
    INSERT ON multimedia_attach
    FOR EACH ROW
    WHEN ( new.attach_id IS NULL )
BEGIN
    :new.attach_id := attach_sequence.nextval;
END;
/

CREATE SEQUENCE user_sequence START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER user_trigger BEFORE
    INSERT ON "User"
    FOR EACH ROW
    WHEN ( new.user_id IS NULL )
BEGIN
    :new.user_id := user_sequence.nextval;
END;
/
