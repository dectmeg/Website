package com.dect.website.controller;

import com.dect.website.entity.News;
import com.dect.website.entity.NewsType;
import com.dect.website.service.FileUploadService;
import com.dect.website.service.NewsService;
import com.dect.website.service.NewsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsTypeService newsTypeService;

    @Autowired
    private FileUploadService fileUploadService;

    @PostMapping(value = "/secure/news/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> addNews(@RequestParam("title") String title,
                                          @RequestParam("description") String description,
                                          @RequestParam("date") String date,
                                          @RequestParam("attachment") MultipartFile attachment,
                                          @RequestParam("newsType") Long newsTypeId) {

        try {
            News news = new News();
            news.setTitle(title);
            news.setDescription(description);
            news.setDate(java.sql.Date.valueOf(date));

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




    @GetMapping("secure/news/types")
    public ResponseEntity<?> getNewsTypes() {
        return new ResponseEntity<>(newsTypeService.getAllNewsTypes(), HttpStatus.OK);
    }

    @GetMapping("news/all")
    @ResponseBody
    public List<News> getAllNews() {
        return newsService.viewNews();
    }
}

