<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/22
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>综合</title>
    <%

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
    <link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css"><!--演示页面样式，使用时可以不引用-->
    <link rel="stylesheet" href="../css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Hind:400,600|Open+Sans:300,600" rel="stylesheet">
    <link rel="stylesheet" href="../dist/sortable.min.css">
    <script type="text/javascript" src="../dist/sortable.min.js"></script>
    <style>
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
        /* 登录按钮的css，cursor:pointer当鼠标移到按钮上面时变成小手形状 */
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
<body >
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>车辆的瀑布流综合展示 <span>A javascript plugin to filter elements from a "masonry" grid</span></h1>
        <%--<div class="htmleaf-links">--%>
            <%--<a class="htmleaf-icon icon-htmleaf-home-outline" href="http://www.htmleaf.com/" title="jQuery之家" target="_blank"><span> jQuery之家</span></a>--%>
            <%--<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="http://www.htmleaf.com/jQuery/pubuliuchajian/201808015256.html" title="返回下载页" target="_blank"><span> 返回下载页</span></a>--%>
        <%--</div>--%>
        <form action="dimcaraction.action" method="post">
            <input type="text" name="car.name"><button type="submit" id="dimbutton">查询</button>
        </form>
    </header>
    <main class="sortable">
        <div class="container">
            <div class="wrapper">
                <%--<ul class="sortable__nav nav">--%>
                    <%--<li>--%>
                        <%--<a data-sjslink="all" class="nav__link">--%>
                            <%--All--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a data-sjslink="flatty" class="nav__link">--%>
                            <%--Flatty--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a data-sjslink="funny" class="nav__link">--%>
                            <%--Funny--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <div id="sortable" class="sjs-default">
                    <s:iterator value="#session.list" var="tr">
                    <div data-sjsel="flatty">
                        <div class="card">
                            <div class="related">
                                <a href="detail_action.action?shan=<s:property value="#tr.id"/>">
                            <img class="card__picture" src="<%=basePath%><s:property value="#tr.pic"/>" alt="">
                                </a>
                            </div>
                                <div class="card-infos">
                                <h2 class="card__title"><s:property value="#tr.name"/> </h2>
                                <p class="card__text">
                                    价格为：<s:property value="#tr.price"/>
                                    <br>
                                    信用值：<s:property value="#tr.credit"/>
                                    <br>
                                    商店名称：<s:property value="tr.shop"/>

                                </p>
                            </div>
                        </div>
                    </div>
                    </s:iterator>
                </div>
            </div>
        </div>
    </main>

    <div class="related">
        <h3>如果你喜欢这个插件，那么你可能也喜欢:</h3>
        <a href="http://www.htmleaf.com/jQuery/pubuliuchajian/201704124451.html">
            <img src="<%=basePath%>img/timg.jpg" width="300" alt="基于Masonry的网格瀑布流加载动画特效"/>
            <h3>基于Masonry的网格瀑布流加载动画特效</h3>
        </a>
        <a href="http://www.htmleaf.com/jQuery/pubuliuchajian/201704104447.html">
            <img src="<%=basePath%>img/timg2.jpg" width="300" alt="基于Bootstrap仿Pinterest的网格瀑布流插件"/>
            <h3>基于Bootstrap仿Pinterest的网格瀑布流插件</h3>
        </a>
    </div>
</div>

<script type="text/javascript">
    document.querySelector('#sortable').sortablejs()
</script>
</body>
</html>
