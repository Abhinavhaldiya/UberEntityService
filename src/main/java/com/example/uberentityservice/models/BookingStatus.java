package com.example.uberentityservice.models;

public enum BookingStatus {
    // Initial states
    REQUESTED,              // Rider requested a trip
    SCHEDULED,              // Future ride scheduled for later

    // Matching and pickup flow
    DRIVER_ASSIGNED,        // Driver accepted the trip
    DRIVER_ARRIVING,        // Driver is en route to pickup
    DRIVER_ARRIVED,         // Driver reached pickup point

    // Ride flow
    IN_PROGRESS,            // Ride has started

    // Successful terminal state
    COMPLETED,              // Ride finished successfully

    // Unsuccessful terminal states
    CANCELLED_BY_RIDER,
    CANCELLED_BY_DRIVER,
    NO_DRIVER_AVAILABLE,
    EXPIRED
}