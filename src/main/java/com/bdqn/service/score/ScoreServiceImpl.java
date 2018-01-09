package com.bdqn.service.score;

import com.bdqn.dao.score.ScoreMapper;
import com.bdqn.pojo.Score;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hp on 2018/1/5.
 */
@Service
public class ScoreServiceImpl implements ScoreService {
    @Resource
    private ScoreMapper scoreMapper;
    @Override
    public PageInfo<Score> findAllScore(Integer pageNum, Integer pageSize, Integer studentID, Integer gradeID) {
        PageHelper.startPage(pageNum, pageSize);
        List<Score> scores = scoreMapper.findAllScore(studentID, gradeID);
        return new PageInfo<>(scores);
    }

    @Override
    public Integer deleteScoreByID(Integer id) {
        return scoreMapper.deleteScoreByID(id);
    }

    @Override
    public Integer addScore(Score score) {
        return scoreMapper.addScore(score);
    }

    @Override
    public Integer deleteScoreByIDs(String ids) {
        List<Integer> iii = new ArrayList<>();
        for (String s : ids.split(",")) {
            iii.add(Integer.parseInt(s));
        }
        return scoreMapper.deleteScoreByIDs(iii);
    }

    @Override
    public Score findScoreByID(Integer id) {
        return scoreMapper.findScoreByID(id);

    }

    @Override
    public Integer updateScore(Score score) {
        return scoreMapper.updateScore(score);
    }


}
