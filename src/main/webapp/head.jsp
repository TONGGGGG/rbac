<%--
  Created by IntelliJ IDEA.
  User: 徐浩曈
  Date: 2018/12/29
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath }/home.jsp"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="#">Home <span class="sr-only">(current)</span></a></li>
                <li ><a href="#">Set</a></li>
                <c:if test="${not empty user }">
                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath }/show" >文件资源管理 <span class="caret"></span></a>

                    </li>
                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath }/role.jsp" >角色管理 <span class="caret"></span></a>

                    </li>

                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath }/role.jsp" >用户管理 <span class="caret"></span></a>

                    </li>

                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath }/role.jsp" >设备管理 <span class="caret"></span></a>

                    </li>

                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty user }">
                    <li><a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>
                    <li><a href="${pageContext.request.contextPath }/login.jsp">注册</a></li>
                </c:if>
                <c:if test="${not empty user }">
                    <li><a href="${pageContext.request.contextPath }/user?method=logout">${user.uid }:您好</a></li>
                    <li><a href="${pageContext.request.contextPath }/user?method=logout">退出</a></li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>

</html>
