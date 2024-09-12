package com.dect.website.controller;

import com.dect.website.entity.primary.AuditTrail;
import com.dect.website.entity.primary.News;
import com.dect.website.service.AuditTrailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AuditTrailController {

    @Autowired
    AuditTrailService auditTrailService;

    @GetMapping("/secure/audit-trail/all")
    @ResponseBody
    public List<AuditTrail> getAllAuditTrails() {
        return auditTrailService.getAllAuditTrails();
    }
}
