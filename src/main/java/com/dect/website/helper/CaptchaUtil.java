package com.dect.website.helper;

import cn.apiclub.captcha.Captcha;
import cn.apiclub.captcha.backgrounds.GradiatedBackgroundProducer;
import cn.apiclub.captcha.noise.CurvedLineNoiseProducer;
import cn.apiclub.captcha.text.producer.DefaultTextProducer;
import cn.apiclub.captcha.text.renderer.DefaultWordRenderer;

import javax.imageio.ImageIO;
import java.io.ByteArrayOutputStream;
import java.util.Base64;

public class CaptchaUtil {

    public static Captcha createCaptcha(Integer width, Integer height) {
        char[] DEFAULT_CHARS = new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'k', 'm', 'n', 'p', 'r', 'w', 'x', 'y', '2', '3', '4', '5', '6', '7', '8'};
        return new Captcha.Builder(width, height)
                .addBackground(new GradiatedBackgroundProducer())
                .addText(new DefaultTextProducer(6, DEFAULT_CHARS), new DefaultWordRenderer())
                .addNoise(new CurvedLineNoiseProducer())
                .build();
    }

    public static String encodeCaptcha(Captcha captcha) {
        String image = null;
        try {
            ByteArrayOutputStream bos= new ByteArrayOutputStream();
            ImageIO.write(captcha.getImage(),"jpg", bos);
            byte[] byteArray= Base64.getEncoder().encode(bos.toByteArray());
            image = new String(byteArray);
        } catch (Exception e) {
            throw new RuntimeException("encoding of captcha failed");
        }
        return image;
    }
}