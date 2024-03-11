package com.dect.website.repository.primary;

import com.dect.website.entity.primary.GalleryImages;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GalleryImageRepository extends JpaRepository<GalleryImages, Long> {

    List<GalleryImages> findByGalleryEventId(Long eventId);

}
