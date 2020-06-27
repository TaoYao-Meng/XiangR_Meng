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
            width: 1000px;
        }
    </style>
</head>
<body>
<table border="0" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td>图片</td>
        <td width=10% align="center">编号</td>
        <td width=10% align="center">名称</td>
        <td width=10% align="center">价格</td>
        <td width=10% align="center">商家</td>
        <td width=10% align="center">库存</td>
        <td width=10% align="center">信用</td>
        <td width=10% align="center">数量</td>
    </tr>
    <s:iterator value="#session.cart_list" var="tr">
        <tr>
            <td width=10% align="center"><img src="../car_pic/<s:property value="#tr.pic"/>" width="80" height="80"></td>
            <td width=10% align="center"><s:property value="#tr.id"/></td>
            <td width=10% align="center"><s:property value="#tr.name"/></td>
            <td width=10% align="center"><s:property value="#tr.price"/> </td>
            <td width=10% align="center"><s:property value="#tr.shop"/></td>
            <td width=10% align="center"><s:property value="#tr.inventory"/></td>
            <td width=10% align="center"><s:property value="#tr.credit"/></td>
            <td width=10% align="center"><s:property value="#tr.num"/></td>
            <td width=10% align="center" >
                <a href=cart_action!chan?shan=<s:property value="#tr.id"/>&shan2=0" >减少</a>
            </td>
            <td width=10% align="center"><a href="cart_action!chan?shan=<s:property value="#tr.id"/>&shan2=1"> 增加 </a></td>
        </tr>
    </s:iterator>
</table>
<mid>
    <td>总价:<s:property value="#session.all"/></td>
    <a href=cart_action!buy?shan=<s:property value="#tr.id"/>&shan2=0" >购买</a>
</mid>
</body>
</html>
