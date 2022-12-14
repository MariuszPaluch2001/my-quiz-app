
CREATE TABLE card (
    card_id     NUMERIC(6) NOT NULL,
    question    VARCHAR(200) NOT NULL,
    answer      VARCHAR(500) NOT NULL,
    category_id NUMERIC(5) NOT NULL
);

CREATE INDEX category__idx ON
    card (
        category_id
    ASC );

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_id );

CREATE TABLE card_answer (
    card_answer_id            INT NOT NULL,
    user_attempt           INT NOT NULL,
    card_id                   NUMERIC(6) NOT NULL,
    is_correct                CHAR(1) NOT NULL
);

CREATE INDEX card_answer__idx ON
    card_answer (
        card_id
    ASC );

ALTER TABLE card_answer
    ADD CONSTRAINT card_answer_pk PRIMARY KEY(
                                                card_answer_id
                                            );

CREATE TABLE category (
    category_id       NUMERIC(5) NOT NULL,
    name              VARCHAR(50) NOT NULL,
    creation_date     DATE NOT NULL,
    creator_id        INT NOT NULL,
    upper_category_id NUMERIC(5)
);

CREATE INDEX upper_category__idx ON
    category (
        upper_category_id
    ASC );

CREATE INDEX user__idx ON
    category (
        creator_id
    ASC );

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( category_id );

CREATE TABLE multimedia_attach (
    attach_id  NUMERIC(5) NOT NULL,
    attachment BYTEA NOT NULL,
    card_id    NUMERIC(6) NOT NULL
);

CREATE INDEX card__idx ON
    multimedia_attach (
        card_id
    ASC );

ALTER TABLE multimedia_attach ADD CONSTRAINT mult_attach_pk PRIMARY KEY ( attach_id );

CREATE TABLE user_attempt (
    user_attempt_id       INT NOT NULL,
    return_time      TIMESTAMP NOT NULL,
    user_id          INT NOT NULL,
    user_category_id NUMERIC(5) NOT NULL
);

ALTER TABLE user_attempt
    ADD CONSTRAINT user_attempt_pk PRIMARY KEY (user_attempt_id);

CREATE TABLE user_category (
    category_id NUMERIC(5) NOT NULL,
    user_id     INT NOT NULL
);

CREATE INDEX user_category__id ON
    user_category (
        category_id
    ASC );

ALTER TABLE user_category ADD CONSTRAINT user_categories_pk PRIMARY KEY ( user_id,
                                                                          category_id );

ALTER TABLE card_answer
    ADD CONSTRAINT card_answer_card_fk FOREIGN KEY ( card_id )
        REFERENCES card ( card_id );

ALTER TABLE card_answer
    ADD CONSTRAINT card_answer_user_attempt_fk FOREIGN KEY (user_attempt)
        REFERENCES user_attempt (user_attempt_id);

ALTER TABLE card
    ADD CONSTRAINT card_category_fk FOREIGN KEY ( category_id )
        REFERENCES category ( category_id );


ALTER TABLE multimedia_attach
    ADD CONSTRAINT mult_attach_card_fk FOREIGN KEY ( card_id )
        REFERENCES card ( card_id );

ALTER TABLE category
    ADD CONSTRAINT upper_category_fk FOREIGN KEY ( upper_category_id )
        REFERENCES category ( category_id );

ALTER TABLE user_attempt
    ADD CONSTRAINT user_attempt_user_category_fk FOREIGN KEY ( user_id,
                                                               user_category_id )
        REFERENCES user_category ( user_id,
                                   category_id );

ALTER TABLE user_category
    ADD CONSTRAINT user_category_category_fk FOREIGN KEY ( category_id )
        REFERENCES category ( category_id );

-- ALTER TABLE user_category
--     ADD CONSTRAINT user_category_user_fk FOREIGN KEY ( user_id )
--         REFERENCES app_user ( user_id );

