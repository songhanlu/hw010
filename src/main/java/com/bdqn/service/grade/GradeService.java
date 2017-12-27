package com.bdqn.service.grade;

import com.bdqn.pojo.Grade;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by hp on 2017/12/9.
 */
public interface GradeService {
    PageInfo<Grade> findGradeByPage(int pageNum, int pageSize);
    Grade findGradeByID(Integer gradeID);
    Integer delGradeByID(Integer id);
    Integer delGradeByIDs(List<Integer> ids);
    Integer addGrade(Grade grade);
    Integer updateGrade(Grade grade);
    List<Grade> findAll();

}
