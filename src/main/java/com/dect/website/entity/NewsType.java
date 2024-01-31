package com.dect.website.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "news_type")
public class NewsType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
}
