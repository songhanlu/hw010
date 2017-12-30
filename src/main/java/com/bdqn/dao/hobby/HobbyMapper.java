package com.bdqn.dao.hobby;

import com.bdqn.pojo.Hobby;

import java.util.List;

/**
 * Created by hp on 2017/12/27.
 */
public interface HobbyMapper {
    List<Hobby> findAll();

    Integer add(Hobby hobby);
}
