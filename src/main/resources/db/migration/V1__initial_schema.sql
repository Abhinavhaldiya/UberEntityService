CREATE TABLE drivers (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    license_number VARCHAR(255) NOT NULL,
    vehicle_details VARCHAR(255),
    PRIMARY KEY (id),
    UNIQUE KEY uk_drivers_email (email),
    UNIQUE KEY uk_drivers_phone_number (phone_number),
    UNIQUE KEY uk_drivers_license_number (license_number)
);

CREATE TABLE passengers (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_passengers_email (email),
    UNIQUE KEY uk_passengers_phone_number (phone_number)
);

CREATE TABLE booking_review (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    comment VARCHAR(255) NOT NULL,
    rating DOUBLE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE passenger_review (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    passenger_review_content VARCHAR(255) NOT NULL,
    passenger_rating VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE bookings (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    booking_status VARCHAR(255),
    start_time DATETIME(6),
    end_time DATETIME(6),
    total_distance DOUBLE,
    review_id BIGINT,
    driver_id BIGINT,
    passenger_id BIGINT,
    PRIMARY KEY (id),
    UNIQUE KEY uk_bookings_review_id (review_id),
    KEY idx_bookings_driver_id (driver_id),
    KEY idx_bookings_passenger_id (passenger_id),
    CONSTRAINT fk_bookings_review
        FOREIGN KEY (review_id) REFERENCES booking_review (id),
    CONSTRAINT fk_bookings_driver
        FOREIGN KEY (driver_id) REFERENCES drivers (id),
    CONSTRAINT fk_bookings_passenger
        FOREIGN KEY (passenger_id) REFERENCES passengers (id)
);

