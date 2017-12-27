package com.bdqn.pojo;

import java.util.Date;

/**
 * Created by hp on 2017/12/27.
 */
public class Hobby {
    private int id;
    private String hobby_name;
    private Date create_time;

    @Override
    public String toString() {
        return "Hobby{" +
                "id=" + id +
                ", hobby_name='" + hobby_name + '\'' +
                ", create_time=" + create_time +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHobby_name() {
        return hobby_name;
    }

    public void setHobby_name(String hobby_name) {
        this.hobby_name = hobby_name;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
