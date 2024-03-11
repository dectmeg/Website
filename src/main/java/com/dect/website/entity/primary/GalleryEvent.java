package com.dect.website.entity.primary;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Data
@Table(name = "gallery_event")
public class GalleryEvent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String Title;

    private String Description;

    @Temporal(TemporalType.DATE)
    @Column(name = "event_date")
    private Date EventDate;

    @OneToMany(mappedBy = "galleryEvent", cascade = CascadeType.ALL)
//    @JsonIgnore
    @JsonManagedReference
    private List<GalleryImages> galleryImages = new ArrayList<>();
}
