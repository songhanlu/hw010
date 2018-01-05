<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../easyUI/common.jsp"/>
</head>
<body>
开始时间：
<input class="easyui-datetimebox" name="birthday"
       data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px"/>
<br/><br/>
结束时间：
<input class="easyui-datetimebox" name="birthday"
       data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px"/>
<br/><br/>
<div id="cc" style="width:180px;height:180px;"></div>
<script type="text/javascript">
    $('#cc').calendar({
        current:new Date()
    });
</script>
</body>
</html>
