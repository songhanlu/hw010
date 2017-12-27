package com.bdqn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hp on 2017/12/27.
 */
@Controller
@RequestMapping("/jsondemo")
public class JSONDemoController {
    @RequestMapping("/toJsondemo")
    public String toJsondemo(){
        return "jsonDemo/jsonDemo";
    }
}
