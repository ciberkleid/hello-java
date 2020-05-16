package com.example.hellojava.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class HomeController {

    String[] messages = {
            "Cool beans!",
            "Cool as a cucumber",
            "Cool as a breeze on a hot summer day",
            "Cool like a fool in a swimming pool"
    };

    Random random = new Random();

    @RequestMapping("/")
    public String getMessage() {
        int index = random.nextInt(messages.length);
        return messages[index];
    }

}
