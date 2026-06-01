-- Move the booking association from bookings -> booking_review
-- Previously: bookings.review_id pointed to booking_review
-- Now: booking_review.booking_id points to bookings (owned by Review)

-- 1. Add booking_id as nullable first (safe for non-empty tables), then constrain
ALTER TABLE booking_review
    ADD COLUMN booking_id BIGINT NULL,
    ADD UNIQUE KEY uk_booking_review_booking_id (booking_id),
    ADD CONSTRAINT fk_booking_review_booking
        FOREIGN KEY (booking_id) REFERENCES bookings (id);

ALTER TABLE booking_review
    MODIFY COLUMN booking_id BIGINT NOT NULL;

-- 2. Drop the old review_id FK and column from bookings
ALTER TABLE bookings
    DROP FOREIGN KEY fk_bookings_review,
    DROP KEY uk_bookings_review_id,
    DROP COLUMN review_id;
