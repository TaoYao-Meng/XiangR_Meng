<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/25
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>带视觉差的网格浮动图片画廊jquery特效|DEMO_jQuery之家-自由分享jQuery、html5、css3的插件库</title>
    <link rel="stylesheet" type="text/css" href="../css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>
        table{
            width: 800px;
            height: 400px;
        }
    </style>
</head>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<body>
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>全部用户的预览页面，您有权限对用户进行增删查改以及限制用户权限的能力 <span>Weclome Manager username</span></h1>

    </header>
    <section id="scene" data-pointer-events="true" data-x-origin="0.5" data-y-origin="0.5" data-scalar-y="150.0" data-scalar-x="100.0" data-friction-x="0.05" data-friction-y="0.05">
        <div class="layer main" data-depth="1.0">
            <div class="col">
                <table border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">
                    <caption>用户信息</caption>

                        <tr>
                            <td width=25% align="center">22222</td>
                            <td width=25% align="center">22222</td>
                            <td width=25% align="center">2222</td>
                            <td width=25% align="center">2222</td>
                        </tr>

                </table>
            </div>

        </div>
    </section>
</div>

<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="../js/jquery-1.11.0.min.js"><\/script>')</script>
<script src='../js/parallax.min.js'></script>
<script type="text/javascript">
    var makeWinHeight = function(){
        var vh = $(window).height();
        var projects = vh/2;
        $('#scene, .layer.main').height(vh);
        $('#scene .col a, #scene .col').height(projects);
    }
    $(document).ready(function(){
        makeWinHeight();

    });
    $(window).resize(function(){
        makeWinHeight();
    });

    var scene = document.getElementById('scene');
    var parallax = new Parallax(scene);
</script>
</body>
</html>