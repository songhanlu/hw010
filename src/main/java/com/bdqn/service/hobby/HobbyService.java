package com.bdqn.service.hobby;

import com.bdqn.pojo.Hobby;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by hp on 2017/12/27.
 */
public interface HobbyService {
    PageInfo<Hobby> findAllByPage(Integer pageNum, Integer pageSizse);
    Integer addHobby(Hobby hobby);
    Integer delHobbyByIDs(List<Integer> IDs);

    Integer delHobbyByID(Integer id);

    Hobby findHobbyByID(Integer id);

    Integer updateHobby(Hobby hobby);
}
