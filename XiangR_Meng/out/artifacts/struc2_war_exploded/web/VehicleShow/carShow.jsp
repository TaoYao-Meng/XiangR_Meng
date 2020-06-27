<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="text-decoration" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/20
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
    <style>

        body{background:url("<%=basePath%>img/zhihu.png"); overflow: hidden}
        #top{
            height: 65px;
            width: 100%;
        }
        #bottom{
            width: 100%;
            height: 800px;
        }
        #bottom #left{
            height: 100%;
            width: 300px;
            float: left;
            border-top: 2px solid #ccc;
            border-left: 2px solid #ccc;
            border-right: 2px solid #ccc;
            border-radius: 8px 8px 8px 8px;
        }
        #bottom #left #aa{
            width:100px;
            height:50px;
            font-family: "微软雅黑", sans-serif;
            font-size: 20px;
            background:yellow;
            transition:width 2s;
            -moz-transition:width 2s ; /* Firefox 4 */
            -webkit-transition:width 2s,font-size 2s; /* Safari and Chrome */
            -o-transition:width 2s; /* Opera */

        }
        #bottom #left #aa:hover
        {
            width:300px;
            font-size: 40px;
        }
        #bottom #right{
            height: 100%;
            width: 1200px;
            float: left;

        }


        a{
            text-decoration: none;
        }
         ul{
            width: 99%;
             font-size: 20px;
             text-align: center;

            background-color: antiquewhite;
            margin: 0 0px;
            padding: 0 0 0px 0;
            list-style: none;
            border-top: 1px solid #ccc;
             font-family: "微软雅黑", sans-serif;
            overflow: hidden;


        }
         .first_ul{
            border-radius: 8px 8px 0 0;
        }
        .last_ul{
            border-radius: 0 0 8px 8px;
        }
         ul span{
            width: 100%;
            display: inline-block;
            background-color: white;
            padding: 0px 6px;
            box-sizing: border-box;
            cursor: pointer;
             height: 50px;
             padding-top: 10px;
        }
         ul span b{
            float: right;
        }
         ul li{
            display: none;
            cursor: pointer;
             border-radius: 8px 8px 8px 8px;
             height: 50px;
             padding-top: 15px;
        }
         ul li:hover{
            background-color: #bbdbcd;
        }
        iframe{
            overflow:hidden;
        }
    </style>
</head>
  <body>
    <div id="top" >
        欢迎您，买家用户:<s:property value="#session.username"/>&nbsp;<a href="../userLogin/login.jsp">注销</a>
    </div>
    <div id="bottom">
        <div id="left">
            <div id="aa">
            <a href="../UserSelf/userself.jsp" target="rightframe">个人信息</a>
            <br>
            </div>
                   <div id="box2">

                       <ul class='first_ul'>
                           <span class="m">个人信息<b>+</b></span>
                           <li><a href="../UserSelf/userself.jsp" target="rightframe">个人信息管理</a></li>
                           <li><a href="../UserSelf/changePassword.jsp" target="rightframe">修改密码</a></li>
                           <li><a href="../UserSelf/shopCar.jsp" target="rightframe">我的购物车</a></li>
                       </ul>
                       <ul>
                           <span class="m">车辆信息<b>+</b></span>
                           <li><a href="car_action.action" target="rightframe">综合</a></li>
                           <li>信用</li>
                           <li>价格升序</li>
                           <li>价格降序</li>
                       </ul>
                       <ul>
                           <span>位置信息 <b>+</b></span>
                           <li><a href="../AddressLocation/MyAddress.jsp" target="rightframe">自身位置</a> </li>
                           <li>商家位置</li>
                           <li>自身与商家位置比对</li>
                       </ul>
                       <ul class='last_ul'>
                           <span>收藏店家<b>+</b></span>
                           <li>综合</li>
                           <li>搜索店家</li>
                           <li>删除店家</li>
                           <li>增添店家</li>
                       </ul>
                   </div>



        </div>
        <div id="right">
            <iframe src="../VehicleShow/carindex.jsp" name="rightframe"
                    frameborder="0" height="100%" width="100%" style="float: left" target="_self"
                    marginwidth="0" marginheight="0"
                    scrolling="auto"  allowTransparency="yes" overflow="hidden"></iframe>
        </div>

    </div>
  </body>

</html>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
<script >
    $(function(){
        // 改进版本的手风琴菜单效果
        $('#box2 span').click(function(){
            var curLi=$(this).parent().find('li');              //获得当前点击的菜单的二级菜单
            var restUl=$(this).parent().siblings('ul');         //获得没有点击的一级菜单
            // 通过判断二级菜单是否收起，来进行判断是否展开，并更换"+ -"表示
            if(curLi.css('display') === 'none') {
                curLi.slideDown();
                curLi.parent().find('b').text('-');
            }
            else {
                curLi.slideUp();
                curLi.parent().find('b').text('+');
            }
            // 没有点击的二级菜单全部收起，并将标志全部改为"+"
            restUl.find('li').slideUp();
            restUl.find('b').text('+');
        });
    });

</script>



