<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/collect.css">
</head>
<body>
<!--歌单详情-->
<div class="layui-row page-container">
    <div class="layui-col-md8 layui-col-md-offset2 content-wrapper">
        <div class="layui-col-md-3 layui-inline sticky-leftbar collect-intro is-affixed" style="position: relative">
            <div class="leftbar-inner" style="position: fixed; top: 0px; left: 300px; width: 265px; transform: translate3d(0px, 0px, 0px);">
                <div class="my-leftbar-content">
                    <div class="layui-row collect-logo">
                        <div class="cover">
                            <div class="image">
                                <!--歌单头像-->
                                <img src="${show_song_list_info.pic}" style="opacity: 1;">
                            </div>
                        </div>
                    </div>
                    <div class="collect-intro-title">歌单介绍</div>
                    <div class="collect-intro-text">
                        <!--歌单描述-->
                        ${show_song_list_info.introduction}
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md9 view-body">
            <div class="info-wrapper">
                <div class="collect-info">
                    <div class="titleInfo">
                        <div class="titleInfo-name">${show_song_list_info.title}</div>
                        <%--<div class="titleInfo-artist">
                            <div class="collect-user-item">
                                <!--上传歌单用户-->
                                <a href="#">
                                    <div class="cover">
                                        <!--上传用户头像-->
                                        <img src="${USER_INFO.pic}" class="is-none" id="my-user-avatar">
                                    </div>
                                </a>
                                <div class="name">
                                    <!--用户名-->
                                    <a href="#">JackeyLov9</a>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="collect-songs">
                <table class="layui-hide" id="collect-info"></table>
            </div>
        </div>
        <div class="layui-row my-copyright" style="height: 60px;width: 100%;text-align: center;color: #aaa;padding: 40px 0">
            <p>星の鱼音乐 版权所有© since 2020</p>
        </div>
    </div>
</div>
<script type="text/html" id="songName">
    <a href="/playBar.do?songId={{d.id}}&singerName={{d.singerName}}" class="layui-table-link" target="my-playBar">{{ d.songName }}</a>
</script>
<script src="static/layui/layui.js"></script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#collect-info'
            , url: '${pageContext.request.contextPath}/showCollectInfo.do?cId='+${show_song_list_info.id}
            , cols: [[
                {type:'numbers'}
                , {field: 'songName', width: 250, title: '歌曲名', templet: '#songName'}
                , {field: 'singerName', width: 200, title: '艺人'}
                , {field: 'introduction', width: 250, title: '专辑'}
            ]]
            , width: 745
            ,page:{
                layout:['prev', 'page','next']
                ,groups: 5
                ,limit: 5
            }
            ,skin:'nob'
        });
    });
</script>
<script>
    layui.use('util', function () {
        let util = layui.util;
        //执行
        util.fixbar({
            top: true
            , click: function (type) {
                if (type === 'bar2') {
                    $(document).scrollTop(0);
                }
            }
        });
    });
</script>
</body>
</html>