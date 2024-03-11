package com.dect.website.repository.primary;

import com.dect.website.entity.primary.News;
import com.dect.website.entity.primary.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findAllByIsLiveOrderByUploadDateDescIdDesc(boolean isLive);

    List<Notification> findTop5ByWhatsNewAndIsLiveTrueOrderByUploadDateDescIdDesc(boolean flag);

    List<Notification> findByNotificationTypeIdAndIsLiveTrueOrderByUploadDateDescIdDesc(Integer notificationTypeId);
}
