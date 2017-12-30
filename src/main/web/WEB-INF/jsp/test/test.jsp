<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/12/28
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../easyUI/common.jsp"/>
</head>
<body>
    <div id="main" style="width: 800px;height:360px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    myChart.setOption({
        title: {
            text: '异步数据加载示例'
        },
        tooltip: {},
        legend: {
            data:['价格']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '价格',
            type: 'bar',
            data: []
        }]
    });
    $(function () {
        $.get(
            "${pageContext.request.contextPath}/statics/jsonDemo/datagrid_data1.json",
            function (data) {
                var xArray = [];
                var yArray = [];
                var list = data.rows;
                $.each(list,function () {
                    xArray.push(this.productname);
                    yArray.push(this.listprice);
                })
                myChart.setOption({
                    xAxis: {
                        data: xArray
                    },
                    series: [{
                        name: '价格',
                        type: 'bar',
                        data: yArray
                    }]
                });
            }
        );
    })
</script>
</body>
</html>
