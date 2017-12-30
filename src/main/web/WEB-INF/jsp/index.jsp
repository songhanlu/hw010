<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/12/26
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="easyUI/common.jsp"/>
</head>
<body>
    <div class="easyui-window" style="width: 400px;height:300px;top: 100px;">
        <form action="/user/login" method="post">
            <table align="center" width="300px">
                <tr>
                    <td>用户名：</td>
                    <td>
                        <input type="text" class="easyui-textbox" name="user_name"/>
                    </td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td>
                        <input type="text" class="easyui-passwordbox" name="password"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="easyui-linkbutton" value="登录" style="width: 120px;"/>
                        <input type="reset" class="easyui-linkbutton" value="重置" style="width: 120px;"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
