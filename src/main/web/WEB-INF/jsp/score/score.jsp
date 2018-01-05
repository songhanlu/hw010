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
        <a id="searchButton" class="easyui-search" data-options="{iconCls:'icon-search'}">查询</a>
    </form>
    <div id="scoreDataGrid"></div>
<script type="text/javascript">
    $(function () {
        $("#scoreDataGrid").datagrid({
            url:"/score/findAllScore",
            paginagion:true,
            striped:true,
            pageSize:5,
            pageList:[5,7,9],
            method:false,

        });
    });
</script>
</body>
</html>
