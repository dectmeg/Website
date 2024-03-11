package com.dect.website.service;

import com.dect.website.entity.primary.NewsType;
import com.dect.website.entity.primary.NotificationType;
import com.dect.website.repository.primary.NotificationTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NotitificationTypeService {

    @Autowired
    NotificationTypeRepository notificationTypeRepository;

    public List<NotificationType> getAllNotificationTypes() {
        return notificationTypeRepository.findAll();
    }

    public NotificationType getNotificationTypeById(Long notificationTypeId) {
        Optional<NotificationType> optionalNotificationType = notificationTypeRepository.findById(notificationTypeId);
        return optionalNotificationType.orElse(null);
    }
}
