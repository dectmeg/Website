package com.dect.website.service;

import com.dect.website.entity.primary.GalleryEvent;
import com.dect.website.entity.primary.GalleryImages;
import com.dect.website.entity.primary.News;
import com.dect.website.repository.primary.GalleryEventRepository;
import com.dect.website.repository.primary.GalleryImageRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;

@Service
public class GalleryEventService {

    @Autowired
    GalleryEventRepository galleryEventRepository;

    @Autowired
    GalleryFileUploadService galleryfileUploadService;

    @Autowired
    GalleryImageRepository galleryImageRepository;

    @Value("${upload.gallery-directory}")
    private String galleryDirectory;

    public GalleryEvent saveGalleryEvent(GalleryEvent galleryEvent) {
        return galleryEventRepository.save(galleryEvent);
    }

    public GalleryImages addImageToGalleryEvent(GalleryEvent galleryEvent, String fileName) {
        GalleryImages galleryImage = new GalleryImages();
        galleryImage.setFileName(fileName);
        galleryImage.setGalleryEvent(galleryEvent);
        galleryEvent.getGalleryImages().add(galleryImage);
        return galleryImage;
    }

    public String saveImage(MultipartFile image, String title) throws IOException {
        // Generate unique file name
        String fileName = generateUniqueFileName(title, image.getOriginalFilename());

        // Save image to storage
        String fileLocation = galleryfileUploadService.saveFile(image, fileName);

        return fileName;
    }

    private String generateUniqueFileName(String title, String originalFileName) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
        String timestamp = "_" + now.format(formatter);
        int lastDotIndex = originalFileName.lastIndexOf('.');

        String eventIdPrefix = title + "_";

        if (lastDotIndex != -1) {
            return eventIdPrefix + originalFileName.substring(0, lastDotIndex) + timestamp + originalFileName.substring(lastDotIndex);
        } else {
            return eventIdPrefix + originalFileName + timestamp;
        }
    }

    public List<GalleryEvent> viewGalleryEvents() {
        return galleryEventRepository.findAll();
    }

    public List<byte[]> getEventImages(Long eventId) {
        List<byte[]> imagesData = new ArrayList<>();

        // Retrieve event images from database
        List<GalleryImages> images = galleryImageRepository.findByGalleryEventId(eventId);
        if (images != null) {
            for (GalleryImages image : images) {
                try {
                    // Construct the file path using the gallery directory and image file name
                    Path imagePath = Paths.get(galleryDirectory, image.getFileName());

                    // Read the image content into a byte array
                    byte[] imageData = Files.readAllBytes(imagePath);
                    imagesData.add(imageData);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Handle exception if unable to read image file
                }
            }
        }
        return imagesData;
    }

    public byte[] getFirstEventImage(Long eventId) {
        // Retrieve event images from the repository
        List<GalleryImages> images = galleryImageRepository.findByGalleryEventId(eventId);

        if (!images.isEmpty()) {
            // Get the first image
            GalleryImages firstImage = images.get(0);

            try {
                // Construct the file path using the gallery directory and image file name
                Path imagePath = Paths.get(galleryDirectory, firstImage.getFileName());

                // Read the image content into a byte array
                return Files.readAllBytes(imagePath);
            } catch (IOException e) {
                e.printStackTrace();
                // Handle exception if unable to read image file
            }
        }
        return null; // Return null if no images found or unable to read image file
    }

    public GalleryEvent getGalleryEventById(Long eventId) {
        return galleryEventRepository.findById(eventId).orElse(null);
    }

}
