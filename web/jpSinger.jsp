<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>日本歌手</title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/singer.css">
</head>
<body>
<div class="layui-row page-container">
    <div class="layui-col-md8 layui-col-md-offset2">
        <div class="content-wrapper">
            <div class="list-view artist-list-view view-without-leftbar">
                <div class="list-header">
                    <div class="list-title">艺人</div>
                    <div class="tabs unselectable">
                        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                            <ul class="layui-tab-title">
                                <li><a href="singer.jsp">全部</a></li>
                                <li><a href="cnSinger.jsp">华语</a></li>
                                <li><a href="eaSinger.jsp">欧美</a></li>
                                <li><a href="krSinger.jsp">韩国</a></li>
                                <li class="layui-this"><a href="jpSinger.jsp">日本</a></li>
                            </ul>
                            <div class="layui-tab-content"></div>
                        </div>
                    </div>
                </div>
                <div class="list-container artist-list">
                    <div class="adaptive-list" id="my-singer-jp" style="opacity: 1">
                    </div>
                </div>
                <div id="rc-pagination" style="text-align: center"></div>
            </div>
        </div>
        <div class="layui-row my-copyright" style="height: 60px;width: 100%;text-align: center;color: #aaa;padding: 40px 0">
            <p>星の鱼音乐 版权所有© since 2020</p>
        </div>
    </div>

</div>

<script src="static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        let element = layui.element;
    });
</script>
<script>
    let curr = 1;
    let limit =15;
    let total;
    $(document).ready(function () {
        getInfo();// 获取数据
        toPage();// 进行分页
    });
    function getInfo(){
        $.ajax({
            url: "${pageContext.request.contextPath}/manageSingerByClassify.do?cId="+'4',
            dataType: "json",
            type: "post",
            async: false,
            data: {
                "page": curr,
                "limit": limit
            },
            success: successFu
        });
    }
    function successFu(pager){
        //1.清空原数据
        $('#my-singer-jp').empty();
        // 2.重新赋值页码、条数、总记录数
        curr = pager.start;
        limit = pager.limit;
        total = pager.count;
        let html = "";
        $.each(pager.data,(i,ls) => {
            html += "<div class='artist-item unselectable' style='flex: 0 0 16.6667%; max-width: 16.6667%;'>" +
                "<a href='${pageContext.request.contextPath}/showArtistSingerInfo.do?sId=" + ls.id + "'>" +
                "<div class='cover'>\n" +
                "<div class='image'>\n" +
                "<img src='" + ls.pic + "'>" +
                "</div>" +
                "</div>" +
                "</a>" +
                "<div class='info'>" +
                "<div class='name'>" +
                "<a href='${pageContext.request.contextPath}/showArtistSingerInfo.do?sId=" + ls.id + "'>" + ls.singerName + "</a>" +
                "</div>" +
                "</div>" +
                "</div>";
        });
        $("#my-singer-jp").html(html);
    }
    function  toPage() {
        layui.use('laypage', function () {
            let laypage = layui.laypage;
            //执行一个laypage实例
            laypage.render({
                elem: 'rc-pagination' //注意，这里的 test1 是 ID，不用加 # 号
                , count: total //数据总数，从服务端得到
                , limit: limit
                , curr: 1
                , layout: ['prev', 'page', 'next', 'count']
                , prev: '<em><</em>'
                , next: '<em>></em>'
                , jump: function (obj, first) {
                    curr = obj.curr;
                    limit = obj.limit;
                    if (!first) {
                        getInfo();
                    }
                }
            });
        });
    }
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
</body>
</html>