package com.bdqn.pojo;

/**
 * Created by hp on 2018/1/10.
 */
public class TMenu {
    private Integer id;
    private String text;
    private String menu_url;
    private Integer parent_id;

    @Override
    public String toString() {
        return "TMenu{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", menu_url='" + menu_url + '\'' +
                ", parent_id=" + parent_id +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getMenu_url() {
        return menu_url;
    }

    public void setMenu_url(String menu_url) {
        this.menu_url = menu_url;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }
}
