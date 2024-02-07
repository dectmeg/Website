package com.dect.website.repository.primary;

import com.dect.website.entity.primary.NewsType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsTypeRepository extends JpaRepository<NewsType, Long> {
}