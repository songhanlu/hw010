package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.pojo.Score;
import com.bdqn.service.score.ScoreService;
import com.bdqn.tools.PageUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by hp on 2017/12/26.
 */
@Controller
@RequestMapping("/score")
public class ScoreController {
    @Resource
    private ScoreService scoreService;
    @RequestMapping("/toScore")
    public String toScore(){
        return "score/score";
    }

    @RequestMapping(value = "/findAllScore",method = RequestMethod.GET,
                    produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String findAllScore(Integer page,
                               Integer rows,
                               Integer studentID,
                               Integer gradeID){
        if(studentID!=null && studentID==-1){
            studentID=null;
        }
        if(gradeID!=null && gradeID==-1){
            gradeID=null;
        }
        PageInfo<Score> pageInfo = scoreService.findAllScore(page, rows, studentID, gradeID);
        return JSON.toJSONString(new PageUtil<Score>(pageInfo));
    }
}
