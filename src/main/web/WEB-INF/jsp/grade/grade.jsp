<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/12/9
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="col-lg-8">
            <button type="button" id="delGrades" class="btn btn-danger">批量删除</button>
            <button type="button" id="addGrade" class="btn btn-info">添加年级</button>
            <table class="table table-striped">
                <tr>
                    <td>选择</td>
                    <td>id</td>
                    <td>年级名称</td>
                    <td>创建日期</td>
                    <td>描述</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="grade">
                <tr>
                    <td><input type="checkbox" gradeID="${grade.id}"/></td>
                    <td>${grade.id}</td>
                    <td>${grade.grade_name}</td>
                    <td><fmt:formatDate value="${grade.create_date}" pattern="yyyy-MM-dd"/> </td>
                    <td>${grade.details}</td>
                    <td>
                        <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal" name="showGradeDetails" gradeID="${grade.id}">详情</button>
                        <button type="button" class="btn btn-info btn-xs" name="updateGrade" gradeID="${grade.id}">修改</button>
                        <button type="button" class="btn btn-danger btn-xs" onclick="delGradeByID(${grade.id});">删除</button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <jsp:include page="../page.jsp"/>
    </div>
</div>

<%--批量删除--%>
<script type="text/javascript">
    $("#delGrades").click(function () {
        var GradeIDs = "";
        $.each($("input:checkbox"),function () {
            if(this.checked){
                GradeIDs = GradeIDs + $(this).attr("gradeID")+",";
            }
        })
        if(GradeIDs==""){
            alert("请选择");
            return;
        }
        $.post(
            "/grade/delGradeByIDs",
            {"gradeIDs":GradeIDs},
            function (result) {
                alert(result.msg);
                location.href = location.href;
            }
        )
    })
</script>

<%--显示详情--%>
<script type="text/javascript">
    $(function () {
        $("button[name=showGradeDetails]").click(function () {
            var gradeID = $(this).attr("gradeID");
            $.get(
                "/grade/findGradeByID",
                {"gradeID":gradeID},
                function (result) {
                    $("#showGradeName").html(result.grade_name);
                    $("#showCreateTime").html(result.create_date);
                    $("#showDetails").html(result.details);
                }
            );
        });
    });
</script>

<%--添加年级--%>
<script type="text/javascript">
    $(function () {
        $("#addGrade").click(function () {
            $("#addGradeModal").modal("show");
        });
        $("#addGradeButton").click(function () {
            var grade = $("#addGradeForm").serialize();
            $.post(
                "/grade/addGrade",
                grade,
                function (result) {
                    alert(result.msg);
                    location.href = location.href;
                }
            );
        });
    });
</script>
<%--修改年级--%>
<script type="text/javascript">
    $(function () {
        $("button[name=updateGrade]").click(function () {
            var gradeID = $(this).attr("gradeID");
            $.get(
                "/grade/findGradeByID",
                {"gradeID":gradeID},
                function (result) {
                    $("#updateGradeForm *[name=id]").val(result.id);
                    $("#updateGradeForm *[name=grade_name]").val(result.grade_name);
                    $("#updateGradeForm *[name=details]").val(result.details);
                    $("#updateGradeModal").modal("show");
                }
            );
        });
        $("#updateGradeButton").click(function () {
            var grade = $("#updateGradeForm").serialize();
            $.post(
                "/grade/updateGrade",
                grade,
                function (result) {
                    alert(result.msg);
                    location.href = location.href;
                }
            );
        });
    });
</script>
<%--模态框(修改年级)--%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateGradeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改年级</h4>
            </div>
            <div class="modal-body">
                <form id="updateGradeForm">
                    <div class="form-group">
                        <label for="exampleInputEmail2">年级名称</label>
                        <input type="text" readonly class="form-control" id="exampleInputEmail2" name="grade_name" placeholder="年级名称">
                        <input type="hidden" name="id"/>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword2">描述</label>
                        <textarea class="form-control" id="exampleInputPassword2" name="details" placeholder="描述"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateGradeButton">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%--模态框(显示详情)--%>
<%--模态框(添加年级)--%>
<div class="modal fade" tabindex="-1" role="dialog" id="addGradeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加年级</h4>
            </div>
            <div class="modal-body">
                <form id="addGradeForm">
                    <div class="form-group">
                        <label for="exampleInputEmail1">年级名称</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="grade_name" placeholder="年级名称">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">描述</label>
                        <textarea class="form-control" id="exampleInputPassword1" name="details" placeholder="描述"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="addGradeButton">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%--模态框(显示详情)--%>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tr>
                        <td width="30%">班级名称</td>
                        <td id="showGradeName"></td>
                    </tr>
                    <tr>
                        <td>创建时间</td>
                        <td id="showCreateTime"></td>
                    </tr>
                    <tr>
                        <td>详情</td>
                        <td id="showDetails"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
