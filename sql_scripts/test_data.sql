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

INSERT INTO CATEGORY (name, creation_date, creator_id) VALUES(
    'Niemiecki - słowa',
    '2022-09-16',
    1
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
