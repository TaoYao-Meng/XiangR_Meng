<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2019/12/22
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
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
    input #a{
        width:20%;
        padding:10px;
        background-color:#CBFFC8;
        border:1px solid black;
        border-radius:4px;
        cursor:pointer;

    }
</style>
<body>

<table class="gridtable" border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">
    <form action="own_action!chan?car_run.id=<%=request.getParameter("id")%>&shan=<%=request.getParameter("pic")%>"  method="post" enctype="multipart/form-data">
        <tr align="center">
            <td>名称：</td>

            <td colspan="2"><input type="text"  name="car_run.name" value=<%=request.getParameter("name")%> ><br>
            </td>
        </tr>
        <tr align="center">
            <td>价格：</td>

            <td colspan="2"><input type="text"  name="car_run.price" value=<%=request.getParameter("price")%> ><br>
            </td>
        </tr>

        <tr align="center">
            <td>库存：</td>

            <td colspan="2"><input type="text"  name="car_run.inventory" value=<%=request.getParameter("inventory")%> ><br>
            </td>
        </tr>
        <tr align="center">
            <td colspan="3">   <input type="file" name="upload"/></td>
        </tr>
        <tr align="center">
            <td colspan="3"> <input type="submit" value="保存" /></td>
        </tr>
        <tr align="center">
            <td colspan="2"><input id="a" type="button" value="返回" onclick="window.location='own_shop.jsp'" />
            </td>
        </tr>
    </form>
</table>

</body>
</html>
