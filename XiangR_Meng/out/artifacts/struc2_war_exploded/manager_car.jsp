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
            width: 800px;
        }

    </style>
</head>
<body>
<a href=manager_action!read_user> 查看全部用户 </a>
<a href=login.jsp>注销</a>
<br>
<form action="manager_action!find_car" method="post">查找:<input type="text" name="back" /><input type="submit"/> </form>
<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td width="10%" valign="middle" align="center">图片</td>
        <td width="10%" valign="middle" align="center">编号</td>
        <td width="10%" valign="middle" align="center">名称</td>
        <td width="10%" valign="middle" align="center">价格</td>
        <td width="10%" valign="middle" align="center">商家</td>
        <td width="10%" valign="middle" align="center">库存</td>
        <td width="10%" valign="middle" align="center">信用</td>
    </tr>
    <s:iterator value="#session.manager_car_list" var="tr">
        <tr>
            <td width="10%" valign="middle" align="center"><img src="car_pic/<s:property value="#tr.pic"/>" width="80" height="80"></td>
            <td width="10%" valign="middle" align="center"><s:property value="#tr.id"/></td>
            <td width="10%" valign="middle" align="center"><s:property value="#tr.name"/></td>
            <td width="10%" valign="middle" align="center"><s:property value="#tr.price"/> </td>
            <td width="10%" valign="middle" align="center"><s:property value="#tr.shop"/></td>
            <td width="10%" valign="middle" align="center"><s:property value="#tr.inventory"/></td>
            <td width="10%" valign="middle" align="center"><s:property value="#tr.credit"/></td>
            <td width="10%" valign="middle" align="center">
                <a href="manager_action!delete_car?shan=<s:property value="#tr.id"/> " > 删除 </a>
            </td>
        </tr>
    </s:iterator>
</table>

</body>
</html>
