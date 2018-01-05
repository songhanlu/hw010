package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.pojo.Student;
import com.bdqn.service.grade.GradeService;
import com.bdqn.service.student.StudentService;
import com.bdqn.tools.Comm;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hp on 2017/12/9.
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService studentService;
    @Resource
    private GradeService gradeService;


    @RequestMapping("/toStudent")
    public String toStudent(Integer pageNum, Integer pageSize, Model model){
        PageInfo<Student> pageInfo = studentService.findStudentByPage(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "student/student";
    }

    @RequestMapping(value = "/delStudent",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String delStudent(String IDs){
        String[] stuIDs = IDs.split(",");
        List<Integer> studentIDs = new ArrayList<>();
        for (String stuID : stuIDs) {
            studentIDs.add(Integer.parseInt(stuID));
        }
        int result = studentService.deleteStudentByIDs(studentIDs);
        if (result > 0) {
            return JSON.toJSONString(Comm.success());
        }
        return JSON.toJSONString(Comm.failed());
    }

    @RequestMapping(value = "/findAllGrade", method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findAllGrade(){
        return JSON.toJSONString(gradeService.findAll());
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addStudent(Student student){
        int result = studentService.addStudent(student);
        if(result>0){
            return JSON.toJSONString(Comm.success());
        }
        return JSON.toJSONString(Comm.failed());
    }

    @RequestMapping(value = "/findStudentByID", method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findStudentByID(Integer id){
        return JSON.toJSONString(studentService.findStudentByID(id));
    }

    @RequestMapping(value = "/updateStudent", method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateStudent(Student student) {
        int result = studentService.updateStudent(student);
        if(result>0){
            return JSON.toJSONString(Comm.success());
        }
        return JSON.toJSONString(Comm.failed());
    }

    @RequestMapping(value = "/findStudentsByGradeID", method = RequestMethod.GET,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findStudentsByGradeID(Integer gradeID){
        List<Student> students =studentService.findStudentsByGradeID(gradeID);
        return JSON.toJSONString(students);
    }

}
