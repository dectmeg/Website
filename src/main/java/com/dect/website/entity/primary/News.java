package com.dect.website.entity.primary;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Calendar;
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

    @Temporal(TemporalType.DATE)
    @Column(name = "end_date")
    private Date endDate;

    @Column(name = "attachment_name")
    private String attachmentName;

    @ManyToOne
    @JoinColumn(name = "news_type_id")
    private NewsType newsType;

    @Column(name = "whats_new", nullable = false)
    private boolean whatsNew;

    @PrePersist
    public void onCreate() {
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        this.setDate(new Date());
    }
}
