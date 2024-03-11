package com.dect.website.controller;

import com.dect.website.entity.primary.News;
import com.dect.website.entity.primary.NotificationType;
import com.dect.website.service.NotitificationTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class NotificationTypeController {

    @Autowired
    NotitificationTypeService notitificationTypeService;

    @GetMapping("notification/types")
    public ResponseEntity<List<NotificationType>> getAllNotificationType(){
        List<NotificationType> notificationTypes = notitificationTypeService.getAllNotificationTypes();
        return new ResponseEntity<>(notificationTypes, HttpStatus.OK);
    }

}
