package com.dect.website.repository;

import com.dect.website.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsRepo extends JpaRepository<News, Integer> {
    //private String saveNews(News news);
}
