<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2019/12/20
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            height: 400px;
            width: 400px;
        }
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
<div>
    <div style="float: left">
        <table class="gridtable" border="1" bgcolor="#ffffff"  cellspacing="1" cellpadding="1" width="400px" >
            <tr align="center">
                <td >图片</td>
                <td ><img src="car_pic/<s:property value="#session.info.pic"/>" width="80" height="80"></td>
            </tr>
            <br>
            <tr align="center">
                <td>编号</td>
                <td ><s:property value="#session.info.id"/></td>
            </tr>

            <tr align="center">
                <td>名称</td>
                <td ><s:property value="#session.info.name"/></td>
            </tr>

            <tr align="center">
                <td>价格</td>
                <td ><s:property value="#session.info.price"/> </td>
            </tr>

            <tr align="center">
                <td>商家</td>
                <td ><a href="own_action.action?shan=<s:property value="#session.info.shop"/>"><s:property value="#session.info.shop"/></a></td>
            </tr>
        </table>
        <A><s:property value="#session.info.describe"/></A>
        <br>
        <input type="button" onclick="window.location='change_describe.jsp?id=<s:property value="#session.info.id"/>&de=<s:property value="#session.info.describe"/>'" value="修改相关信息"/>
        <input type="button" onclick="window.location='add_car_photo.jsp?id=<s:property value="#session.info.id"/>'" value="添加"/>

    </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div  style="float: left;">
        <table class="gridtable" border="1" bgcolor="#ffffff"  cellspacing="1" cellpadding="1" width="400px" style=" position: relative;left: 10px;top: 20px;">
            <tr>

                <s:iterator value="#session.pho_list" var="tr">
                <td >图片</td>
                <td><img src="car_pic/<s:property value="#tr.src"/>" width="80" height="80"></td>
            <tr>
                <td>    </td>
                <td><a href="detail_action!dele?shan=<s:property value="#tr.id"/>&shan2=<s:property value="#session.info.id"/>">删除</a></td>
            </tr>
            </s:iterator>
            </tr>

        </table>
    </div>

</div>
</body>
</html>