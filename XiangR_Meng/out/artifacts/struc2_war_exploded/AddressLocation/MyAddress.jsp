<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/22
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>定位</title>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=nSxiPohfziUaCuONe4ViUP2N"></script>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
    </script>
<body style="background:#CBE1FF">
<%
    String addressLocation=session.getAttribute("address").toString();
    System.out.println(addressLocation);
%>
<%--<input id="text_" type="text" value="郑州大学" style="margin-right:100px;" />--%>
<%--<button id="a" name="a" value="<%=addressLocation%>" type="submit" onclick="searchByStationName()">开始定位</button>--%>
<%--<input type="text" name="result_">--%>
<%--<div id="allmap"></div>--%>



<div style="width:100%;margin:auto;">
    <%--要查询的地址：<input id="text_" type="text" value="郑州大学" style="margin-right:100px;" /> --%>
    查询结果(经纬度)：
    <input id="result_" type="text" />
    <button type="button"  onclick="searchByStationName();" value="<%=addressLocation%>" id="a">查询</button>
    <div id="container" style="
    width: 100%;
    height: 500px;
    top: 50px;
    border: 1px solid gray;
    overflow:hidden;">
    </div>
</div>
</body>
</html>
<script type="text/javascript">
        var we=document.getElementById('a').value;
        console.log(we);


        var map = new BMap.Map("container");
        map.centerAndZoom("山东", 15);
        map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
        map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
        map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
        map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
        map.addControl(new BMap.OverviewMapControl({
            isOpen: true,
            anchor: BMAP_ANCHOR_BOTTOM_RIGHT
        })); //右下角，打开
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport(); //允许自动调节窗体大小
        function searchByStationName() {
            map.clearOverlays(); //清空原来的标注
            var keyword = we;
            localSearch.setSearchCompleteCallback(function(searchResult) {
                var poi = searchResult.getPoi(0);
                document.getElementById("result_").value = poi.point.lng + "," + poi.point.lat;
                map.centerAndZoom(poi.point, 8);
                var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat)); // 创建标注，为要查询的地方对应的经纬度
                map.addOverlay(marker);
                var content = we + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
                var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
                marker.addEventListener("click", function() {
                    this.openInfoWindow(infoWindow);
                });
                // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            });
            localSearch.search(keyword);
        }
</script>
