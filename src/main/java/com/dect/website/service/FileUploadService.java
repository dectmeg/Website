package com.dect.website.service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileUploadService {

    @Value("${upload.directory}")
    private String uploadDirectory;

    public String saveFile(MultipartFile file, String fileName) throws IOException {
        String filePath = Paths.get(uploadDirectory, fileName).toString();
        file.transferTo(new File(filePath));
        return fileName; // Return the original file name instead of the full file path
    }

    public Resource loadFileAsResource(String filePath) throws IOException {
        try {
            Path path = Paths.get(filePath);
            Resource resource = new UrlResource(path.toUri());

            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new RuntimeException("Could not read the file!");
            }
        } catch (MalformedURLException ex) {
            throw new RuntimeException("Malformed URL exception occurred.", ex);
        }
    }
}

