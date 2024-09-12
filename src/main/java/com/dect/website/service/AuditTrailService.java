package com.dect.website.service;

import com.dect.website.entity.primary.AuditTrail;
import com.dect.website.repository.primary.AuditTrailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuditTrailService {

    @Autowired
    private AuditTrailRepository auditTrailRepository;

    public List<AuditTrail> getAllAuditTrails() {
        return auditTrailRepository.findAllByOrderByRequestedOnDesc();
    }
}
