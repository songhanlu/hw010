package com.bdqn.dao.score;

import com.bdqn.pojo.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by hp on 2018/1/5.
 */
public interface ScoreMapper {
    List<Score> findAllScore(@Param("studentID") Integer studentID,
                             @Param("gradeID") Integer gradeID);

    Integer deleteScoreByID(Integer id);
    Integer addScore(Score score);

    Integer deleteScoreByIDs(List<Integer> ids);
}
