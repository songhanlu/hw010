package com.bdqn.service.score;

import com.bdqn.dao.score.ScoreMapper;
import com.bdqn.pojo.Score;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
}
