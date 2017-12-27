package com.bdqn.controller;

import com.bdqn.pojo.TUser;
import com.bdqn.service.TUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by hp on 2017/12/7.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private TUserService tUserService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(TUser tUser,
                        HttpSession session,
                        Model model) {
        TUser login = tUserService.login(tUser);
        if (login != null) {
            session.setAttribute("current_user",login);
            return "easyUI/main";
        }
        model.addAttribute("message", "用户名或密码错误");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("current_user");
        return "index";
    }
}
