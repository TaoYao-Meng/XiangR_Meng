<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2019/12/20
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            width: 400px;
        }
        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td>编号</td>
        <td>名称</td>
        <td>地址</td>
    </tr>
    <s:iterator value="#session.user_list" var="tr">
        <tr>
            <td><s:property value="#tr.id"/></td>
            <td><a href="detail_action.action?shan=<s:property value="#tr.id"/>"><s:property value="#tr.username"/></a></td>
            <td><s:property value="#tr.address"/></td>
            <td><a href="friend_action!add_friend?shan=<s:property value="#tr.id"/>&shan2=<s:property value="#tr.username"/>"> 添加至好友 </a></td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
