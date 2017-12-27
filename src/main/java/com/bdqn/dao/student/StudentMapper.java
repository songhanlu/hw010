package com.bdqn.dao.student;

import com.bdqn.pojo.Student;

import java.util.List;

/**
 * Created by hp on 2017/12/13.
 */
public interface StudentMapper {
    List<Student> findAll();
    Integer deleteStudentByIDs(List<Integer> IDs);

    Integer addStudent(Student student);

    Student findStudentByID(Integer id);

    Integer updateStudent(Student student);
}
