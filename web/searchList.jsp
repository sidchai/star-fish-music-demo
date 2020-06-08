<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索歌曲</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../css/searchList.css">
    <style>
        .layui-table-page{
            text-align: center
        }
    </style>
</head>
<body>
<!--搜索列表-->
<div class="layui-row content-wrapper">
    <div class="layui-col-md12 list-view view-without-leftbar">
        <div class="search-view">
            <div class="search-header">
                <h2>搜索结果</h2>
                <div class="tabs unselectable">
                    <%--<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title">
                            <li class="layui-this">歌曲</li>
                            <li>歌单</li>
                        </ul>
                        <div class="layui-tab-content"></div>
                    </div>--%>
                </div>
            </div>
        </div>
        <div class="table idle song-table search-songs">
            <div class="table-container">
                <table class="layui-hide" id="searchList"></table>
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
<script src="../static/layui/layui.js"></script>
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
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        let element = layui.element;
    });
</script>
<script>
    layui.use('table', function(){
        let table = layui.table;
        table.render({
            elem: '#searchList'
            ,url:'${pageContext.request.contextPath}/searchList.do?name=${param.name}'
            ,cols: [[
                {type:'numbers',width:100}
                ,{field:'songName', width:300, title: '歌曲名', templet: '#songName'}
                ,{field:'singerName', width:250, title: '艺人'}
                ,{field:'introduction', width:400, title: '专辑'}
            ]]
            ,width:1055
            ,page:{
                 layout:['prev', 'page','next']
                ,groups: 5
            }
        });
    });
</script>
</body>
</html>