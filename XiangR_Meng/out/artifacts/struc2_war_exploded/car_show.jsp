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
</head>
<body>
<a href="chang_pic.jsp"><img src="sculpture/<s:property value="#session.no"/>.jpg" width="80" height="80"/></a>
<a href="cart_action!read"> 查看购物车 </a>
<a href=car_action.action> 查看全部商品 </a>
<a href=try_login.jsp>注销</a>
<a href="own_action.action?shan=<s:property value="#session.no"/>">我的商店</a>

<table border="1" bgcolor="#ffffff" align="center" cellpadding="1">
    <tr>
        <td>图片</td>
        <td>编号</td>
        <td>名称</td>
        <td>价格</td>
        <td>商家</td>
        <td>库存</td>
        <td>信用</td>
    </tr>
    <s:iterator value="#session.list" var="tr">
        <tr>
            <td><img src="car_pic/<s:property value="#tr.pic"/>" width="80" height="80"></td>
            <td><s:property value="#tr.id"/></td>
            <td><a href="detail_action.action?shan=<s:property value="#tr.id"/>"><s:property value="#tr.name"/></a></td>
            <td><s:property value="#tr.price"/> </td>
            <td><a href="own_action.action?shan=<s:property value="#tr.shop"/>"><s:property value="#tr.shop"/></a></td>
            <td><s:property value="#tr.inventory"/></td>
            <td><s:property value="#tr.credit"/></td>
            <td><s:property value="#session.k"/></td>
            <td><a href="cart_action!add?shan=<s:property value="#tr.id"/>&shan2=<s:property value="#tr.name"/>"> 添加至购物车 </a></td>
        </tr>
    </s:iterator>
</table>

<s:debug></s:debug>
</body>
</html>
