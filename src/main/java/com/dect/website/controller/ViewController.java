package com.dect.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @GetMapping("/contact_us")
    public String showContactPage() {
        return "contact_us";
    }

    @GetMapping("/about_us")
    public String showAboutPage() {
        return "about_us";
    }

    @GetMapping("/organization_structure")
    public String showOrganizationStruicture() {
        return "organization_structure";
    }

    @GetMapping("/key_contacts")
    public String showKeyContacts() {
        return "key_contacts";
    }
    @GetMapping("/employment_services/about_us")
    public String showEmploymentAbout() {
        return "employmentServices/about_us";
    }

    @GetMapping("/employment_services/employment_exchanges")
    public String showEmploymentExchanges() {
        return "employmentServices/employment_exchanges";
    }

    @GetMapping("/employment_services/my_registration")
    public String showMyRegistration() {
        return "employmentServices/my_registration";
    }

    @GetMapping("/employment_services/acts")
    public String showActs() {
        return "employmentServices/acts";
    }
    @GetMapping("/employment_services/faqs")
    public String showEmploymemntFaqs() {
        return "employmentServices/faqs";
    }

    @GetMapping("/employment_services/key_contacts")
    public String showEmploymemntKeyContacts() {
        return "employmentServices/key_contacts";
    }

    @GetMapping("/training_services/about_us")
    public String showTrainingAbout() {
        return "/trainingServices/about_us";
    }
    @GetMapping("/training_services/cts")
    public String showTrainingCTS() {
        return "/trainingServices/cts";
    }

    @GetMapping("/training_services/sdis")
    public String showTrainingSDIS() {
        return "/trainingServices/sdis";
    }

    @GetMapping("/training_services/stjo")
    public String showTrainingSTJO() {
        return "/trainingServices/stjo";
    }
    @GetMapping("/training_services/ats")
    public String showTrainingATS() {
        return "/trainingServices/ats";
    }

    @GetMapping("/secure/dashboard")
    public String showAdminDashboard() {
        return "secure/dashboard";
    }

    @GetMapping("/secure/services")
    public String showAdminServices() {
        return "secure/services";
    }
    @GetMapping("/secure/users")
    public String showAdminUsers() {
        return "secure/users";
    }

    @GetMapping("/secure/news")
    public String showAdminNews() {
        return "secure/add_news";
    }
}
