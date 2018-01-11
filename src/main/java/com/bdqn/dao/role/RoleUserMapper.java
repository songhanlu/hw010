package com.bdqn.dao.role;

import com.bdqn.pojo.Role;

/**
 * Created by hp on 2018/1/10.
 */
public interface RoleUserMapper {
    //根据tUserID查询Role
    Role findRoleBytUserID(Integer tUserID);
}
