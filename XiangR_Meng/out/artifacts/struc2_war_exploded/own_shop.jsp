<%--
  Created by IntelliJ IDEA.
  User: 666
  Date: 2019/12/22
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        img{
            width: 80px;
            height: 80px;
        }
        table{
            width: 900px;

        }
        input{
            width:20%;
            padding:10px;
            background-color:#CBFFC8;
            border:1px solid black;
            border-radius:4px;
            cursor:pointer;

        }
        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
<mid>我的商品</mid>
<div>
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
        <s:iterator value="#session.list_own" var="tr">
            <tr>
                <td width="10%" valign="middle" align="center"><img src="car_pic/<s:property value="#tr.pic"/>" width="80" height="80"></td>
                <td width="10%" valign="middle" align="center"><s:property value="#tr.id"/></td>
                <td width="10%" valign="middle" align="center"><s:property value="#tr.name"/></td>
                <td width="10%" valign="middle" align="center"><s:property value="#tr.price"/> </td>
                <td width="10%" valign="middle" align="center"><s:property value="#tr.shop"/></td>
                <td width="10%" valign="middle" align="center"><s:property value="#tr.inventory"/></td>
                <td width="10%" valign="middle" align="center"><s:property value="#tr.credit"/></td>
                <td width="10%" valign="middle" align="center"><a href="detail_action.action?shan=<s:property value="#tr.id"/>&back=shop">图片管理</a></td>
                <td width="10%" valign="middle" align="center">
                    <a href="own_action!dele?shan=<s:property value="#tr.id"/>"> 删除 </a>
                </td>
                <td width="10%" valign="middle" align="center"><a href="change_car.jsp?id=<s:property value="#tr.id"/>&name=<s:property value="#tr.name"/>&price=<s:property value="#tr.price"/>&shop=<s:property value="#tr.shop"/>&inventory=<s:property value="#tr.inventory"/>&pic=<s:property value="#tr.pic"/>&back=shop" address="address" >修改</a>
                </td>
            </tr>
        </s:iterator>
    </table>
</div>
<br>
<div align="center">
    <input type="button" onclick="window.location='add_car.jsp'" value="添加"/>
</div>

</body>
</html>
