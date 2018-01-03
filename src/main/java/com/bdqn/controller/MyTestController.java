package com.bdqn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hp on 2017/12/28.
 */
@Controller
@RequestMapping("/test")
public class MyTestController {
    @RequestMapping("/toTest")
    public String toTest(){
        return "test/test";
    }

    @RequestMapping("/toDate")
    public String toDate(){
        return "test/toDate";
    }
}
