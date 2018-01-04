package com.bdqn.dao.hobby;

import com.bdqn.pojo.Hobby;

import java.util.List;

/**
 * Created by hp on 2017/12/27.
 */
public interface HobbyMapper {
    List<Hobby> findAll();
    Integer addHobby(Hobby hobby);

    Integer delHobbyByIDs(List<Integer> IDs);

    Integer delHobbyByID(Integer id);

    Hobby findHobbyByID(Integer id);

    Integer updateHobby(Hobby hobby);
}
