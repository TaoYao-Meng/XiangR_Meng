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
            width: 800px;

        }
        button{
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
<div>
    <table border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">
        <tr>
            <td width="10%">图片</td>
            <td width="10%">编号</td>
            <td width="10%">名称</td>
            <td width="10%">价格</td>
            <td width="10%">商家</td>
            <td width="10%">库存</td>
            <td width="10%">信用</td>
            <td width="10%">数量</td>
        </tr>
        <s:iterator value="#session.cart_list" var="tr">
            <tr>
                <td width="10%"><img src="car_pic/<s:property value="#tr.pic"/>" width="80" height="80"></td>
                <td width="10%"><s:property value="#tr.id"/></td>
                <td width="10%"><s:property value="#tr.name"/></td>
                <td width="10%"><s:property value="#tr.price"/> </td>
                <td width="10%"><s:property value="#tr.shop"/></td>
                <td width="10%"><s:property value="#tr.inventory"/></td>
                <td width="10%"><s:property value="#tr.credit"/></td>
                <td width="10%"><s:property value="#tr.num"/></td>
                <td width="10%">
                    <a href=cart_action!chan?shan=<s:property value="#tr.id"/>&shan2=0" >减少</a>
                </td>
                <td width="10%"><a href="cart_action!chan?shan=<s:property value="#tr.id"/>&shan2=1"> 增加 </a></td>
            </tr>
        </s:iterator>
    </table>
</div>
<div align="center">
    <td align="center" >总价:<s:property value="#session.all"/></td><br>

    <button><a href=cart_action!buy?shan=<s:property value="#tr.id"/>&shan2=0" t>购买</a></button>
</div>
</body>
</html>