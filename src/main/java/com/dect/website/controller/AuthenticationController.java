package com.dect.website.controller;

import com.dect.website.dtos.LoginDTO;
import com.dect.website.entity.primary.Users;
import com.dect.website.helper.CaptchaHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class AuthenticationController {

    @GetMapping("/login")
    public String getLogin(@ModelAttribute("user") LoginDTO loginDTO, Model model) {
        Users users = new Users();
        CaptchaHelper.getCaptcha(users);
        model.addAttribute("realCaptcha", users.getRealCaptcha());
        model.addAttribute("hiddenCaptcha", users.getHiddenCaptcha());
        return "/login";
    }
}
