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
    </style>
</head>
<body>

<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>

        <td>编号</td>
        <td>请求方编号</td>
        <td>请求方姓名</td>
    </tr>
    <s:iterator value="#session.apply_list" var="tr">
        <tr>
            <td><s:property value="#tr.id"/></td>
            <td><a href="detail_action.action?shan=<s:property value="#tr.receive_id"/>"><s:property value="#tr.send_id"/></a></td>
            <td><s:property value="#tr.send_name"/></td>
            <td><a href="apply_action!add_friend?shan=<s:property value="#tr.id"/>&shan2=<s:property value="#tr.send_id"/>&back=1">同意</a></td>
            <td><a href="apply_action!refuse_friend?shan=<s:property value="#tr.id"/>&shan2=<s:property value="#tr.send_id"/>&back=0">拒绝</a></td>
        </tr>
    </s:iterator>
</table>


</body>
</html>
