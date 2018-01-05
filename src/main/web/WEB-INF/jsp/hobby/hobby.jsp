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
                onLoadSuccess:function () {
                    $("button").linkbutton();
                    $('#hobbyDatagrid').datagrid('fixRowHeight');
                },
                toolbar:[
                    {
                        text:"添加新爱好",
                        iconCls:"icon-add",
                        handler:function () {
                            $("#addHobbyWindow").window("open");

                        }
                    },
                    {
                        text:"批量删除",
                        iconCls:"icon-remove",
                        handler:function () {
                            var idCheck = $("#hobbyDatagrid").datagrid("getChecked");
                            var IDs = "";
                            if(idCheck==null || idCheck.length==0){
                                alert("请先选择！！！");
                                return;
                            }
                            $.each(idCheck,function (index, item) {
                                IDs = IDs + item.id + ",";
                            });
                            $.post("/hobby/delHobbyByIDs",{"IDs":IDs},function (result) {
                                alert(result.msg);
                                $("#hobbyDatagrid").datagrid("reload");
                            })
                        }
                    },
                ],
                columns:[[
                    {field:"",checkbox:true},
                    {field:"hobby_name",title:"爱好名称",width:100},
                    {field:"create_time",title:"创建时间",width:150,formatter:function (value,row,index) {
                        var date = new Date(value);
                        var yyyy = date.getFullYear();
                        var MM = date.getMonth()+1;
                        var dd = date.getDay();
                        var HH = date.getHours();
                        var mm = date.getMinutes();
                        var ss = date.getSeconds();
                        return yyyy+"年"+MM+"月"+dd+"日 "+HH+":"+mm+":"+ss;

                    }},
                    {field:"id",title:"操作",width:250,formatter:function (value,row,index) {
                        return "<button onclick='hobbyDetail("+value+")'>详情</button>  " +
                            "<button onclick='hobbyUpdate("+value+")'>修改</button>  " +
                            "<button onclick='hobbyDelete("+value+")'>删除</button>";
                    }},
                ]]
            });
        });


    </script>
</head>
<body>
    <table id="hobbyDatagrid"></table>
    <%--<button class="easyui-linkbutton">aa</button>--%>
    <div id="addHobbyWindow" title="添加新爱好" class="easyui-window" style="width: 500px;height: 300px;padding-left: 30px;" closed="true">
        <form id="addHobbyForm">
            <label>爱好名称：</label>
            <input type="text" class="easyui-textbox" name="hobby_name"/>
        </form>
        <button id="addHobbyButton" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</button>
    </div>
    <%--爱好详情--%>
    <div id="detailHobbyWindow" title="爱好详情" class="easyui-window" style="width: 500px;height: 300px;padding-left: 30px;" closed="true">
        <form id="detailHobbyForm">
            <label>爱好名称：</label>
            <input type="text" class="easyui-textbox" name="hobby_name" readonly/>
            <br/>
            <label>创建时间：</label>
            <input type="text" class="easyui-textbox" name="create_time" readonly/>
        </form>
    </div>
    <%--修改爱好--%>
    <div id="updateHobbyWindow" title="修改爱好" class="easyui-window" style="width: 500px;height: 300px;padding-left: 30px;" closed="true">
        <form id="updateHobbyForm">
            <label>爱好名称：</label>
            <input type="text" class="easyui-textbox" name="hobby_name"/>
            <input type="hidden" name="id"/>
        </form>
        <button id="updateHobbyButton" class="easyui-linkbutton" data-options="{iconCls:'icon-save'}">保存</button>
    </div>

<script type="text/javascript">
    $(function () {
        $("#updateHobbyButton").click(function () {
            var hobby = $("#updateHobbyForm").serialize();
            $.post("/hobby/updateHobby",hobby,function (result) {
                alert(result.msg);
                $("#hobbyDatagrid").datagrid("reload");
                $("#updateHobbyWindow").window("close");
            })
        });
    });
    function hobbyDetail(id) {
        $.get("/hobby/findHobbyByID",{"id":id},function (hobby) {
            var date = new Date(hobby.create_time);
            var yyyy = date.getFullYear();
            var MM = date.getMonth()+1;
            var dd = date.getDay();
            var HH = date.getHours();
            var mm = date.getMinutes();
            var ss = date.getSeconds();
            hobby.create_time = yyyy+"年"+MM+"月"+dd+"日 "+HH+":"+mm+":"+ss;
            $("#detailHobbyForm").form("load", hobby);
        });
        $("#detailHobbyWindow").window("open");
    }
    function hobbyUpdate(id) {
        $.get("/hobby/findHobbyByID",{"id":id},function (hobby) {
            $("#updateHobbyForm").form("load", hobby);
        });
        $("#updateHobbyWindow").window("open");
    }
    function hobbyDelete(id) {
        if(confirm("确定删除吗？")){
            $.post("/hobby/delHobbyByID",{"id":id},function (result) {
                alert(result.msg);
                $("#hobbyDatagrid").datagrid("reload");
            })
        }
    }
</script>
<script type="text/javascript">
    $(function () {
        $("#addHobbyButton").click(function () {
            var hobby = $("#addHobbyForm").serialize();
            $.post("/hobby/add",hobby,function (result) {
                alert(result.msg);
                $("#hobbyDatagrid").datagrid("reload");
                $("#addHobbyWindow").window("close");
                $("#addHobbyForm").form("clear");
            })
        });
    });
</script>
</body>
</html>
