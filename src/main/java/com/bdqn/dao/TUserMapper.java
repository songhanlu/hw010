package com.bdqn.dao;

import com.bdqn.pojo.TUser;

import java.util.List;

/**
 * Created by hp on 2017/12/7.
 */
public interface TUserMapper {
    TUser findTUser(TUser tUser);

    List<TUser> findAll();
}
