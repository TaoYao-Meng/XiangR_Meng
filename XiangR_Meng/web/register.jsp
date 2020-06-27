<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/20
  Time: 14:09
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
        /* 让页面所有元素的padding和margin都设置为0 */
        *{margin:0;padding:0;box-sizing:border-box;}
        /* 设置背景图，字体设置为微软雅黑 */
        body{background:url(<%=basePath%>img/zhihu.png);font-family: "微软雅黑", sans-serif;}
        /* 引用图片高度设置为28px，就是页面最上方像屋檐一样的黑色图 */
        /*.headtop{background:url(topbg.jpg);height:28px;}*/
        /* 整个登录框的css，并使用绝对定位居中 */
        .register {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width:500px;
            height:300px;
        }
        /* 前面分析过的h1标签的css，text-shadow设置阴影使文字更好看，letter-spacing设置字符间距 */
        .register h1 { margin-left:20px;color:#555555; text-shadow: 0px 10px 8px #CDC673; letter-spacing:2px;text-align:left;margin-bottom:20px;}
        /* 两个输入框的css，border属性设置边框线粗细以及颜色，border-radius设置边框的圆角角度 */
        input{
            padding:10px;
            width:200px;
            color:white;
            margin-bottom:10px;
            background-color:#555555;
            border: 1px solid black;
            border-radius:4px;
            letter-spacing:2px;
        }
        /* 登录按钮的css，cursor:pointer当鼠标移到按钮上面时变成小手形状 */
        form button{
            width:200px;
            padding:10px;
            background-color:#CDC673;
            border:1px solid black;
            border-radius:4px;
            cursor:pointer;
        }
    </style>

    <script type="text/javascript">
        function shoeTips(spanId, tips) {
            var span = document.getElementById(spanId);
            span.innerHTML = tips;

        }
        /**
         * 校验用户名
         */


        function hint() {
            var value = document.getElementById("userName").value;
            var hint = document.getElementById("hint");
            var i;
            var array=document.getElementById('a').value;
            var reg = new RegExp( ' ' , "g" )
            var arrayList=array.replace('[','').replace(']','').replace(reg,'').split(',');
            for(i=0;i<arrayList.length;i++){
                console.log(arrayList[i]);
            }
            for(i=0;i<arrayList.length;i++){
                if(arrayList[i]==value){
                    hint.innerHTML = "用户名已存在";
                    hint.style.color="red";
                    return false;
                }
            }

            if(value.length < 6) {
                hint.innerHTML = "用户名太短";
                hint.style.color="red";
                return false;
            } else {
                hint.innerHTML = "用户名合格";
                hint.style.color="green"
                return true;
            }
        }


        /**
         * 校验密码
         */

        function checkPass() {
            var value = document.getElementById("passWord").value;
            var hint = document.getElementById("pass_hint");
            if(value.length < 6) {
                hint.innerHTML = "密码太短";
                hint.style.color="red";
                return false;
            } else {
                hint.innerHTML = "密码格式合格";
                hint.style.color="green";
                return true;
            }
        }

        function pass_hide() {
            var hint = document.getElementById("pass_hint");
            hint.innerHTML = "";
        }
        /***
         * 确认密码的校验
         */
        function checkPassPass() {
            var papavalue = document.getElementById("repassWord").value;
            var value = document.getElementById("passWord").value;
            var papahint = document.getElementById("passpass_hint");
            if(papavalue != value) {
                papahint.innerHTML = "两次密码不一致";
                papahint.style.color="red";
                return false;
            } else {
                papahint.innerHTML = "两次密码相同";
                papahint.style.color="green";
                return true;
            }
        }

        function passpass_hide() {
            var papahint = document.getElementById("passpass_hint");
            papahint.innerHTML = "";
        }

        function checkForm() {
            var flag =checkPass() && checkPassPass() && hint() ;
            return flag;
        }
    </script>
</head>
<body>
<%
    List username = new ArrayList();
%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/666?"+"useSSL=false&serverTimezone=UTC&useUnicode=true&charactererEncoding=utf-8";
        Connection con= DriverManager.getConnection(url,"root","111111");
        Statement stmt=con.createStatement();
        String sql="select * from user";
        ResultSet rs=stmt.executeQuery(sql);
        int i=0;

        while(rs.next()){
            username.add(rs.getString(2));
//            System.out.println(username);
        }
    }catch(Exception e){
        e.printStackTrace();
    }

%>
<input type="hidden" name="a" id="a" value="<%=username%>">
<div class="headtop"></div>
<div class="register">
    <h1>Register</h1>
    <form action="login!register" method="post" onsubmit="return checkForm()">
        <div>
            <div>
                <input type="text" id="userName" name="shan"  onkeyup="hint()"   placeholder="用户名" required="required">
                <span id="hint"></span>
            </div>
            <div>
                <input type="password" id="passWord" name="shan2"  onkeyup="checkPass()" placeholder="密  码" required="required">
                <span id="pass_hint"></span>
            </div>
            <div>
                <input type="password" id="repassWord" name="repassWord" onfocus="shoeTips('passpass_hint','两次密码要一致')" onblur="passpass_hide()" onkeyup="checkPassPass()" placeholder="重新输入密码" required="required">
                <span id="passpass_hint"></span>
            </div>
            <div>
                <input type="text" id="Sex" name="userin.sex"    placeholder="性别" required="required">
            </div>
            <div>
                <input type="text" id="address" name="userin.address"   placeholder="住址" required="required">
            </div>
            <div>
                <input type="text" id="birthday" name="userin.birthday"   placeholder="生日" required="required">
            </div>
        </div>
        <button type="submit" >注册</button>
    </form>
</div>
</body>
</html>
