package com.bdqn.service.hobby;

import com.bdqn.pojo.Hobby;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hp on 2017/12/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class HobbyServiceImplTest {
    @Resource
    private HobbyService hobbyService;
    @Test
    public void findAllByPage() throws Exception {
        PageInfo<Hobby> pageInfo = hobbyService.findAllByPage(1, 3);
        List<Hobby> hobbies = pageInfo.getList();
        for (Hobby hobby : hobbies) {
            System.out.println(hobby);
        }
    }

}