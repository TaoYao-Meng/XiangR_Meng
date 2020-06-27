<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/21
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        <%

          String path = request.getContextPath();
          String basePath = request.getScheme() + "://"
                  + request.getServerName() + ":" + request.getServerPort()
                  + path + "/";
      %>

        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<table class="gridtable" border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">
    <caption>个人信息</caption>
    <form action="login!change" method="post">
    <tr align="center">
        <td>用户名</td>
        <td colspan="2"><input type="text" name="userin.username" value="<s:property value="#session.username"/>" ></td>
    </tr>
    <tr align="center">
        <td>性别</td>
        <td colspan="2"><input type="text" name="userin.sex" value="<s:property value="#session.sex"/>" ></td>
    </tr>
    <tr align="center">
        <td>生日</td>
        <td colspan="2"><input type="text" name="userin.birthday" value="<s:property value="#session.birthday"/>" ></td>
    </tr>
    <tr align="center">
        <td>地址</td>
        <td colspan="2"><input type="text" name="userin.address" value="<s:property value="#session.address"/>" ></td>
    </tr>
    <tr align="center">
        <td colspan="3">

            <button type="submit">修改</button>

        </td>
    </tr>
    </form>
</table>
</body>
</html>
