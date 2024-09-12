package com.dect.website.helper;

import cn.apiclub.captcha.Captcha;
import com.dect.website.entity.primary.Users;

public class CaptchaHelper {
    
      public static void getCaptcha(Users users) {
        try {
            Captcha captcha = CaptchaUtil.createCaptcha(200, 50);
            users.setHiddenCaptcha(captcha.getAnswer());
            users.setCaptcha("");
            users.setRealCaptcha(CaptchaUtil.encodeCaptcha(captcha));
        } catch (Exception e) {
            throw new RuntimeException("Captcha cannot be generated!");
        }

    }
}
