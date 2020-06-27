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
        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
<mid>商品详情<s:property value="#session.back"/></mid>
<%--<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">--%>
<%--<tr>--%>
<%--<td>图片</td>--%>
<%--<td>编号</td>--%>
<%--<td>名称</td>--%>
<%--<td>价格</td>--%>
<%--<td>商家</td>--%>
<%--<td>库存</td>--%>
<%--<td>信用</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td><img src="car_pic/<s:property value="#session.info.pic"/>" width="80" height="80"></td>--%>
<%--<td><s:property value="#session.info.id"/></td>--%>
<%--<td><a href="detail_action.action?shan=<s:property value="#session.info.id"/>"><s:property value="#session.info.name"/></a></td>--%>
<%--<td><s:property value="#session.info.price"/> </td>--%>
<%--<td><a href="own_action.action?shan=<s:property value="#session.info.shop"/>"><s:property value="#session.info.shop"/></a></td>--%>
<%--<td><s:property value="#session.info.inventory"/> </td>--%>
<%--<td><s:property value="#session.info.credit"/> </td>--%>
<%--<td><a href="cart_action!add?shan=<s:property value="#session.info.id"/>&shan2=<s:property value="#session.info.name"/>"> 添加至购物车 </a></td>--%>
<%--</tr>--%>
<%--</table>--%>


<table  align="center" class="gridtable" border="1" bgcolor="#ffffff"  cellspacing="1" cellpadding="1" width="400px" >
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
        <td ><a href="detail_action.action?shan=<s:property value="#session.info.id"/>"><s:property value="#session.info.name"/></a></td>
    </tr>

    <tr align="center">
        <td>价格</td>
        <td ><s:property value="#session.info.price"/> </td>
    </tr>

    <tr align="center">
        <td>商家</td>
        <td ><a href="own_action.action?shan=<s:property value="#session.info.shop"/>"><s:property value="#session.info.shop"/></a></td>
    </tr>
    <tr align="center">
        <td>库存</td>
        <td ><s:property value="#session.info.inventory"/></td>
    </tr>
    <tr align="center">
        <td>信用</td>
        <td><s:property value="#session.info.credit"/></td>
    </tr>
    <tr align="center">
        <td>购物车</td>
        <td><a href="cart_action!add?shan=<s:property value="#session.info.id"/>&shan2=<s:property value="#session.info.name"/>"> 添加至购物车 </a</td>
    </tr>
</table>




<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td>简介图片</td>
    </tr>
    <s:iterator value="#session.pho_list" var="tr">
        <tr>
            <td><img src="car_pic/<s:property value="#tr.src"/>" width="80" height="80"></td>
        </tr>
    </s:iterator>
</table>


<%--<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">--%>
<%--<tr>--%>
<%--<td>图片</td>--%>
<%--</tr>--%>
<%--<s:iterator value="#session.pho_list" var="tr">--%>
<%--<tr>--%>
<%--<td><img src="../car_pic/<s:property value="#tr.src"/>" width="80" height="80"></td>--%>
<%--<td><s:property value="#tr"/></td>--%>
<%--</tr>--%>
<%--</s:iterator>--%>
<%--</table>--%>
<mid><s:property value="#session.info.describe"/></mid>
</body>
</html>