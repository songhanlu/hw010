package com.bdqn.service.score;

import com.bdqn.pojo.Course;
import com.bdqn.pojo.Score;
import com.bdqn.pojo.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by hp on 2018/1/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ScoreServiceImplTest {
    @Resource
    private ScoreService scoreService;
    @Test
    public void addScore() throws Exception {
        Score score = new Score();
        Student student = new Student();
        Course course = new Course();
        student.setId(1);
        course.setId(2);
        score.setCourse(course);
        score.setStudent(student);
        score.setScore(98);
        int result = scoreService.addScore(score);
        System.out.println(result);
    }

}