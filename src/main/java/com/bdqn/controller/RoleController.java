package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.pojo.TMenu;
import com.bdqn.service.role.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2018/1/10.
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;



    @RequestMapping(value = "/menu", method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String menu(Integer roleID, Integer parentID) {
        List<TMenu> tMenus = roleService.findTMenuByParentID(roleID,parentID);
        return JSON.toJSONString(tMenus);
    }
}
