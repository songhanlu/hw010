package com.bdqn.dao.course;

import com.bdqn.pojo.Course;

import java.util.List;

/**
 * Created by hp on 2018/1/6.
 */
public interface CourseMapper {
    List<Course> findAllCourse();
}