package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.bdqn.pojo.Grade;
import com.bdqn.service.grade.GradeService;
import com.bdqn.tools.Comm;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hp on 2017/12/9.
 */
@Controller
@RequestMapping("/grade")
public class GradeController {
    @Resource
    private GradeService gradeService;

    @RequestMapping("/toGrade")
    public String toGrade(int pageNum, int pageSize, Model model) {
        PageInfo<Grade> pageInfo = gradeService.findGradeByPage(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "grade/grade";
    }

    @RequestMapping(value = "/findGradeByID",method = RequestMethod.GET,
                    produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findGradeByID(Integer gradeID){
        Grade grade = gradeService.findGradeByID(gradeID);
        return JSONArray.toJSONString(grade);
    }

    @RequestMapping(value = "/delGradeByID",method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String delGradeByID(Integer gradeID){
        int result = gradeService.delGradeByID(gradeID);
        if(result>0){
            return JSONArray.toJSONString(Comm.message("0000", "操作成功！"));
        }
        return JSONArray.toJSONString(Comm.message("00001", "操作失败！"));
    }

    @RequestMapping(value = "/delGradeByIDs",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String delGradeByIDs(String gradeIDs){
        String[] gradeIDsStr = gradeIDs.split(",");
        List<Integer> gradeIDss = new ArrayList<>();
        for (String s : gradeIDsStr) {
            gradeIDss.add(Integer.parseInt(s));
        }
        int result = gradeService.delGradeByIDs(gradeIDss);
        if(result>0){
            return JSONArray.toJSONString(Comm.message("0000", "操作成功！"));
        }
        return JSONArray.toJSONString(Comm.message("0001", "操作失败！"));
    }

    @RequestMapping(value = "/addGrade",method = RequestMethod.POST,
    produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addGrade(Grade grade){
        int result = gradeService.addGrade(grade);
        if (result>0){
            return JSON.toJSONString(Comm.success());
        }
        return JSON.toJSONString(Comm.failed());
    }

    @RequestMapping(value = "/updateGrade",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateGrade(Grade grade){
        int result = gradeService.updateGrade(grade);
        if (result>0){
            return JSON.toJSONString(Comm.success());
        }
        return JSON.toJSONString(Comm.failed());
    }

}
