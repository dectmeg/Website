package com.dect.website.repository.primary;

import com.dect.website.entity.primary.News;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NewsRepo extends JpaRepository<News, Integer> {
    List<News> findAllByOrderByDateDescIdDesc();

    List<News> findTop5ByWhatsNewOrderByDateDescIdDesc(boolean flag);

    List<News> findByNewsTypeId(Integer newsTypeId);
}
