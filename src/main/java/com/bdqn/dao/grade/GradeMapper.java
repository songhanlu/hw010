package com.bdqn.dao.grade;

import com.bdqn.pojo.Grade;

import java.util.List;

/**
 * Created by hp on 2017/12/9.
 */
public interface GradeMapper {
    List<Grade> findAll();
    Grade findGradeByID(Integer gradeID);
    Integer delGradeByID(Integer id);
    Integer delGradeByIDs(List<Integer> ids);
    Integer addGrade(Grade grade);
    Integer updateGrade(Grade grade);
}
