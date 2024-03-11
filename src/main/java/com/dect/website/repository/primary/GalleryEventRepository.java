package com.dect.website.repository.primary;

import com.dect.website.entity.primary.GalleryEvent;
import com.dect.website.entity.primary.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GalleryEventRepository extends JpaRepository<GalleryEvent, Long> {
    List<GalleryEvent> findAll();

    @Query("SELECT gi.fileName FROM GalleryEvent ge JOIN ge.galleryImages gi WHERE ge.id = :eventId")
    List<byte[]> findImagesByEventId(Long eventId);
}
