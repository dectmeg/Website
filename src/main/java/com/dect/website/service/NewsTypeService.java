package com.dect.website.service;

import com.dect.website.entity.primary.NewsType;
import com.dect.website.repository.primary.NewsTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NewsTypeService {

    @Autowired
    private NewsTypeRepository newsTypeRepository;

    public List<NewsType> getAllNewsTypes() {
        return newsTypeRepository.findAll();
    }

    public NewsType getNewsTypesById(Long id){
        return newsTypeRepository.getById(id);
    }

    public NewsType getNewsTypeById(Long newsTypeId) {
        Optional<NewsType> optionalNewsType = newsTypeRepository.findById(newsTypeId);
        return optionalNewsType.orElse(null);
    }

    public NewsType saveNewsType(NewsType newsType) {
        return newsTypeRepository.save(newsType);
    }

}
