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
    <div id="hobbyDatagrid"></div>
<script type="text/javascript">
    $(function () {
        $("#hobbyDatagrid").datagrid({
            url:"${pageContext.request.contextPath}/hobby/findAllByPage",
            method:"get",
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,8,12],
            striped:true,
            columns:[[
                {field:"hobby_name",title:"爱好名称",width:100},
                {field:"create_time",title:"创建时间",width:100},
            ]]
        });
    });
</script>
</body>
</html>
