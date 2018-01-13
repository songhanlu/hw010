package com.bdqn.service.student;

import com.bdqn.pojo.Grade;
import com.bdqn.pojo.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by hp on 2017/12/16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class StudentServiceImplTest {
    @Test
    public void deleteStudentAndGrade() throws Exception {
        studentService.deleteStudentAndGrade(1);
    }

    @Resource
    private StudentService studentService;
    @Test
    public void addStudent() throws Exception {
        Grade grade = new Grade();
        grade.setId(56);
        grade.setGrade_name("ACCID0001");
        Student student = new Student();
        student.setAge(12);
        student.setGender("女");
        student.setGrade(grade);
        student.setStudent_name("送汉莎6");
        int result = studentService.addStudent(student);
        System.out.println(result);
    }

}