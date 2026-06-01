package com.example.uberentityservice.models;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "exact_locations")
public class ExactLocation extends BaseModel {

    private Double latitude;
    private Double longitude;
}