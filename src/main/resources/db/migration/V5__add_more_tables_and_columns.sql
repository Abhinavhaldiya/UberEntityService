-- exact_locations
CREATE TABLE exact_locations (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    latitude DOUBLE,
    longitude DOUBLE,
    PRIMARY KEY (id)
);

-- named_locations
CREATE TABLE named_locations (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    name VARCHAR(255),
    zip_code VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    state VARCHAR(255),
    exact_location_id BIGINT,
    PRIMARY KEY (id),
    CONSTRAINT fk_named_locations_exact_location
        FOREIGN KEY (exact_location_id) REFERENCES exact_locations (id)
);

-- colors
CREATE TABLE colors (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_colors_name (name)
);

-- cars
CREATE TABLE cars (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    plate_number VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    model VARCHAR(255),
    car_type VARCHAR(255),
    color_id BIGINT,
    driver_id BIGINT,
    PRIMARY KEY (id),
    UNIQUE KEY uk_cars_plate_number (plate_number),
    UNIQUE KEY uk_cars_driver_id (driver_id),
    CONSTRAINT fk_cars_color
        FOREIGN KEY (color_id) REFERENCES colors (id),
    CONSTRAINT fk_cars_driver
        FOREIGN KEY (driver_id) REFERENCES drivers (id)
);

-- otps
CREATE TABLE otps (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    code VARCHAR(255),
    sent_to_number VARCHAR(255),
    PRIMARY KEY (id)
);

-- db_constants
CREATE TABLE db_constants (
    id BIGINT NOT NULL AUTO_INCREMENT,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    name VARCHAR(255) NOT NULL,
    value VARCHAR(255),
    PRIMARY KEY (id),
    UNIQUE KEY uk_db_constants_name (name)
);

-- Add missing columns to drivers
ALTER TABLE drivers
    ADD COLUMN active_city VARCHAR(255),
    ADD COLUMN is_available BIT NOT NULL DEFAULT 0,
    ADD COLUMN driver_approval_status VARCHAR(255),
    ADD COLUMN rating DOUBLE,
    ADD COLUMN last_known_location_id BIGINT,
    ADD COLUMN home_id BIGINT,
    ADD CONSTRAINT fk_drivers_last_known_location
        FOREIGN KEY (last_known_location_id) REFERENCES exact_locations (id),
    ADD CONSTRAINT fk_drivers_home
        FOREIGN KEY (home_id) REFERENCES exact_locations (id);

-- Add missing columns to passengers
ALTER TABLE passengers
    ADD COLUMN rating DOUBLE,
    ADD COLUMN active_booking_id BIGINT,
    ADD COLUMN last_known_location_id BIGINT,
    ADD COLUMN home_id BIGINT,
    ADD UNIQUE KEY uk_passengers_active_booking_id (active_booking_id),
    ADD CONSTRAINT fk_passengers_active_booking
        FOREIGN KEY (active_booking_id) REFERENCES bookings (id),
    ADD CONSTRAINT fk_passengers_last_known_location
        FOREIGN KEY (last_known_location_id) REFERENCES exact_locations (id),
    ADD CONSTRAINT fk_passengers_home
        FOREIGN KEY (home_id) REFERENCES exact_locations (id);

-- Add missing location columns to bookings
ALTER TABLE bookings
    ADD COLUMN start_location_id BIGINT,
    ADD COLUMN end_location_id BIGINT,
    ADD UNIQUE KEY uk_bookings_start_location_id (start_location_id),
    ADD UNIQUE KEY uk_bookings_end_location_id (end_location_id),
    ADD CONSTRAINT fk_bookings_start_location
        FOREIGN KEY (start_location_id) REFERENCES exact_locations (id),
    ADD CONSTRAINT fk_bookings_end_location
        FOREIGN KEY (end_location_id) REFERENCES exact_locations (id);
