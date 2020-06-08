<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../css/admin.css" media="all">
</head>
<body class="layui-layout-body">
<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">layui 后台布局</div>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="${ADMIN_INFO.pic}" class="layui-nav-img">
                        ${ADMIN_INFO.username}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/logoutAdmin.am">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="adminIndex.html">
                    <span>星鱼音乐网站后台系统</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="系统设置" lay-direction="2">
                            <i class="layui-icon layui-icon-set-sm"></i>
                            <cite>系统设置</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="index" class="layui-this">
                                <a href="javascript:;">系统首页</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="用户管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>用户管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="userInfo">
                                <a href="${pageContext.request.contextPath}/toUserInfo.am">用户信息</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="slideShow" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="轮播图管理" lay-direction="2">
                            <i class="layui-icon layui-icon-carousel"></i>
                            <cite>轮播图管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="slideShowInfo">
                                <a href="${pageContext.request.contextPath}/toCarousel.am">轮播图信息</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="singer" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="歌手管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>歌手管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="singerInfo">
                                <a href="${pageContext.request.contextPath}/toSingerInfo.am">歌手信息</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="song" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="歌曲管理" lay-direction="2">
                            <i class="layui-icon layui-icon-play"></i>
                            <cite>歌曲管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="songInfo">
                                <a href="${pageContext.request.contextPath}/toSongInfo.am">歌曲信息</a>
                            </dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="songInfo">
                                <a href="javascript:;">歌曲评论</a>
                            </dd>
                        </dl>
                    </li>
                    <li data-name="songList" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="歌单管理" lay-direction="2">
                            <i class="layui-icon layui-icon-list"></i>
                            <cite>歌单管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="songList">
                                <a href="${pageContext.request.contextPath}/toSongListInfo.am">歌单信息</a>
                            </dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd data-name="songList">
                                <a href="javascript:;">歌单内容</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <div class="layadmin-iframe" >
                    <div class="layui-fluid" style="width: 90%;">
                        <div class="layui-row layui-col-space15">

                            <div class="layui-col-sm6 layui-col-md3">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        用户总数
                                    </div>
                                    <div class="layui-card-body layuiadmin-card-list">
                                        <p class="layuiadmin-big-font">${user_info_count}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-sm6 layui-col-md3 layui-col-md-offset1">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        歌曲总数
                                    </div>
                                    <div class="layui-card-body layuiadmin-card-list">
                                        <p class="layuiadmin-big-font">${song_info_count}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row layui-col-space15">
                            <div class="layui-col-sm6 layui-col-md3">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        歌单总数
                                    </div>
                                    <div class="layui-card-body layuiadmin-card-list">
                                        <p class="layuiadmin-big-font">${song_list_info_count}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-sm6 layui-col-md3 layui-col-md-offset1">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        歌手总数
                                    </div>
                                    <div class="layui-card-body layuiadmin-card-list">
                                        <p class="layuiadmin-big-font">${singer_info_count}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row" style="margin:50px 0">
                            <table class="layui-table" lay-skin="nob">
                                <colgroup>
                                    <col width="600">
                                    <col width="600">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><b>登录人</b></th>
                                    <th><b>上次登录时间</b></th>
                                    <th><b>本次登录时间</b></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${ADMIN_INFO.username}</td>
                                    <td><fmt:formatDate value="${ADMIN_INFO.lastTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><fmt:formatDate value="${ADMIN_INFO.thisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        let element = layui.element;
    });
</script>
</body>
</html>


