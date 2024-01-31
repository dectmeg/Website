package com.dect.website.service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@Service
public class FileUploadService {

    @Value("${upload.directory}")
    private String uploadDirectory;

    public String saveFile(MultipartFile file, String fileName) throws IOException {
        String filePath = Paths.get(uploadDirectory, fileName).toString();
        file.transferTo(new File(filePath));
        return filePath;
    }
}
