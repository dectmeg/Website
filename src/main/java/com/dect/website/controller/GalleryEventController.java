package com.dect.website.controller;

import com.dect.website.entity.primary.GalleryEvent;
import com.dect.website.entity.primary.News;
import com.dect.website.service.GalleryEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class GalleryEventController {

    @Autowired
    private GalleryEventService galleryEventService;

    @Value("${upload.gallery-directory}")
    private String galleryDirectory;

    @PostMapping(value = "/secure/gallery-events/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> addGalleryEvent(@RequestParam("title") String title,
                                                  @RequestParam("description") String description,
                                                  @RequestParam("eventDate") String eventDate,
                                                  @RequestParam("images") MultipartFile[] images) {

        try {
            GalleryEvent galleryEvent = new GalleryEvent();
            galleryEvent.setTitle(title);
            galleryEvent.setDescription(description);
            galleryEvent.setEventDate(java.sql.Date.valueOf(eventDate));

            // Save images to storage and store their file names in the database
            for (MultipartFile image : images) {
                String fileName = galleryEventService.saveImage(image, title);
                galleryEventService.addImageToGalleryEvent(galleryEvent, fileName);
            }

            // Save gallery event to the database
            galleryEventService.saveGalleryEvent(galleryEvent);

            return ResponseEntity.status(HttpStatus.CREATED).body("Gallery event saved successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save gallery event.");
        }
    }

    @GetMapping("gallery-events/all")
    @ResponseBody
    public List<GalleryEvent> getGalleryEvents() {
        return galleryEventService.viewGalleryEvents();
    }


    @GetMapping("/gallery-events/{eventId}")
    public ResponseEntity<GalleryEvent> getEventDetails(@PathVariable Long eventId) {
        GalleryEvent galleryEvent = galleryEventService.getGalleryEventById(eventId);
        if (galleryEvent != null) {
            return ResponseEntity.ok(galleryEvent);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("gallery-events/{eventId}/images")
    public ResponseEntity<List<byte[]>> getEventImages(@PathVariable Long eventId) {
        List<byte[]> eventImages = galleryEventService.getEventImages(eventId);
        if (eventImages != null && !eventImages.isEmpty()) {
            return ResponseEntity.ok(eventImages);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("gallery-events/{eventId}/first-image")
    public ResponseEntity<byte[]> getFirstEventImage(@PathVariable Long eventId) {
        byte[] firstEventImage = galleryEventService.getFirstEventImage(eventId);
        if (firstEventImage != null) {
            return ResponseEntity.ok(firstEventImage);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
