package com.bdqn.dao.studentNum;

/**
 * Created by hp on 2017/12/16.
 */
public interface StudentNumMapper {
    Integer addStudentNum(Integer gradeID);

    Integer findMaxNum(Integer gradeID);

    Integer updateMaxNum(Integer gradeID);
}
