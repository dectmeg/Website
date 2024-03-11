package com.dect.website.repository.primary;

import com.dect.website.entity.primary.NotificationType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationTypeRepository extends JpaRepository<NotificationType, Long> {
}
