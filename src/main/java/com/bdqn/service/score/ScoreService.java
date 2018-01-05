package com.bdqn.service.score;

import com.bdqn.pojo.Score;
import com.github.pagehelper.PageInfo;

/**
 * Created by hp on 2018/1/5.
 */
public interface ScoreService {
    PageInfo<Score> findAllScore(Integer pageNum,
                                 Integer pageSize,
                                 Integer studentID,
                                 Integer gradeID);
}
