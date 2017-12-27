package com.bdqn.service.hobby;

import com.bdqn.dao.hobby.HobbyMapper;
import com.bdqn.pojo.Hobby;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2017/12/27.
 */
@Service
public class HobbyServiceImpl implements HobbyService {
    @Resource
    private HobbyMapper hobbyMapper;
    @Override
    public PageInfo<Hobby> findAllByPage(Integer pageNum, Integer pageSizse) {
        PageHelper.startPage(pageNum,pageSizse);
        List<Hobby> hobbies = hobbyMapper.findAll();
        PageInfo<Hobby> pageInfo = new PageInfo<>(hobbies);
        return pageInfo;
    }
}
