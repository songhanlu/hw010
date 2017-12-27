<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/12/27
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../easyUI/common.jsp"/>
    <script>
        $(function () {
            $("#jsonDemo").datagrid({
                url:"${pageContext.request.contextPath}/statics/jsonDemo/datagrid_data1.json",
                method:"get",
                pagination:true,
                rownumbers:true,
                striped:true,
                columns:[[
                    {field:"productid",title:"商品编号",width:100},
                    {field:"productname",title:"商品名称",width:100}
                ]]
            });
        });
    </script>
</head>
<body>
    <%--<table id="jsonDemo" style="width: 100%;height: 100%;">

    </table>--%>
    <div id="jsonDemo"></div>

</body>
</html>
