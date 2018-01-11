package com.bdqn.service.role;

import com.bdqn.dao.role.RoleMenuMapper;
import com.bdqn.dao.role.RoleUserMapper;
import com.bdqn.pojo.Role;
import com.bdqn.pojo.TMenu;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2018/1/10.
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleUserMapper roleUserMapper;
    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Override
    public Role findRoleBytUserID(Integer tUserID) {
        return roleUserMapper.findRoleBytUserID(tUserID);
    }

    @Override
    public List<TMenu> findTMenuByRoleID(Integer roleID) {
        return roleMenuMapper.findTMenuByRoleID(roleID);
    }

    @Override
    public List<TMenu> findTMenuByParentID(Integer roleID, Integer parentID) {
        return roleMenuMapper.findTMenuByParentID(roleID,parentID);
    }
}
