package com.bdqn.service.hobby;

import com.bdqn.dao.hobby.HobbyMapper;
import com.bdqn.pojo.Hobby;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2017/12/28.
 */
@Service
public class HobbyServiceImpl implements HobbyService {
    @Resource
    private HobbyMapper hobbyMapper;
    @Override
    public PageInfo<Hobby> findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Hobby> hobbies = hobbyMapper.findAll();
        return new PageInfo<>(hobbies);
    }
}
