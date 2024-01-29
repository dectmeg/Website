package com.dect.website.controller;

import com.dect.website.entity.News;
import com.dect.website.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @PostMapping("/secure/news/add")
    public ResponseEntity<String> addNews(@RequestParam("title") String title,
                                          @RequestParam("description") String description,
                                          @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
                                          @RequestParam("attachment") MultipartFile attachment) throws IOException {

        byte[] attachmentBytes = (attachment != null) ? attachment.getBytes() : null;

        News news = new News();
        news.setTitle(title);
        news.setDescription(description);
        news.setDate(date);
        news.setAttachment(attachmentBytes);

        news = newsService.saveNews(news);

        return ResponseEntity.status(HttpStatus.OK).body("{\"message\": \"News added successfully\"}");
    }

//    @GetMapping("/secure/news")
//    public String viewNews(Model model) {
//        List<News> newsList = newsService.viewNews();
//        model.addAttribute("newsList", newsList);
//        return "news"; // Replace with the actual template name
//    }
}

