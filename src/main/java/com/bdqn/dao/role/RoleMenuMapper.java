package com.bdqn.dao.role;

import com.bdqn.pojo.TMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by hp on 2018/1/10.
 */
public interface RoleMenuMapper {
    //根据roleID查询菜单列表
    List<TMenu> findTMenuByRoleID(Integer roleID);

    //根据parentID查询菜单列表
    List<TMenu> findTMenuByParentID(@Param("roleID") Integer roleID,
                                    @Param("parentID") Integer parentID);
}
