package com.dect.website.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.MethodNotAllowedException;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodNotAllowedException.class)
    @ResponseBody
    public ResponseEntity<String> handleMethodNotAllowedException() {
        return new ResponseEntity<>("Method Not Allowed", HttpStatus.METHOD_NOT_ALLOWED);
    }
}
