ALTER TABLE passengers
    ADD COLUMN password VARCHAR(255) NOT NULL DEFAULT '' AFTER phone_number;

ALTER TABLE passengers
    MODIFY COLUMN password VARCHAR(255) NOT NULL;
