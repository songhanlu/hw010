<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../easyUI/common.jsp"/>
</head>
<body>
    <form>
        所属年级：<input id="gradeCombobox"/>
        学生姓名：<input id="studentCombobox"/>
        <a id="searchButton" class="easyui-linkbutton" data-options="{iconCls:'icon-search'}">查询</a>
    </form>
    <div id="scoreDataGrid" style="width: 99%;height: 86%;"></div>
    <div id="addScoreWindow" class="easyui-window" style="width: 300px;height: 300px;padding: 20px;top: 10px;left: 10px;" data-options="{closed:true}" title="添加成绩">
        <form id="addScoreForm">
            请选择年级：<input id="addScore_grade"/>
            <br/>
            请选择学生：<input id="addScore_student" name="student.id"/>
            <br/>
            请选择课程：<input id="addScore_course" name="course.id"/>
            <br/>
            请输入成绩：<input name="score" type="number" class="easyui-textbox"/>
        </form>
        <button id="addScoreButton" class="easyui-linkbutton" data-options="{iconCls:'icon-save'}">保存</button>
    </div>
    <div id="detailScoreWindow" class="easyui-window" style="width: 300px;height: 300px;padding: 20px;top: 10px;left: 10px;" data-options="{closed:true}" title="添加成绩">
        <form id="detailScoreForm">
            请选择年级：<input id="detailScore_grade" class="easyui-textbox" readonly/>
            <br/>
            请选择学生：<input id="detailScore_student" class="easyui-textbox" readonly/>
            <br/>
            请选择课程：<input id="detailScore_course" class="easyui-textbox" readonly/>
            <br/>
            请输入成绩：<input id="detailScore_score" class="easyui-textbox" readonly/>
        </form>
    </div>

<script type="text/javascript">
    $(function () {
        $("#scoreDataGrid").datagrid({
            url:"/score/findAllScore",
            pagination:true,
            striped:true,
            pageSize:5,
            pageList:[5,7,9],
            method:"get",
            onLoadSuccess:function () {
                $("button").linkbutton();
                $(this).datagrid("fixRowHeight");
            },
            toolbar:[
                {
                    text:"新添成绩",
                    iconCls:"icon-add",
                    handler:function () {
                        $.get("/student/findAllGrade",function(grades){
                            var gfo = $.parseJSON('{"id":-1,"grade_name":"==请选择=="}');
                            grades.push(gfo);
                            $("#addScore_grade").combobox({
                                editable:false,
                                valueField:"id",
                                textField:"grade_name",
                                data:grades,
                                onLoadSuccess:function(){
                                    $(this).combobox("select",-1);
                                },
                                onSelect:function(grade){
                                    var gradeID = grade.id;
                                    $.get("/student/findStudentsByGradeID",{"gradeID":gradeID},function(students){
                                        var sfo = $.parseJSON('{"id":-1,"student_name":"==请选择=="}');
                                        students.push(sfo);
                                        $("#addScore_student").combobox({
                                            editable:false,
                                            valueField:"id",
                                            textField:"student_name",
                                            data:students,
                                            onLoadSuccess:function(){
                                                $(this).combobox("select",-1);
                                            },
                                        });
                                    });
                                }
                            });
                        });
                        $.get("/score/findAllCourse",function(courses){
                            var cfo = $.parseJSON('{"id":-1,"course_name":"==请选择=="}');
                            courses.push(cfo);
                            $("#addScore_course").combobox({
                                editable:false,
                                valueField:"id",
                                textField:"course_name",
                                data:courses,
                                onLoadSuccess:function(){
                                    $(this).combobox("select",-1);
                                },
                            });
                        });
                        $("#addScoreWindow").window("open");
                    }
                },
                {
                    text:"批量删除",
                    iconCls:"icon-remove",
                    handler:function () {

                    }
                },
            ],
            columns:[[
                {field:"",checkbox:true},
                {field:"student",title:"学生姓名",formatter:function (value,row,index) {
                    return value.student_name;
                }},
                {field:"grade",title:"所属年级",formatter:function (value,row,index) {
                    return row.student.grade.grade_name;
                }},
                {field:"course",title:"课程名称",width:150,formatter:function (value,row,index) {
                    return value.course_name;
                }},
                {field:"score",title:"分数"},
                {field:"id",title:"操作",formatter:function (value, row, index) {
                    return "<button onclick='detailScore("+value+")'>详情</button>"+
                        "<button onclick='updateScore("+value+")'>修改</button>"+
                        "<button onclick='deleteScore("+value+")'>删除</button>";
                }},
            ]],
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $.get("/student/findAllGrade",function (grades) {
            var gfo = $.parseJSON('{"id":-1,"grade_name":"==请选择=="}');
            grades.push(gfo);
            $("#gradeCombobox").combobox({
                valueField:"id",
                textField:"grade_name",
                data:grades,
                editable:false,
                onLoadSuccess:function () {
                    $("#gradeCombobox").combobox("select",-1);
                },
                onSelect:function (grade) {
                    var gradeID = grade.id;
                    $.get("/student/findStudentsByGradeID",{"gradeID":gradeID},function (students) {
                        var sfo = $.parseJSON('{"id":-1,"student_name":"==请选择=="}');
                        students.push(sfo);
                        $("#studentCombobox").combobox({
                            valueField:"id",
                            textField:"student_name",
                            data:students,
                            editable:false,
                            onLoadSuccess:function () {
                                $("#studentCombobox").combobox("select",-1);
                            }
                        });

                    });
                }
            });

        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#searchButton").click(function () {
            var gradeID = $("#gradeCombobox").val();
            var studentID = $("#studentCombobox").val();
            $("#scoreDataGrid").datagrid("load", {
                "gradeID":gradeID,
                "studentID":studentID
            });
        });
    });
</script>
<script type="text/javascript">
    function deleteScore(id) {

    }
</script>
<script type="text/javascript">
    $(function () {
        $("#addScoreButton").click(function () {
            var score = $("#addScoreForm").serialize();
            $.post("/score/addScore",score,function (result) {
                alert(result.msg);
                $("#scoreDataGrid").datagrid("reload");
                $("#addScoreWindow").window("close");
                $("#addScoreForm").form("clear");
            })
        });
    });
</script>
</body>
</html>
