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
        img{
            width: 100px;
            height: 100px;
        }
        table{
            width: 600px;
        }
        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td>头像</td>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>地址</td>
        <td>生日</td>
    </tr>
    <s:iterator value="#session.friend_list" var="tr">
        <tr>
            <td width="15%"><img src="sculpture/<s:property value="#tr.id"/>.jpg" width="80" height="80"></td>
            <td width="15%"><s:property value="#tr.id"/></td>
            <td width="15%"><a  href="own_action?shan=<s:property value="#tr.id"/>"><s:property value="#tr.name"/></a></td>
            <td width="15%"><s:property value="#tr.sex"/> </td>
            <td width="15%"><s:property value="#tr.address"/></td>
            <td width="15%"><s:property value="#tr.birthday"/></td>
            <td width="15%" ><a href="friend_show_action!delete?shan=<s:property value="#tr.id"/>&shan2=<s:property value="#tr.name"/>"> 删除 </a></td>
        </tr>
    </s:iterator>
</table>


</body>
</html>
