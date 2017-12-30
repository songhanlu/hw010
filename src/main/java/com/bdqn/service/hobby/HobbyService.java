package com.bdqn.service.hobby;

import com.bdqn.pojo.Hobby;
import com.github.pagehelper.PageInfo;

/**
 * Created by hp on 2017/12/27.
 */
public interface HobbyService {
    PageInfo<Hobby> findAllByPage(Integer pageNum, Integer pageSizse);

    Integer add(Hobby hobby);
}
