package com.dect.website.service;


import com.dect.website.entity.primary.Notification;
import com.dect.website.repository.primary.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private NotificationFileUploadService notificationFileUploadService;

    @Value("${upload.notifications-directory}")
    private String notificationDirectory;

    public Notification saveNotification(Notification notfication, MultipartFile attachment) {
        try {
            String fileName = generateUniqueFileName(attachment.getOriginalFilename());

            String fileLocation = notificationFileUploadService.saveFile(attachment, fileName);

            notfication.setAttachmentName(fileName);

            return notificationRepository.save(notfication);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String generateUniqueFileName(String originalFileName) {
        // Generate a unique file name by appending a timestamp
        String timestamp = "_" + System.currentTimeMillis();
        int lastDotIndex = originalFileName.lastIndexOf('.');

        if (lastDotIndex != -1) {
            // Insert the timestamp before the file extension
            return originalFileName.substring(0, lastDotIndex) + timestamp + originalFileName.substring(lastDotIndex);
        } else {
            // If there's no file extension, just append the timestamp
            return originalFileName + timestamp;
        }
    }

    public String getAttachmentName(Long notificationId) {
        Optional<Notification> optionalNotification = notificationRepository.findById(notificationId);
        if (optionalNotification.isPresent()) {
            Notification notification = optionalNotification.get();
            return notification.getAttachmentName();
        }
        return null;
    }

    public List<Notification> viewNotifications() {
        return notificationRepository.findAllByIsLiveOrderByUploadDateDescIdDesc(true);
    }

    public List<Notification> getNotificationsByTypeId(Integer notificationType) {
        return notificationRepository.findByNotificationTypeIdAndIsLiveTrueOrderByUploadDateDescIdDesc(notificationType);
    }

    public List<Notification> getTop5WhatsNew() {
        return notificationRepository.findTop5ByWhatsNewAndIsLiveTrueOrderByUploadDateDescIdDesc(true);
    }

    public void deleteNotification(Long id, boolean isLive) {
        Notification notification = notificationRepository.findById(id).orElse(null);
        if (notification != null) {
            notification.setIsLive(false);
            notificationRepository.save(notification);
        }
    }
}
