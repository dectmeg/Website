package com.dect.website.entity.primary;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Calendar;
import java.util.Date;

@Data
@Entity
@Table(name = "key_contacts")
public class KeyContacts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_number")
    private Long orderNumber;
    
    @Column(name = "name_and_designation")
    private String nameAndDesignation;

    @Column(name = "office_number")
    private String officeNumber;

    @Column(name = "mobile_number")
    private String mobileNumber;

    @Column(name = "created_at")
    private Date createdAt;

    @Column(name = "updated_at")
    private Date updatedAt;

    private String email;

    @PrePersist
    public void onCreate() {
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        this.setCreatedAt(date);
        this.setUpdatedAt(date);
    }

    @PreUpdate
    public void onUpdate() {
        Calendar cal = Calendar.getInstance();
        Date date = new Date();
        this.setUpdatedAt(date);
    }
}
