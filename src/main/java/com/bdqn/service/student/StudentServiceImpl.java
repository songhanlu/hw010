package com.bdqn.service.student;

import com.bdqn.dao.student.StudentMapper;
import com.bdqn.dao.studentNum.StudentNumMapper;
import com.bdqn.pojo.Grade;
import com.bdqn.pojo.Student;
import com.bdqn.tools.Comm;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2017/12/13.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;
    @Resource
    private StudentNumMapper studentNumMapper;


    @Override
    public PageInfo<Student> findStudentByPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Student> students = studentMapper.findAll();
        PageInfo<Student> pageInfo = new PageInfo<>(students);
        return pageInfo;
    }

    @Override
    public Integer deleteStudentByIDs(List<Integer> IDs) {
        return studentMapper.deleteStudentByIDs(IDs);
    }

    @Override
    public Integer addStudent(Student student) {
        Grade grade = student.getGrade();
        int gradeID = grade.getId();
        String gradeName = grade.getGrade_name();
        int maxNum = studentNumMapper.findMaxNum(gradeID);
        maxNum++;
        int currentLength = (gradeName + maxNum).length();
        int n = Comm.MAX_STUDENT_NUM_N - currentLength;
        for(int i = 0; i < n; i ++){
            gradeName+=0;
        }
        student.setStudent_num(gradeName + maxNum);
        studentNumMapper.updateMaxNum(gradeID);
        return studentMapper.addStudent(student);
    }

    @Override
    public Student findStudentByID(Integer id) {
        return studentMapper.findStudentByID(id);
    }

    @Override
    public Integer updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }


}
