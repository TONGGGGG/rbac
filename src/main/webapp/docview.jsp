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




<button class="btn" type="button" style="float: right ; margin-right: 20px" >上传</button>
<button class="btn" type="button" style="float: right; margin-right: 20px">删除</button>
<form class="form-search" style="float: left; margin-right: 20px">
    <input class="input-medium search-query" type="text" /> <button type="submit" class="btn">查找文件</button>
</form>
<table class="table" contenteditable="true">
    <thead>
    <tr>
        <th>编号</th>
        <th>文件名</th>
        <th>上传人员</th>
        <th>上传时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody >

    <c:forEach items="${list}" var="d" varStatus="i">
        <c:if test="${i.count%2==0 }">
            <tr class="info">
                <td>
                        ${d.docid }
                </td>
                <td>
                        ${d.docname}
                </td>
                <td>
                        ${d.upload_name}
                </td>
                <td>
                        ${d.upload_date}
                </td>

                <td>
                        ${d.docstate}
                </td>

                <td>

                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" onclick="show('${d.docid }')">
                            Action
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="${d.docid }">
                            <li><a href="#">Action</a></li>

                        </ul>
                    </div>





                </td>
            </tr>
        </c:if>

        <c:if test="${i.count%2==1 }">
            <tr class="warning">
                <td>
                        ${d.docid }
                </td>
                <td>
                        ${d.docname}
                </td>
                <td>
                        ${d.upload_name}
                </td>
                <td>
                        ${d.upload_date}
                </td>

                <td>
                        ${d.docstate}
                </td>

                <td>

                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" onclick="show('${d.docid }')">
                            Action
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="${d.docid }">
                            <li><a href="#">Action</a></li>

                        </ul>
                    </div>

                 </td>
            </tr>
        </c:if>


    </c:forEach>



    </tbody>

</table>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


<script type="text/javascript">

    function show(a )
    {
        var id="#"+a;
        $.get("${pageContext.request.contextPath }/showoperation","obid=001",function(d){
            $(id).empty();
            for (var i = 1; i < d.length; i++) {
                if(d[i].opdescription != "可见"&&d[i].opdescription != "上传"&&d[i].opdescription != "搜索"){
                    var s="<li><a href='${pageContext.request.contextPath}/equip.jsp?docid="+a+"'>"+d[i].opdescription+"</a></li>";
                    $(id).append(s);
                }
            }

        },"json");
        // window.open ('showoperation', 'newwindow', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no')
    }

</script>

</html>
