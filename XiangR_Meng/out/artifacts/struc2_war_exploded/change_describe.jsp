<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2019/12/10
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="detail_action!add_describe?shan=<%=request.getParameter("id")%>"  method="post" >
    描述：<input type="text" name="back" value="<%=request.getParameter("de")%>">
    <input type="submit" value="上传" />
    <input type="button" value="返回" onclick="window.location='own_shop.jsp'" />
</form>
</body>
</html>
