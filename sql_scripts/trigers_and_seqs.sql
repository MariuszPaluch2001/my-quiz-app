CREATE FUNCTION fkntm_card_answer_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
	 RAISE EXCEPTION 'Non Transferable FK constraint  on table Card_answer is violated';
	 
	 RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER fkntm_card_answer BEFORE
    UPDATE OF return_time, user_id, user_category_id, card_id ON card_answer 
    EXECUTE PROCEDURE fkntm_card_answer_function();

/*------------------------------------------------------------------------------------------*/

-- CREATE FUNCTION fkntm_category_function()  
--    RETURNS trigger
--    LANGUAGE PLPGSQL
-- AS 
-- $$
-- BEGIN
-- 	 RAISE EXCEPTION 'Non Transferable FK constraint  on table Category is violated';
	 
-- 	 RETURN NEW;
-- END;
-- $$;

-- CREATE OR REPLACE TRIGGER fkntm_category BEFORE
--     UPDATE OF creator_id ON category
--     EXECUTE PROCEDURE fkntm_category_function();

/*------------------------------------------------------------------------------------------*/

CREATE FUNCTION fkntm_user_attempt_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
	 RAISE EXCEPTION 'Non Transferable FK constraint  on table User_attempt is violated';
	 
	 RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER fkntm_user_attempt BEFORE
    UPDATE OF user_id, user_category_id ON user_attempt
    EXECUTE PROCEDURE fkntm_user_attempt_function();
/*------------------------------------------------------------------------------------------*/

CREATE FUNCTION fkntm_user_category_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
	 RAISE EXCEPTION 'Non Transferable FK constraint  on table User_category is violated';
	 
	 RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER fkntm_user_category BEFORE
    UPDATE OF category_id, user_id ON user_category
    EXECUTE PROCEDURE fkntm_user_category_function();
    
  
/*------------------------------------------------------------------------------------------*/
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

CREATE SEQUENCE user_sequence START WITH 1;

CREATE FUNCTION user_trigger_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.user_id := nextval('user_sequence');
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER user_trigger BEFORE
    INSERT ON app_user
    FOR EACH ROW
    WHEN ( new.user_id IS NULL )
    EXECUTE PROCEDURE user_trigger_function();

CREATE FUNCTION user_trigger_datenow_function()  
   RETURNS trigger
   LANGUAGE PLPGSQL
AS 
$$
BEGIN
    new.creation_date := NOW()::timestamp::date;
    RETURN NEW;
END;
$$;


CREATE OR REPLACE TRIGGER user_datenow_trigger BEFORE
    INSERT ON app_user
    FOR EACH ROW
    EXECUTE PROCEDURE user_trigger_datenow_function();