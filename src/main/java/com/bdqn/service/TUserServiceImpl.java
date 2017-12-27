package com.bdqn.service;

import com.bdqn.dao.TUserMapper;
import com.bdqn.pojo.Student;
import com.bdqn.pojo.TUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2017/12/7.
 */
@Service("tUserService")
public class TUserServiceImpl implements TUserService {
    @Resource
    private TUserMapper tUserMapper;
    @Override
    public TUser login(TUser tUser) {
        return tUserMapper.findTUser(tUser);
    }

    @Override
    public Integer addStudent(Student student) {
        return 0;
    }

    @Override
    public PageInfo<TUser> tUserPage(int currentPageNo, int eachPageCount) {
        PageHelper.startPage(currentPageNo, eachPageCount);
        List<TUser> tUsers = tUserMapper.findAll();
        PageInfo<TUser> pageInfo = new PageInfo<>(tUsers);
        return pageInfo;
    }
}
