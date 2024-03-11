package com.dect.website.controller;


import com.dect.website.entity.primary.Notification;
import com.dect.website.entity.primary.NotificationType;
import com.dect.website.service.NotificationFileUploadService;
import com.dect.website.service.NotificationService;
import com.dect.website.service.NotitificationTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class NotificationController {

    @Autowired
    NotificationService notificationService;


    @Autowired
    NotitificationTypeService notitificationTypeService;

    @Autowired
    NotificationFileUploadService notificationFileUploadService;

    @Value("${upload.notifications-directory}")
    private String notificationsDirectory;

    @PostMapping(value = "/secure/notification/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> addNotification(@RequestParam("title") String title,
                                          @RequestParam("description") String description,
                                          @RequestParam("startDate") String startDate,
                                          @RequestParam("endDate") String endDate,
                                          @RequestParam("attachment") MultipartFile attachment,
                                          @RequestParam("notificationType") Long notificationTypeId,
                                          @RequestParam("whatsNew") boolean whatsNew) {

        try {
            Notification notification = new Notification();
            notification.setTitle(title);
            notification.setDescription(description);
            notification.setStartDate(java.sql.Date.valueOf(startDate));
            notification.setEndDate(java.sql.Date.valueOf(endDate));
            notification.setWhatsNew(whatsNew);

            NotificationType notificationType = notitificationTypeService.getNotificationTypeById(notificationTypeId);
            if (notificationType == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid Notification Type ID.");
            }
            notification.setNotificationType(notificationType);


            notification = notificationService.saveNotification(notification, attachment);


            if (notification != null) {
                return ResponseEntity.status(HttpStatus.CREATED).body("Notification saved successfully.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save notification.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save notification.");
        }
    }

    @GetMapping("notification/all")
    @ResponseBody
    public List<Notification> getAllNotification() {
        return notificationService.viewNotifications();
    }


    @GetMapping("/notification/attachment/{notificationId}")
    public ResponseEntity<Resource> downloadAttachment(@PathVariable Long notificationId) throws IOException {

        String fileName = notificationService.getAttachmentName(notificationId);


        String filePath = notificationsDirectory + File.separator + fileName;


        Resource resource = notificationFileUploadService.loadFileAsResource(filePath);


        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"");
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE); // Set the content type to PDF

        return ResponseEntity.ok()
                .headers(headers)
                .body(resource);
    }

    @GetMapping("/notifications/by-type")
    public ResponseEntity<List<Notification>> getNewsByType(@RequestParam Integer notificationTypeId) {
        return ResponseEntity.ok(notificationService.getNotificationsByTypeId(notificationTypeId));
    }

    @GetMapping("notifications/whatsNew")
    public ResponseEntity<List<Notification>> getWhatsNew() {
        List<Notification> top5Notifications = notificationService.getTop5WhatsNew();
        return new ResponseEntity<>(top5Notifications, HttpStatus.OK);
    }

    @PostMapping("/notifications/delete/{id}")
    public ResponseEntity<String> deleteNotification(@PathVariable("id") Long id) {
        notificationService.deleteNotification(id, false);
        return ResponseEntity.ok("Notification item deleted successfully");
    }
}
