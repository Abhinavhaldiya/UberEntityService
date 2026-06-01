package com.example.uberentityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "db_constants")
public class DBConstant extends BaseModel{

    @Column(unique = true, nullable = false)
    private String name;

    private String value;
}