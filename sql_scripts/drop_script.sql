DROP TRIGGER attach_trigger ON multimedia_attach;
DROP FUNCTION attach_trigger_function;
DROP SEQUENCE attach_sequence;

DROP TRIGGER card_answer_trigger ON CARD_ANSWER;
DROP FUNCTION card_answer_trigger_function;
DROP SEQUENCE card_answer_sequence;

DROP TRIGGER category_trigger ON category;
DROP FUNCTION category_trigger_function;
DROP SEQUENCE category_sequence;

DROP SEQUENCE user_attempt_sequence;
DROP TRIGGER user_attempt_trigger on USER_ATTEMPT;
DROP FUNCTION user_attempt_trigger_function;

DROP TRIGGER category_datenow_trigger ON category;
DROP FUNCTION category_datenow_trigger_function;

DROP TRIGGER card_trigger ON card;
DROP FUNCTION card_trigger_function;
DROP SEQUENCE card_sequence;

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


