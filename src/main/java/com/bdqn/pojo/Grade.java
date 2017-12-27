package com.bdqn.pojo;


import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by hp on 2017/12/9.
 */
public class Grade {
    private int id;
    private String grade_name;
    @JSONField(format = "yyyy-MM-dd")
    private Date create_date;
    private String details;

    @Override
    public String toString() {
        return "Grade{" +
                "id=" + id +
                ", grade_name='" + grade_name + '\'' +
                ", create_date=" + create_date +
                ", details='" + details + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGrade_name() {
        return grade_name;
    }

    public void setGrade_name(String grade_name) {
        this.grade_name = grade_name;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
