<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-6 col-lg-offset-2">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:choose>
                <c:when test="${pageInfo.isFirstPage}">
                    <li class="disabled"><span>首页</span></li>
                    <li class="disabled">
                        <span aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </span>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="#" num="1">首页</a></li>
                    <li>
                        <a href="#" num="${pageInfo.prePage}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <li <c:if test="${pageInfo.pageNum eq num}">class="active"</c:if>><a href="#" num="${num}">${num}</a></li>
            </c:forEach>


            <c:choose>
                <c:when test="${pageInfo.isLastPage}">
                    <li class="disabled">
                        <span aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </span>
                    </li>
                    <li class="disabled"><span>末页</span></li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="#" aria-label="Next" num="${pageInfo.nextPage}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="#" num="${pageInfo.pages}">末页</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>
<script type="text/javascript">
    $("li a").click(function () {
        var pageNum = $(this).attr("num");
        location.href = "/student/toStudent?pageNum="+pageNum+"&pageSize=${pageInfo.pageSize}";

    });
</script>