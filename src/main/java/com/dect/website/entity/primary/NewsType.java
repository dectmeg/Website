package com.dect.website.entity.primary;

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
