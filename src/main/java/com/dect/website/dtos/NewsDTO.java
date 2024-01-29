package com.dect.website.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewsDTO {

    private String title;
    private String description;
    private Date date;
    private MultipartFile attachment;
}
