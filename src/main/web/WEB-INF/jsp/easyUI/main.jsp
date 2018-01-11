
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="common.jsp"/>
    <script type="text/javascript">
        $(function () {
            $.get("/role/menu",{"roleID":${sessionScope.role.id},"parentID":-1},function (m1s) {
                $("#tree").tree({
                    data:m1s,
                    onSelect:function (m1) {
                        if(null!=m1.children){
                            return;
                        }
                        var id = m1.id;
                        var url = m1.menu_url;
                        var title = m1.text;
                        if(url!=''){
                            url = "${pageContext.request.contextPath}"+url;
                            addTab(url, title);
                        }
                        $.get("/role/menu",{"roleID":${sessionScope.role.id},"parentID":id},function (m2s) {
                            $("#tree").tree("append", {
                                parent:m1.target,
                                data:m2s,
                            });
                        });
                    }
                });
            });
        });
        function addTab(url,title) {
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
        }
    </script>
</head>
<body>
    <div class="easyui-layout" style="width: 100%;height: 100%;">
        <div region="north" style="height: 20%;">
            昵称：${sessionScope.current_user.nick_name},
            <br/>
            身份：${sessionScope.role.role_name}
        </div>
        <div region="south" style="height: 20%;">南</div>
        <div region="west" style="width: 20%;" title="菜单栏">
            <div id="tree"></div>
            <%--<ul>
                <li><a href="#" url="/hobby/toHobby">爱好管理</a></li>
                <li><a href="#" url="/score/toScore">成绩管理</a></li>
                <li><a href="#" url="/jsondemo/toJsondemo">jsonDemo</a></li>
                <li><a href="#" url="/test/toTest">自己的测试</a></li>
                <li><a href="#" url="/test/toDate">日期控件的测试</a></li>
            </ul>--%>
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
