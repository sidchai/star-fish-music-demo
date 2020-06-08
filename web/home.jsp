<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
<div class="layui-row">
    <div class="layui-col-md6 layui-col-md-offset3">
        <div class="layui-carousel" id="test1">
            <div carousel-item id="carousel">
            </div>
        </div>
    </div>
</div>
<div class="layui-row" style="padding-top: 20px">
    <div class="layui-row">
        <div class="layui-row">
            <div class="layui-col-md6 layui-col-md-offset3 v-hd2 my-line">
                <img src="img/yd.png" class="my-img-yd">
                <a href="#" class="tit">热门推荐</a>
                <div class="layui-inline tab">
                    <span class="layui-breadcrumb" id="my-classify" lay-separator="|">

                    </span>
                </div>
            </div>
        </div>
        <div class="layui-col-md6 layui-col-md-offset3 my-line">
            <div class="layui-fluid" id="LAY-component-grid-list">
                <div class="layui-row layui-col-space10" id="my-song-list-row">
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-md6 layui-col-md-offset3 v-hd3 my-line">
                <img src="img/yd.png" class="my-img-yd">
                <a href="#" class="tit">热门艺人</a>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-md6 layui-col-md-offset3 my-line">
                <div class="layui-fluid">
                    <div class="layui-row layui-col-space10" id="my-singer-row">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row my-copyright" style="height: 60px;padding: 40px 0">
            <p>星の鱼音乐 版权所有© since 2020</p>
        </div>
    </div>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script>
    layui.use('carousel', function () {
        let carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1',
            width: '960px', //设置容器宽度
            height: '360px',
            arrow: 'hover' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script>
    layui.use('util', function(){
        let util = layui.util;
        //执行
        util.fixbar({
            top:true
            ,click: function(type){
                if(type === 'bar2'){
                    $(document).scrollTop(0);
                }
            }
        });
    });
</script>
<script>
    $.ajax({
        url:"${pageContext.request.contextPath}/manageCarousel.do",
        dataType : "json",
        type : "post",
        async : false,
        success : function (data) {
            let html = "";
            for (let i = 0; i < data.length; i++) {
                let ls = data[i];
                html += "<div>" + "<a href='javascript:;'><img src='"+ls.pic+"' class='my-img-carousel'></a>" + "</div>";
            }
            $("#carousel").html(html);
        }
    });

    $.ajax({
        url:"${pageContext.request.contextPath}/manageSongListStyle.do",
        dataType : "json",
        type : "post",
        async : false,
        success : function (data) {
            let html = "";
            for (let i = 0; i < data.length; i++) {
                let ls = data[i];
                html += "<a href='javascript:;'>"+ls.style+"</a>";
            }
            $("#my-classify").html(html);
        }
    });

    $.ajax({
        url:"${pageContext.request.contextPath}/manageSongListHome.do",
        dataType : "json",
        type : "post",
        async : false,
        success : function (data) {
            let html = "";
            for (let i = 0; i < data.length; i++) {
                let ls = data[i];
                html += "<div class='layui-col-md3 '>" +
                    "<div class='layui-card my-song-list '>" +
                    "<a href='${pageContext.request.contextPath}/showSongListInfo.do?cId="+ls.id+"'> " +
                    "<img src='"+ls.pic+"' style='width: 140px;height: 140px;'>" +
                    "</a>" +
                    "<p>" +
                    "<a href='${pageContext.request.contextPath}/showSongListInfo.do?cId="+ls.id+"'>"+"<span>"+ls.title+"</span>"+"</a>" +
                    "</p>" +
                    "</div>" +
                    "</div>";
            }
            $("#my-song-list-row").html(html);
        }
    });

    $.ajax({
        url:"${pageContext.request.contextPath}/manageSingerRank.do",
        dataType : "json",
        type : "post",
        async : false,
        success : function (data) {
            let html = "";
            for (let i = 0; i < data.length; i++) {
                let ls = data[i];
                html += "<div class='layui-col-md3 '>" +
                    "<div class='layui-card my-song-list '>" +
                    "<a href='${pageContext.request.contextPath}/showArtistSingerInfo.do?sId="+ls.id+"'> " +
                    "<img src='"+ls.pic+"' style='border-radius: 50%;width: 140px;height: 140px;'>" +
                    "</a>" +
                    "<p>" +
                    "<a href='${pageContext.request.contextPath}/showArtistSingerInfo.do?sId="+ls.id+"' style='margin-left: 50px'>"+"<span>"+ls.singerName+"</span>"+"</a>" +
                    "</p>" +
                    "</div>" +
                    "</div>";
            }
            $("#my-singer-row").html(html);
        }
    });
</script>
</html>