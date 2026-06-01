package com.example.uberentityservice.models;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "booking_review")
@Inheritance(strategy = InheritanceType.JOINED)
public class Review extends BaseModel {

    @Column(nullable = false)
    private String comment;

    @Column(nullable = false)
    private Double rating;

    @OneToOne(cascade = {CascadeType.MERGE}, fetch = FetchType.LAZY)
    @JoinColumn(nullable = false)
    private Booking booking;

    @Override
    public String toString() {
        return "Review: " + this.comment + " " + this.rating + " " + " booking: " + this.booking.getId() + " " + this.createdAt;
    }
}
