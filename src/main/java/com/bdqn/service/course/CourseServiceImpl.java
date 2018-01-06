package com.bdqn.service.course;

import com.bdqn.dao.course.CourseMapper;
import com.bdqn.pojo.Course;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2018/1/6.
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    private CourseMapper courseMapper;
    @Override
    public List<Course> findAllCourse() {
        return courseMapper.findAllCourse();
    }
}
