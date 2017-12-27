<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="page-header">
        <h1>欢迎你，${sessionScope.current_user.nick_name}
            <br/>
            <br/>
            <small>学生管理系统，<a href="/user/logout">退出</a></small></h1>
    </div>
</div>