<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/artist.css">
    <style>
        .layui-table-page{
            text-align: center
        }
    </style>
</head>
<body>
<!--歌手详情页-->
<div class="layui-row">
    <div class="layui-col-md8 layui-col-md-offset2">
        <div class="layui-col-md3 layui-inline my-leftbar-content">
            <div class="pics-wrap">
                <img src="${show_singer_info.pic}">
            </div>
            <div class="panel">
                <div class="section-content">
                    <div class="section-txt">
                        <ul class="artist-info" style="padding-left: 30px">
                            <li>出道时间：${show_singer_info.debutTime}</li>
                            <li>地区：${show_singer_info.region}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md9">
            <div class="section">
                <div class="intro">
                    <h2>${show_singer_info.singerName}</h2>
                    <span>
                        ${show_singer_info.introduction}
                    </span>
                </div>
                <div class="songs" style="opacity: 1">
                    <div class="content">
                        <h1 class="title">歌单</h1>
                        <hr>
                        <table class="layui-hide" id="artist-info"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row my-copyright" style="height: 60px;width: 100%;text-align: center;color: #aaa;padding: 40px 0">
        <p>星の鱼音乐 版权所有© since 2020</p>
    </div>
</div>
<script type="text/html" id="songName">
    <a href="/playBar.do?songId={{d.id}}&singerName={{d.singerName}}" class="layui-table-link" target="my-playBar">{{ d.songName }}</a>
</script>
<script src="static/layui/layui.js"></script>
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
    layui.use('table', function(){
        let table = layui.table;
        table.render({
            elem: '#artist-info'
            ,url:'${pageContext.request.contextPath}/showArtistSongInfo.do?sId='+${show_singer_info.id}
            ,cols: [[
                {type:'numbers'}
                ,{field:'songName', width:250, title: '歌曲名', templet: '#songName'}
                ,{field:'singerName', width:200, title: '艺人'}
                ,{field:'introduction', width:250, title: '专辑'}
            ]]
            ,width:745
            ,page:{
                layout:['prev', 'page','next','count']
                ,groups: 5
                ,limit:5
            }
            ,skin:'nob'
        });
    });
</script>
</body>
</html>