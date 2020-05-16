package com.example.hellojava.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping(value = "/hello/{s}")
    @ResponseBody
    public String getGreeting(
            @PathVariable("s") String s) {
        if (s == null || s.length() == 0) {
            s = "world";
        }
        return "Hello, " + s + "!";
    }

}
