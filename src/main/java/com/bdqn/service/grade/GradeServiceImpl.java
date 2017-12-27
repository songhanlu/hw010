package com.bdqn.service.grade;

import com.bdqn.dao.grade.GradeMapper;
import com.bdqn.dao.studentNum.StudentNumMapper;
import com.bdqn.pojo.Grade;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2017/12/9.
 */
@Service
public class GradeServiceImpl implements GradeService {
    @Resource
    private GradeMapper gradeMapper;
    @Resource
    private StudentNumMapper studentNumMapper;

    @Override
    public PageInfo<Grade> findGradeByPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Grade> grades = gradeMapper.findAll();
        PageInfo<Grade> pageInfo = new PageInfo<>(grades);
        return pageInfo;
    }

    @Override
    public Grade findGradeByID(Integer gradeID) {
        return gradeMapper.findGradeByID(gradeID);
    }

    @Override
    public Integer delGradeByID(Integer id) {
        return gradeMapper.delGradeByID(id);
    }

    @Override
    public Integer delGradeByIDs(List<Integer> ids) {
        return gradeMapper.delGradeByIDs(ids);
    }

    @Override
    public Integer addGrade(Grade grade) {
        int result = gradeMapper.addGrade(grade);
        studentNumMapper.addStudentNum(grade.getId());
        return result;
    }

    @Override
    public Integer updateGrade(Grade grade) {
        return gradeMapper.updateGrade(grade);
    }

    @Override
    public List<Grade> findAll() {
        return gradeMapper.findAll();
    }


}
