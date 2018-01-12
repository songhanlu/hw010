package com.bdqn.service.student;

import com.bdqn.pojo.Student;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by hp on 2017/12/13.
 */
public interface StudentService {
    PageInfo<Student> findStudentByPage(Integer pageNum, Integer pageSize);
    Integer deleteStudentByIDs(List<Integer> IDs);
    Integer addStudent(Student student);

    Student findStudentByID(Integer id);

    Integer updateStudent(Student student);

    List<Student> findStudentsByGradeID(Integer gradeID);

    Integer deleteStudentAndGrade(Integer gradeID);
}
