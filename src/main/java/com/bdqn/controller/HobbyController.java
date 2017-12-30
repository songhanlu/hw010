package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.pojo.Hobby;
import com.bdqn.service.hobby.HobbyService;
import com.bdqn.tools.Comm;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hp on 2017/12/26.
 */
@Controller
@RequestMapping("/hobby")
public class HobbyController {
    @Resource
    private HobbyService hobbyService;

    @RequestMapping("/toHobby")
    public String toHobby(){
        return "hobby/hobby";
    }

    @RequestMapping(value = "/findAllByPage",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findAllByPage(Integer page,Integer rows){
        PageInfo<Hobby> pageInfo = hobbyService.findAllByPage(page, rows);
        Map<String,Object> map = new HashMap<>();
        map.put("total", pageInfo.getTotal());
        map.put("rows", pageInfo.getList());
        return JSON.toJSONString(map);
    }

    @RequestMapping(value = "/add", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.POST)
    @ResponseBody
    public String add(Hobby hobby) {
        int result = hobbyService.add(hobby);
        if(result>0){
            return JSON.toJSONString(Comm.success());
        }
        return JSON.toJSONString(Comm.failed());
    }

}
