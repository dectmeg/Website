package com.dect.website.controller;

import com.dect.website.entity.primary.Users;
import com.dect.website.helper.CaptchaHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CaptchaController {

    @ResponseBody
    @GetMapping("/refresh-captcha")
    public Users refreshCaptcha() {
        Users users = new Users();
        CaptchaHelper.getCaptcha(users);
        return users;
    }
}
