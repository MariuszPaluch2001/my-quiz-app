CREATE SEQUENCE card_sequence START WITH 1;

CREATE FUNCTION card_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.card_id := nextval('card_sequence');
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER card_trigger BEFORE
    INSERT ON card
    FOR EACH ROW
    WHEN ( new.card_id IS NULL )
    EXECUTE PROCEDURE card_trigger_function();

/*------------------------------------------------------------------------------------------*/

CREATE SEQUENCE category_sequence START WITH 1;

CREATE FUNCTION category_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.category_id := nextval('category_sequence');
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER category_trigger BEFORE
    INSERT ON category
    FOR EACH ROW
    WHEN ( new.category_id IS NULL )
    EXECUTE PROCEDURE category_trigger_function();

CREATE FUNCTION category_datenow_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.creation_date := NOW()::timestamp::date;
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER category_datenow_trigger BEFORE
    INSERT ON category
    FOR EACH ROW
    EXECUTE PROCEDURE category_datenow_trigger_function();

/*------------------------------------------------------------------------------------------*/

CREATE SEQUENCE attach_sequence START WITH 1;

CREATE FUNCTION attach_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.attach_id := attach_sequence.nextval;
END;
$$;

CREATE OR REPLACE TRIGGER attach_trigger BEFORE
    INSERT ON multimedia_attach
    FOR EACH ROW
    WHEN ( new.attach_id IS NULL )
    EXECUTE PROCEDURE attach_trigger_function();

/*------------------------------------------------------------------------------------------*/

CREATE SEQUENCE user_attempt_sequence START WITH 1;

CREATE FUNCTION user_attempt_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.user_attempt_id := nextval('user_attempt_sequence');
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER user_attempt_trigger BEFORE
    INSERT ON USER_ATTEMPT
    FOR EACH ROW
    WHEN ( new.user_attempt_id IS NULL )
    EXECUTE PROCEDURE user_attempt_trigger_function();

/*-------------------------------------------------------------------------------------------------*/

CREATE SEQUENCE card_answer_sequence START WITH 1;

CREATE FUNCTION card_answer_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.card_answer_id := nextval('card_answer_sequence');
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER card_answer_trigger BEFORE
    INSERT ON CARD_ANSWER
    FOR EACH ROW
    WHEN ( new.card_answer_id IS NULL )
    EXECUTE PROCEDURE card_answer_trigger_function();