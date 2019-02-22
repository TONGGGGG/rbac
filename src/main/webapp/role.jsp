<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>





    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<%@include file="head.jsp" %>


<form action="/easearch/setpermission" >
    <div>
        <select class="selectpicker" name="rid">
            <option value="2">文件管理员</option>
            <option value="3">职工</option>
            <option value="4">经理</option>
            <option value="5">总监</option>
            <option value="6">审计</option>
            <option value="7">临时工</option>
        </select>
    </div>

    <div style="margin-top: 60px; text-align: center">
        <table border="2" style="height: 100px;width: 50%">
            <tr>
                <td>1.模块权限</td>
            </tr>
            <tr>
                <td><input type="radio" name="obid" value="001">文件资源管理</td>
                <td><input type="radio" name="obid">用户管理</td>
                <td><input type="radio" name="obid">设备管理</td>
            </tr>

            <tr>
                <td><input type="radio" name="obid" value="001">角色管理</td>
                <td></td>
                <td></td>
            </tr>

        </table>
    </div>

    <div style="margin-top: 60px; text-align: center">
        <table border="2" style="height: 100px;width: 50%">
            <tr>
                <td >操作</td>
            </tr>
            <tr>
                <td><input type="checkbox" name="operation" value="001">可见 </td>
                <td> <input type="checkbox" name="operation" value="002">修改 </td>
                <td><input type="checkbox" name="operation" value="003">删除 </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="operation" value="004">上传</td>
                <td><input type="checkbox" name="operation" value="005">下载</td>
                <td><input type="checkbox" name="operation" value="006">审批</td>
            </tr>
            <tr>
                <td><input type="checkbox" name="operation" value="007">搜索</td>
                <td><input type="checkbox" name="operation" value="008">操作8</td>
                <td><input type="checkbox" name="operation" value="009">操作9</td>
            </tr>
        </table>

    </div>
    <button  type='submit'  style="margin-left: 80px;margin-top: 50px" class="btn btn-default">确定 </button>

</form>





</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


<script type="text/javascript">
</script>

</html>
