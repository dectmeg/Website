package com.dect.website.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "news_notices")
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;

    private String description;

    @Temporal(TemporalType.DATE)
    private Date date;

    @Column(name = "attachment_name")
    private String attachmentName;

    @Column(name = "file_location")
    private String fileLocation;

    @ManyToOne
    @JoinColumn(name = "news_type_id")
    private NewsType newsType;
}
