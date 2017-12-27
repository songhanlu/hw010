package com.bdqn.service;

import com.bdqn.pojo.Student;
import com.bdqn.pojo.TUser;
import com.github.pagehelper.PageInfo;

/**
 * Created by hp on 2017/12/7.
 */
public interface TUserService {
    TUser login(TUser tUser);
    Integer addStudent(Student student);
    PageInfo<TUser> tUserPage(int currentPageNo, int eachPageCount);
}
