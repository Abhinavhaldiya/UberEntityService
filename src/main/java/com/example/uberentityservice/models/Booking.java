package com.example.uberentityservice.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "bookings")
public class Booking extends BaseModel {

    @ManyToOne(fetch = FetchType.LAZY)
    private Driver driver;

    @ManyToOne(fetch = FetchType.LAZY)
    private Passenger passenger;

    @Enumerated(EnumType.STRING)
    private BookingStatus bookingStatus;

    private LocalDateTime startTime;

    private LocalDateTime endTime;

    private Double totalDistance;

    @OneToOne(cascade = CascadeType.PERSIST)
    private ExactLocation startLocation;

    @OneToOne(cascade = CascadeType.PERSIST)
    private ExactLocation endLocation;
}
