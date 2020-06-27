<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/23
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dim</title>
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
</head>
<body>
<div class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>车辆的瀑布流综合展示 <span>A javascript plugin to filter elements from a "masonry" grid</span></h1>

    </header>
    <main class="sortable">
        <div class="container">
            <div class="wrapper">

                <div id="sortable" class="sjs-default">
                    <s:iterator value="dimcarArrayList">
                        <div data-sjsel="flatty">
                            <div class="card">
                                <div class="related">
                                    <a href="#">
                                        <img class="card__picture" src="<%=basePath%><s:property value="img"/>" alt="">
                                    </a>
                                </div>
                                <div class="card-infos">
                                    <h2 class="card__title"><s:property value="name"/> </h2>
                                    <p class="card__text">
                                        价格为：<s:property value="price"/>
                                        <br>
                                        信用值：<s:property value="believe"/>
                                        <br>
                                        商店名称：<s:property value="shop"/>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </div>
        </div>
    </main>


</div>

<script type="text/javascript">
    document.querySelector('#sortable').sortablejs()
</script>
</body>
</html>
