package com.dect.website.service;

import com.dect.website.entity.News;
import com.dect.website.repository.NewsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {

    @Autowired
    private NewsRepo newsRepo;

    public News saveNews(News news) {
        return newsRepo.save(news);
    }

    public List<News> viewNews() {
        return newsRepo.findAll();
    }

}
