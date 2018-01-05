<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/12/26
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
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
    <div id="scoreDataGrid"></div>
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
                {field:"score",title:"分数"},
                {field:"id",title:"操作",formatter:function (value, row, index) {
                    return "<button onclick='scoreDetial("+value+")'>详情</button>"+
                        "<button onclick='updateDetial("+value+")'>修改</button>"+
                        "<button onclick='deleteDetial("+value+")'>删除</button>";
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
                        });
                        $("#studentCombobox").combobox("select",-1);
                    });
                }
            });
            $("#gradeCombobox").combobox("select",-1);
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
</body>
</html>
