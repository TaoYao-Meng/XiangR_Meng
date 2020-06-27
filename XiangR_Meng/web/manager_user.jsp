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
        body{
            background: #CBFFC8;
        }
        table{
            width: 400px;
        }
    </style>
</head>
<body>
<a href=manager_action!read_car> 查看全部商品 </a>
<a href=login.jsp>注销</a>
<form action="manager_action!find_user" method="post">查找:<input type="text" name="back" /><input type="submit"/> </form>
<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td valign="middle" align="center" width="20%">头像</td>
        <td valign="middle" align="center" width="20%">编号</td>
        <td valign="middle" align="center" width="20%">用户名</td>
        <td valign="middle" align="center" width="20%">地址</td>
    </tr>
    <s:iterator value="#session.manager_user_list" var="tr">
        <tr>
            <TD valign="middle" align="center" width="20%"><img src="sculpture/<s:property value="#tr.id"/>.jpg" width="80" height="80"/></TD>
            <td valign="middle" align="center" width="20%"><s:property value="#tr.id"/></td>
            <td valign="middle" align="center" width="20%"><s:property value="#tr.name"/></td>
            <td valign="middle" align="center" width="20%"><s:property value="#tr.address"/></td>
            <td valign="middle" align="center" width="20%"><a href="manager_action!delete_user?shan=<s:property value="#tr.id"/>"> 删除 </a></td>
        </tr>
    </s:iterator>
</table>

</body>
</html>
