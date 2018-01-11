package com.bdqn.pojo;

/**
 * Created by hp on 2018/1/10.
 */
public class RoleMenu {
    private Integer id;
    private Role role;
    private TMenu tMenu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public TMenu gettMenu() {
        return tMenu;
    }

    public void settMenu(TMenu tMenu) {
        this.tMenu = tMenu;
    }

    @Override
    public String toString() {
        return "RoleMenu{" +
                "id=" + id +
                ", role=" + role +
                ", tMenu=" + tMenu +
                '}';
    }
}
