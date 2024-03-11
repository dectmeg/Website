package com.dect.website.entity.primary;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.Hibernate;
import org.hibernate.proxy.HibernateProxy;

import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Getter
@Setter
@ToString
@Builder
@Table(name = "audit_trail")
@NoArgsConstructor
@AllArgsConstructor
public class AuditTrail {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "auditTrail_ger")
    @SequenceGenerator(name = "auditTrail", sequenceName = "auditTrail_ger", initialValue = 1, allocationSize = 1)

    @Column(name = "id")
    private Long auditTrailId;

    private String ipAddress;

    private String userName;

    @Column(name = "user_agent")
    private String userAgent;

    private String url;

    @Column(name = "http_method")
    private String httpMethod;

    @Column(name = "requested_on")
    private LocalDateTime requestedOn;

    @Column(name = "response_status")
    private String responseStatus;

    private String action;

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ? ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        AuditTrail that = (AuditTrail) o;
        return getAuditTrailId() != null && Objects.equals(getAuditTrailId(), that.getAuditTrailId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() : getClass().hashCode();
    }
}
