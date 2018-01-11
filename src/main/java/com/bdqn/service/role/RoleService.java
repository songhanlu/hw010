package com.bdqn.service.role;

import com.bdqn.pojo.Role;
import com.bdqn.pojo.TMenu;

import java.util.List;

/**
 * Created by hp on 2018/1/10.
 */
public interface RoleService {
    //根据tUserID查询Role
    Role findRoleBytUserID(Integer tUserID);
    //根据roleID查询菜单列表
    List<TMenu> findTMenuByRoleID(Integer roleID);
    //根据parentID查询菜单列表
    List<TMenu> findTMenuByParentID(Integer roleID,Integer parentID);

}
