<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/20
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        <%

            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
        %>
        *{margin:0;padding:0;box-sizing:border-box;}
        body{background:url("<%=basePath%>/web/img/zhihu.png");font-family: "微软雅黑", sans-serif;}
        .login {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width:300px;
            height:300px;
        }
        .login h1 { color:#555555; text-shadow: 0px 10px 8px #CDC673; letter-spacing:2px;text-align:center;margin-bottom:20px; }
        input{
            padding:10px;
            width:100%;
            color:white;
            margin-bottom:10px;
            background-color:#555555;
            border: 1px solid black;
            border-radius:4px;
            letter-spacing:2px;
        }
        form button{
            width:40%;
            padding:10px;
            background-color:#CDC673;
            border:1px solid black;
            border-radius:4px;
            cursor:pointer;
        }
    </style>
</head>

<body>

<div class="headtop"></div>
<div class="login">
    <h1>Login</h1>
    <form action="login.action" method="post" id="myform">
        <input type="text" name="userin.userName" placeholder="用户名" required="required">
        <input type="password" name="userin.passWord" placeholder="密  码" required="required">
        <button type="submit" >登录</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="window.location.href='../userRegister/register.jsp'">注册</button>
    </form>
</div>


</body>
</html>
