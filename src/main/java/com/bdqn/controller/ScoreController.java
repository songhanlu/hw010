package com.bdqn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hp on 2017/12/26.
 */
@Controller
@RequestMapping("/score")
public class ScoreController {
    @RequestMapping("/toScore")
    public String toScore(){
        return "score/score";
    }
}
