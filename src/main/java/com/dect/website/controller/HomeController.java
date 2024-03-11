package com.dect.website.controller;

import com.dect.website.repository.secondary.GetCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class HomeController {
    @Autowired
    private GetCountService getCountService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "Greetings from Spring Boot and Thymeleaf!");
        Map<String, Object> count=getCountService.getCounts();
        model.addAttribute("getCount",count);
        return "index";
    }

    @GetMapping("/getCount")
    public ResponseEntity<?> getCount(){
//        Object obj=getCountService.getCounts();
//        for(Object ob:obj){
//            System.out.println(ob);
//        }
            return ResponseEntity.ok(getCountService.getCounts());
        }
}
