<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/12/26
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="common.jsp"/>
</head>
<body>
    <div class="easyui-layout" style="width: 100%;height: 100%;">
        <div region="north" style="height: 20%;">北</div>
        <div region="south" style="height: 20%;">南</div>
        <div region="west" style="width: 20%;" title="菜单栏">
            <ul>
                <li><a href="#" url="/hobby/toHobby">爱好管理</a></li>
                <li><a href="#" url="/score/toScore">成绩管理</a></li>
                <li><a href="#" url="/jsondemo/toJsondemo">jsonDemo</a></li>
                <li><a href="#" url="/test/toTest">自己的测试</a></li>
                <li><a href="#" url="/test/toDate">日期控件的测试</a></li>
            </ul>
        </div>
        <div region="center">
            <div id="tabs" class="easyui-tabs" style="width: 100%;height: 100%;">
                <div title="欢迎">
                    欢迎
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
    $(function () {
        $("li>a").click(function () {
            var title = $(this).text();
            var url = $(this).attr("url");
            var content = "<iframe frameborder='0' src='"+url+"' style='width: 100%;height: 100%;'></iframe>";
            if($("#tabs").tabs("exists",title)){
                $("#tabs").tabs("select",title);
            }else{
                $("#tabs").tabs("add",{
                    title:title,
                    content:content,
                    closable:true,
                    selected:true
                });
            }
        });
    });
</script>
</body>
</html>
