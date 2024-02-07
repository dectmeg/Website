package com.dect.website.controller;

import com.dect.website.entity.primary.News;
import com.dect.website.entity.primary.NewsType;
import com.dect.website.service.FileUploadService;
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
import java.util.List;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsTypeService newsTypeService;

    @Autowired
    private FileUploadService fileUploadService;

    @Value("${upload.directory}")
    private String uploadDirectory;

    @PostMapping(value = "/secure/news/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> addNews(@RequestParam("title") String title,
                                          @RequestParam("description") String description,
                                          @RequestParam("endDate") String endDate,
                                          @RequestParam("attachment") MultipartFile attachment,
                                          @RequestParam("newsType") Long newsTypeId,
                                          @RequestParam("whatsNew") boolean whatsNew) {

        try {
            News news = new News();
            news.setTitle(title);
            news.setDescription(description);
            news.setEndDate(java.sql.Date.valueOf(endDate));
            news.setWhatsNew(whatsNew);

            NewsType newsType = newsTypeService.getNewsTypeById(newsTypeId);
            if (newsType == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid News Type ID.");
            }
            news.setNewsType(newsType);

            // Pass the news entity and the attachment to the saveNews method
            news = newsService.saveNews(news, attachment);

            // Check if news is successfully saved before proceeding
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


        String filePath = uploadDirectory + File.separator + fileName;


        Resource resource = fileUploadService.loadFileAsResource(filePath);


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
}

