<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2019/12/10
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="own_action!add"  method="post" enctype="multipart/form-data">
    名称：<input type="text"  name="car_run.name" /><br>
    价格：<input type="text"  name="car_run.price"  /><br>
    库存：<input type="text"  name="car_run.inventory" ><br>
    <input type="file" name="upload">
    <input type="submit" value="上传" />
    <input type="button" value="返回" onclick="window.location='own_shop.jsp'" />
</form>
</body>
</html>
