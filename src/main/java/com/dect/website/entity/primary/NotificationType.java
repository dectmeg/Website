package com.dect.website.entity.primary;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "notification_type")
public class NotificationType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
}
