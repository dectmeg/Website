package com.dect.website.controller;
import com.dect.website.entity.primary.NewsType;
import com.dect.website.service.NewsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class NewsCategoryController {

    @Autowired
    private NewsTypeService newsTypeService;

    @PostMapping("secure/news/addCategory")
    @ResponseBody
    public ResponseEntity<String> addCategory(@RequestParam("categoryName") String categoryName) {
        try {
            NewsType newsType = new NewsType();
            newsType.setName(categoryName);

            newsTypeService.saveNewsType(newsType);

            return ResponseEntity.status(HttpStatus.CREATED).body("Category saved successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save category.");
        }
    }

    @GetMapping("/news/viewCategory")
    public ResponseEntity<List<NewsType>> viewNewsCategories() {
        List<NewsType> newsCategories = newsTypeService.getAllNewsTypes();
        return new ResponseEntity<>(newsCategories, HttpStatus.OK);
    }
}
