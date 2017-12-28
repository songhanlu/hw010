package com.bdqn.service.hobby;

import com.bdqn.pojo.Hobby;
import com.github.pagehelper.PageInfo;

/**
 * Created by hp on 2017/12/28.
 */
public interface HobbyService {
    PageInfo<Hobby> findAll(Integer pageNum, Integer pageSize);
}
