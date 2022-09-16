INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'Maly Gucio',
    'hash1234',
    '2022-06-01'
);

INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'Mały Kaziu',
    '1234hash',
    '2021-06-01'
);

INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'Salto Morales',
    'SuperRealnyHashNoScam',
    '2020-06-01'
);

INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'Siara',
    'SiarzewskiHash',
    '2019-08-19'
);

INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'AC/DC_FAN',
    'PLACEHOLDER',
    '2020-06-01'
);

INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'Jerzy Kiler',
    'placeholdernahash',
    '2020-06-01'
);

INSERT INTO APP_USER (login, password_hash, creation_date) VALUES (
    'Jan_Paweł_III',
    'MożnaJeszczeJak',
    '2020-06-01'
);

INSERT INTO CATEGORY (name, creation_date, creator_id) VALUES(
    'Angielski - słowa',
    '2022-09-16',
    1
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'kanapka',
    'sandwich',
    1
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'książka',
    'book',
    1
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'stół',
    'table',
    1
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'zeszyt',
    'notebook',
    1
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'plecak',
    'bag',
    1
);

INSERT INTO CATEGORY (name, creation_date, creator_id) VALUES(
    'Niemiecki - słowa',
    '2022-09-16',
    1
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'woda',
    'wasser',
    2
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'książka',
    'buchen',
    2
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'stół',
    'tisch',
    2
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'czerwony',
    'rot',
    2
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'mysz',
    'maus',
    2
);

INSERT INTO CATEGORY (name, creation_date, creator_id) VALUES(
    'Geografia',
    '2022-06-16',
    3
);

INSERT INTO CATEGORY (name, creation_date, creator_id, upper_category_ID) VALUES(
    'Geografia Europy',
    '2022-06-16',
    3,
    3
);


INSERT INTO CATEGORY (name, creation_date, creator_id, upper_category_ID) VALUES(
    'Geografia Polski',
    '2022-06-16',
    3,
    4
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'Stolica województwa świętokrzyskiego?',
    'Kielce',
    5
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'Najdłuższa rzeka w Polsce?',
    'Wisła',
    5
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'Najwyższy szczyt w Polsce?',
    'Rysy',
    5
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'Graniczna rzeka z Niemcami?',
    'Odra',
    5
);

INSERT INTO CARD (question, answer, category_id) VALUES(
    'Czy Sandomierz leży nad Sanem?',
    'Nie',
    5
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    1,
    1
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    2,
    1
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    5,
    1
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    1,
    2
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    2,
    2
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    5,
    4
);

INSERT INTO USER_CATEGORY (category_id, user_id) VALUES(
    2,
    4
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-04-05 03:05:06',
    1,
    1
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-04-05 03:01:36',
    1,
    '2022-04-05 03:05:06',
    1,
    1,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-04-05 03:02:06',
    2,
    '2022-04-05 03:05:06',
    1,
    1,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-04-05 03:02:36',
    3,
    '2022-04-05 03:05:06',
    1,
    1,
    'F'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-04-05 03:03:06',
    4,
    '2022-04-05 03:05:06',
    1,
    1,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-04-05 03:04:36',
    5,
    '2022-04-05 03:05:06',
    1,
    1,
    'F'
);


INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-05-01 12:00:56',
    1,
    1
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-05-01 11:50:56',
    1,
    '2022-05-01 12:00:56',
    1,
    1,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-05-01 11:55:56',
    2,
    '2022-05-01 12:00:56',
    1,
    1,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-05-01 12:00:50',
    5,
    '2022-05-01 12:00:56',
    1,
    1,
    'F'
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-05-25 13:05:01',
    1,
    1
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-06-01 23:05:59',
    1,
    1
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-04-05 13:10:15',
    2,
    1
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-04-03 12:00:56',
    2,
    1
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2020-02-03 17:00:01',
    1,
    5
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2021-04-03 20:00:56',
    1,
    5
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-01-01 08:00:56',
    1,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-02-24 5:00:56',
    1,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-05-06 15:00:56',
    1,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-12-03 10:00:56',
    1,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-04-02 09:00:56',
    1,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2021-11-02 12:00:56',
    2,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2021-12-30 14:10:46',
    2,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-01-10 18:55:56',
    2,
    2
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-06-18 20:35:36',
    4,
    5
);


INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-08-18 21:30:15',
    4,
    5
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-08-18 21:26:15',
    11,
    '2022-08-18 21:30:15',
    4,
    5,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-08-18 21:27:15',
    12,
    '2022-08-18 21:30:15',
    4,
    5,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-08-18 21:28:15',
    13,
    '2022-08-18 21:30:15',
    4,
    5,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-08-18 21:29:15',
    14,
    '2022-08-18 21:30:15',
    4,
    5,
    'T'
);

INSERT INTO CARD_ANSWER (solution_timestamp, card_id, return_time, user_id, user_category_id, is_correct) VALUES(
    '2022-08-18 21:30:15',
    15,
    '2022-08-18 21:30:15',
    4,
    5,
    'T'
);

INSERT INTO USER_ATTEMPT (return_time, user_id, user_category_id) VALUES(
    '2022-09-16 17:47:10',
    4,
    2
);

