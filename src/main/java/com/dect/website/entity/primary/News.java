package com.dect.website.entity.primary;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

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
    @Column(name = "upload_date")
    private Date uploadDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "start_date")
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "end_date")
    private Date endDate;

    @Column(name = "attachment_name")
    private String attachmentName;

    @ManyToOne
    @JoinColumn(name = "news_type_id")
    private NewsType newsType;

    @Column(name = "whats_new")
    private boolean whatsNew;

    @Column(name = "is_live")
    private boolean isLive;

    public boolean isLive() {
        return isLive;
    }

    public void setIsLive(boolean isLive) {
        this.isLive = isLive;
    }

    @PrePersist
    public void onCreate() {
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        this.setUploadDate(new Date());
        this.isLive = true;
    }
}
