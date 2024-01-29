package com.dect.website.controller;

import com.dect.website.dtos.LoginDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class AuthenticationController {

    @GetMapping("login")
    public String getLogin(@ModelAttribute("user") LoginDTO loginDTO) {
        return "/login";
    }


}
