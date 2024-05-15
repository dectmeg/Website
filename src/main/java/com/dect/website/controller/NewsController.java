package com.dect.website.controller;

import com.dect.website.entity.primary.News;
import com.dect.website.entity.primary.NewsType;
import com.dect.website.service.NewsFileUploadService;
import com.dect.website.service.NewsService;
import com.dect.website.service.NewsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@RestController
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsTypeService newsTypeService;

    @Autowired
    private NewsFileUploadService newsFileUploadService;

    @Value("${upload.news-events-directory}")
    private String NewsEventsDirectory;

    @PostMapping(value = "/secure/news/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> addNews(@RequestParam("title") String title,
                                          @RequestParam("description") String description,
                                          @RequestParam("startDate") String startDate,
                                          @RequestParam("endDate") String endDate,
                                          @RequestParam("attachment") MultipartFile attachment,
                                          @RequestParam("newsType") Long newsTypeId,
                                          @RequestParam("whatsNew") boolean whatsNew) {
        try {
            News news = new News();
            news.setTitle(title);
            news.setDescription(description);

            if (startDate != null && !startDate.isEmpty()) {
                news.setStartDate(java.sql.Date.valueOf(startDate));
            } else {
                news.setStartDate(null);
            }

            if (endDate != null && !endDate.isEmpty()) {
                news.setEndDate(java.sql.Date.valueOf(endDate));
            } else {
                news.setEndDate(null);
            }

            news.setWhatsNew(whatsNew);

            NewsType newsType = newsTypeService.getNewsTypeById(newsTypeId);
            if (newsType == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid News Type ID.");
            }
            news.setNewsType(newsType);

            news = newsService.saveNews(news, attachment);


            if (news != null) {
                return ResponseEntity.status(HttpStatus.CREATED).body("News saved successfully.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save news.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save news.");
        }
    }



    @GetMapping("/news/attachment/{newsId}")
    public ResponseEntity<Resource> downloadAttachment(@PathVariable Integer newsId) throws IOException {

        String fileName = newsService.getAttachmentName(newsId);


        String filePath = NewsEventsDirectory + File.separator + fileName;


        Resource resource = newsFileUploadService.loadFileAsResource(filePath);


        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"");
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE); // Set the content type to PDF

        return ResponseEntity.ok()
                .headers(headers)
                .body(resource);
    }

    @GetMapping("/news/types")
    public ResponseEntity<?> getNewsTypes() {
        return new ResponseEntity<>(newsTypeService.getAllNewsTypes(), HttpStatus.OK);
    }

    @GetMapping("news/all")
    @ResponseBody
    public List<News> getAllNews() {
        return newsService.viewNews();
    }

    @GetMapping("news/whatsNew")
    public ResponseEntity<List<News>> getWhatsNew() {
        List<News> top5News = newsService.getTop5WhatsNew();
        return new ResponseEntity<>(top5News, HttpStatus.OK);
    }

    @GetMapping("/news/by-type")
    public ResponseEntity<List<News>> getNewsByType(@RequestParam Integer newsTypeId) {
        return ResponseEntity.ok(newsService.getNewsByTypeId(newsTypeId));
    }

    @PostMapping("/news/delete/{id}")
    public ResponseEntity<String> deleteNews(@PathVariable("id") Integer id) {
        newsService.deleteNews(id, false);
        return ResponseEntity.ok("News item deleted successfully");
    }
}

