package com.bdqn.service.grade;

import com.bdqn.pojo.Grade;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by hp on 2017/12/16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class GradeServiceImplTest {
    @Resource
    private GradeService gradeService;

    @Test
    public void addGrade() throws Exception {
        Grade grade = new Grade();
        grade.setDetails("肯定是来访记录可");
        grade.setGrade_name("ACCID0002");
        System.out.println(gradeService.addGrade(grade));
    }

}