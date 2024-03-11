package com.dect.website.entity.primary;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "gallery_images")
public class GalleryImages {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    private String fileName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gallery_event_id")
    @JsonBackReference
    private GalleryEvent galleryEvent;
}
