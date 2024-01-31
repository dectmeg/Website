package com.dect.website.service;

import com.dect.website.entity.News;
import com.dect.website.repository.NewsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Service
public class NewsService {

    @Autowired
    private NewsRepo newsRepo;

    @Autowired
    private FileUploadService fileUploadService;

    public News saveNews(News news, MultipartFile attachment) {
        try {
            // Get the original filename
            String originalFilename = attachment.getOriginalFilename();

            // Save the file locally and get its location
            String fileLocation = fileUploadService.saveFile(attachment, originalFilename);

            // Set the attachment properties in the News entity
            news.setAttachmentName(originalFilename);
            news.setFileLocation(fileLocation);

            // Save the News entity
            return newsRepo.save(news);
        } catch (Exception e) {
            // Handle the exception (e.g., log it or rethrow as a custom exception)
            e.printStackTrace();
            return null; // Or throw a custom exception based on your error handling strategy
        }
    }



    public List<News> viewNews() {
        return newsRepo.findAll();
    }

}