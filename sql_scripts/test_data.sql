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
