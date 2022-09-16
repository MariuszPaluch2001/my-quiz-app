DROP TRIGGER user_trigger ON app_user;
DROP FUNCTION user_trigger_function;
DROP SEQUENCE user_sequence;

DROP TRIGGER attach_trigger ON multimedia_attach;
DROP FUNCTION attach_trigger_function;
DROP SEQUENCE attach_sequence;

DROP TRIGGER category_trigger ON category;
DROP FUNCTION category_trigger_function;
DROP SEQUENCE category_sequence;

DROP TRIGGER card_trigger ON card;
DROP FUNCTION card_trigger_function;
DROP SEQUENCE card_sequence;

DROP TRIGGER fkntm_user_category ON user_category;
DROP FUNCTION fkntm_user_category_function;

DROP TRIGGER fkntm_user_attempt ON user_attempt;
DROP FUNCTION fkntm_user_attempt_function;

DROP TRIGGER fkntm_category ON category;
DROP FUNCTION fkntm_category_function;

DROP TRIGGER fkntm_card_answer ON card_answer;
DROP FUNCTION fkntm_card_answer_function;

DROP INDEX card__idx;
DROP INDEX category__idx;
DROP INDEX card_answer__idx;
DROP INDEX upper_category__idx;
DROP INDEX user__idx;
DROP INDEX user_category__id;


DROP TABLE multimedia_attach;
DROP TABLE card_answer;
DROP TABLE card;
DROP TABLE user_attempt;
DROP TABLE user_category;
DROP TABLE category;
DROP TABLE app_user;


