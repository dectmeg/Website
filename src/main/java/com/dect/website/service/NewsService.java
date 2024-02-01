package com.dect.website.service;

import com.dect.website.entity.News;
import com.dect.website.repository.NewsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Service
public class NewsService {

    @Autowired
    private NewsRepo newsRepo;

    @Autowired
    private FileUploadService fileUploadService;

    @Value("${upload.directory}")
    private String uploadDirectory;

    public News saveNews(News news, MultipartFile attachment) {
        try {
            // Generate a unique file name
            String fileName = generateUniqueFileName(attachment.getOriginalFilename());

            // Save the file and get its location
            String fileLocation = fileUploadService.saveFile(attachment, fileName);

            // Set the file name in the News entity
            news.setAttachmentName(fileName);

            // Save the News entity
            return newsRepo.save(news);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String generateUniqueFileName(String originalFileName) {
        // Generate a unique file name by appending a timestamp
        String timestamp = "_" + System.currentTimeMillis();
        int lastDotIndex = originalFileName.lastIndexOf('.');

        if (lastDotIndex != -1) {
            // Insert the timestamp before the file extension
            return originalFileName.substring(0, lastDotIndex) + timestamp + originalFileName.substring(lastDotIndex);
        } else {
            // If there's no file extension, just append the timestamp
            return originalFileName + timestamp;
        }
    }

    public List<News> viewNews() {
        return newsRepo.findAll();
    }

    public byte[] getAttachmentData(String attachmentName) {
        try {
            // Construct the file path using the upload directory and attachment name
            Path filePath = Paths.get(uploadDirectory, attachmentName);

            // Read the file content into a byte array
            return Files.readAllBytes(filePath);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getAttachmentName(Integer newsId) {
        Optional<News> optionalNews = newsRepo.findById(newsId);
        if (optionalNews.isPresent()) {
            News news = optionalNews.get();
            return news.getAttachmentName();
        }
        return null;
    }
}
