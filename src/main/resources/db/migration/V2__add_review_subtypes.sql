-- DriverReview: joined table for passenger's review of the driver
CREATE TABLE driver_review (
    id BIGINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_driver_review_base FOREIGN KEY (id) REFERENCES booking_review (id)
);

-- PassengerReview: joined table for driver's review of the passenger
-- Drops old disconnected table and replaces it with proper joined inheritance
ALTER TABLE passenger_review DROP COLUMN passenger_review_content;
ALTER TABLE passenger_review DROP COLUMN passenger_rating;
ALTER TABLE passenger_review DROP COLUMN created_at;
ALTER TABLE passenger_review DROP COLUMN updated_at;
ALTER TABLE passenger_review MODIFY COLUMN id BIGINT NOT NULL;
ALTER TABLE passenger_review ADD CONSTRAINT fk_passenger_review_base FOREIGN KEY (id) REFERENCES booking_review (id);

-- Add driver's review of passenger FK to bookings
ALTER TABLE bookings
    ADD COLUMN passenger_review_id BIGINT NULL,
    ADD COLUMN driver_review_id BIGINT NULL,
    ADD UNIQUE KEY uk_bookings_passenger_review_id (passenger_review_id),
    ADD UNIQUE KEY uk_bookings_driver_review_id (driver_review_id),
    ADD CONSTRAINT fk_bookings_passenger_review
        FOREIGN KEY (passenger_review_id) REFERENCES booking_review (id),
    ADD CONSTRAINT fk_bookings_driver_review
        FOREIGN KEY (driver_review_id) REFERENCES booking_review (id);
