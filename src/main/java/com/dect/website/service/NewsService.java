package com.dect.website.service;

import com.dect.website.entity.primary.News;
import com.dect.website.repository.primary.NewsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class NewsService {

    @Autowired
    private NewsRepo newsRepo;

    @Autowired
    private NewsFileUploadService newsFileUploadService;

    @Value("${upload.news-events-directory}")
    private String newsEventsDirectory;

    public News saveNews(News news, MultipartFile attachment) {
        try {
            String fileName = generateUniqueFileName(news.getNewsType().getName(), attachment.getOriginalFilename());

            String fileLocation = newsFileUploadService.saveFile(attachment, fileName);

            news.setAttachmentName(fileName);

            return newsRepo.save(news);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String generateUniqueFileName(String newsTypeId, String originalFileName) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
        String timestamp = "_" + now.format(formatter);
        int lastDotIndex = originalFileName.lastIndexOf('.');

        String fileNamePrefix = newsTypeId + "_";

        if (lastDotIndex != -1) {
            return fileNamePrefix + originalFileName.substring(0, lastDotIndex) + timestamp + originalFileName.substring(lastDotIndex);
        } else {
            return fileNamePrefix + originalFileName + timestamp;
        }
    }

    public List<News> viewNews() {
        return newsRepo.findAllByIsLiveOrderByUploadDateDescIdDesc(true);
    }

    public List<News> getTop5WhatsNew() {
        return newsRepo.findTop5ByWhatsNewAndIsLiveTrueOrderByUploadDateDescIdDesc(true);
    }

    public byte[] getAttachmentData(String attachmentName) {
        try {
            // Construct the file path using the upload directory and attachment name
            Path filePath = Paths.get(newsEventsDirectory, attachmentName);

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

    public List<News> getNewsByTypeId(Integer newsType) {
        return newsRepo.findByNewsTypeIdAndIsLiveTrueOrderByUploadDateDescIdDesc(newsType);
    }

    public void deleteNews(Integer id, boolean isLive) {
        News news = newsRepo.findById(id).orElse(null);
        if (news != null) {
            news.setIsLive(false);
            newsRepo.save(news);
        }
    }
}
