
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../common.jsp"/>
</head>

<body>
    <div class="container">
        <jsp:include page="../top.jsp"/>
        <div class="row">
            <jsp:include page="../left.jsp"/>
            <div class="col-lg-9">
                <button type="button" id="delStudents" class="btn btn-danger">批量删除</button>
                <button type="button" id="addStudent" class="btn btn-info glyphicon glyphicon-plus">添加学员</button>
                <table class="table table-striped">
                    <tr>
                        <td>选择</td>
                        <td>学员ID</td>
                        <td>姓名</td>
                        <td>所在年级</td>
                        <td>学员编号</td>
                        <td>性别</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="student">
                        <tr>
                            <td><input type="checkbox" studentID="${student.id}"/></td>
                            <td>${student.id}</td>
                            <td>${student.student_name}</td>
                            <td>${student.grade.grade_name}</td>
                            <td>${student.student_num}</td>
                            <td>${student.gender}</td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs" name="detailStudent" studentID="${student.id}">详情</button>
                                <button type="button" class="btn btn-info btn-xs" name="updateStudent" studentID="${student.id}">修改</button>
                                <button type="button" class="btn btn-danger btn-xs">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <jsp:include page="../pageStu.jsp"/>
        </div>
    </div>
    <%--批量删除--%>
    <script type="text/javascript">
        $(function () {
            $("#delStudents").click(function () {
                var ids = "";
                $.each($("input:checkbox"),function () {
                    if(this.checked){
                        ids = ids + $(this).attr("studentID")+",";
                    }
                });
                if(ids==""){
                    alert("请选择");
                    return;
                }
                $.get(
                    "/student/delStudent",
                    {"IDs":ids},
                    function (result) {
                        alert(result.msg);
                        location.href = location.href;
                    }
                );
            });

        });
    </script>
    <%--添加学生--%>
    <script type="text/javascript">
        $(function () {
            $("#addStudent").click(function () {
                gradeList($("#addStudentGradeIDSelect"), null);
                $("#addStudentModal").modal("show");
            });
            $("#addStudentButton").click(function () {
                var grade_name = $("#addStudentGradeIDSelect").find("option:selected").text();
                $("#addStudentGradeName").val(grade_name);
                var student = $("#addStudentForm").serialize();
                $.post(
                    "/student/addStudent",
                    student,
                    function (result) {
                        alert(result.msg);
                        location.href = location.href;
                    }
                );
            });
        });
    </script>
    <%--修改学生--%>
    <script type="text/javascript">
        $(function () {
            $("button[name=updateStudent]").click(function () {
                var id = $(this).attr("studentID");
                $.get(
                    "/student/findStudentByID",
                    {"id":id},
                    function (student) {
                        $("#updateStudentForm *[name=id]").val(student.id);
                        $("#updateStudentForm *[name=student_name]").val(student.student_name);
                        $("#updateStudentForm *[name=gender]").val(student.gender);
                        $("#updateStudentForm *[name=age]").val(student.age);
                        $("#updateStudentForm *[name=student_num]").val(student.student_num);
                        gradeList($("#updateStudentGradeIDSelect"), student.grade.id);
                        $("#updateStudentModal").modal("show");
                    }
                );
            });
            $("#updateStudentButton").click(function () {
                var student = $("#updateStudentForm").serialize();
                $.post(
                    "/student/updateStudent",
                    student,
                    function (result) {
                        alert(result.msg);
                        location.href = location.href;
                    }
                );
            });
        });
    </script>
    <%--学生详情--%>
    <script type="text/javascript">
        $(function () {
            $("button[name=detailStudent]").click(function () {
                var id = $(this).attr("studentID");
                $.get(
                    "/student/findStudentByID",
                    {"id":id},
                    function (student) {
                        $("#detailStudentName").html(student.student_name);
                        $("#detailStudentNum").html(student.student_num);
                        $("#detailStudentGradeName").html(student.grade.grade_name);
                        $("#detailStudentGender").html(student.gender);
                        $("#detailStudentModal").modal("show");
                    }
                );
            });
        });
    </script>
    <%--年级列表通用方法--%>
    <script type="text/javascript">
        function gradeList(ele,gradeID) {
            ele.empty();
            $.get(
                "/student/findAllGrade",
                function (grades) {
                    $.each(grades,function () {
                        ele.append("<option value='"+this.id+"'>"+this.grade_name+"</option>");
                    })
                }
            );
            if(null!=gradeID){
                ele.val(gradeID);
            }
        }
    </script>
    <%--修改学生模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="updateStudentModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改学生</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="updateStudentForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学生姓名：</label>
                            <div class="col-sm-9">
                                <input type="text" name="student_name" class="form-control" placeholder="学生姓名">
                                <input type="hidden" name="id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学生编号：</label>
                            <div class="col-sm-9">
                                <input type="text" name="student_num" class="form-control" placeholder="学生编号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">年龄：</label>
                            <div class="col-sm-9">
                                <input type="number" name="age" class="form-control" min="18" value="18">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="gender">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">所在班级：</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="grade.id" id="updateStudentGradeIDSelect"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateStudentButton">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--学生详情模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="detailStudentModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">学生详情</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-3">学生姓名：</div>
                        <div class="col-lg-9" id="detailStudentName"></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">学号：</div>
                        <div class="col-lg-9" id="detailStudentNum"></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">性别：</div>
                        <div class="col-lg-9" id="detailStudentGender"></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">所在班级：</div>
                        <div class="col-lg-9" id="detailStudentGradeName"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--添加学生模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="addStudentModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加学生</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addStudentForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学生姓名：</label>
                            <div class="col-sm-9">
                                <input type="text" name="student_name" class="form-control" placeholder="学生姓名">
                                <input type="hidden" name="grade.grade_name" id="addStudentGradeName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">年龄：</label>
                            <div class="col-sm-9">
                                <input type="number" name="age" class="form-control" min="18" value="18">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="gender">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">所在班级：</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="grade.id" id="addStudentGradeIDSelect"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addStudentButton">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</body>
</html>

