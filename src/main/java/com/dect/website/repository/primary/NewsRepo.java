package com.dect.website.repository.primary;

import com.dect.website.entity.primary.News;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NewsRepo extends JpaRepository<News, Integer> {
    List<News> findAllByIsLiveOrderByUploadDateDescIdDesc(boolean isLive);

    List<News> findTop5ByWhatsNewAndIsLiveTrueOrderByUploadDateDescIdDesc(boolean flag);

    List<News> findByNewsTypeIdAndIsLiveTrueOrderByUploadDateDescIdDesc(Integer newsTypeId);
}
