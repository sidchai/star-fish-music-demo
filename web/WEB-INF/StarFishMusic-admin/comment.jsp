<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评论信息</title>
    <link rel="shortcut icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/admin.css" media="all">
    <style>
        .layui-table-page {
            text-align: center
        }

        .layui-table-cell {
            height: 100px;
            line-height: 100px;
        }
    </style>
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

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                    lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="系统设置" lay-direction="2">
                            <i class="layui-icon layui-icon-set-sm"></i>
                            <cite>系统设置</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="index">
                                <a href="${pageContext.request.contextPath}/toAdminHome.am">系统首页</a>
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
                    <li data-name="song" class="layui-nav-item layui-nav-itemed">
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
                            <dd data-name="songInfo" class="layui-this">
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
                <div class="layadmin-iframe">
                    <div class="layui-row" style="background: white;margin-left: 30px">
                        <div class="layui-row" style="margin-left:50px;padding-top: 10px">
                            <span style="font-size: 20px">评论信息</span>
                        </div>
                        <div class="layui-row" style="margin-left:50px">
                            <table id="commentContent" lay-filter="test"></table>
                        </div>
                        <script type="text/html" id="commentBar">
                            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../static/layui/layui.js"></script>
<script>
    layui.use(['table', 'layer'], function () {
        let table = layui.table;
        let layer = layui.layer;
        let $ = layui.$;
        //第一个实例
        <%--${pageContext.request.contextPath}/showCommentContent.am--%>
        table.render({
            elem: '#commentContent'
            , url: '${pageContext.request.contextPath}/showCommentContent.am' //数据接口
            , cols: [[ //表头
                  {field: 'username', title: '用户', width: 500, fixed: 'left'}
                , {field: 'content', title: '评论内容', width: 750}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#commentBar', width: 200}
            ]]
            , width: 1455
            , page: {
                layout: ['prev', 'page', 'next', 'count']
                , groups: 5
                ,limit:5
            }
        });
        //监听工具条
        table.on('tool(test)', function (obj) {
            let data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.post("${pageContext.request.contextPath}/deleteComment.am?id="+data.id,{},function (result) {
                        if($.trim(result) == 'true'){
                            layer.msg("删除成功!");
                            obj.del();
                            layer.close(index);
                            table.reload("commentContent", {
                                url: '${pageContext.request.contextPath}/showCommentContent.am'
                            });
                        }else {
                            layer.msg("删除失败!");
                            layer.close(index);
                        }
                    });
                });
            }
        });
        $("#query-comment-info").click(function () {
            query();
        });
        $(document).keydown(function(event){
            if(event.keyCode == 13){
                query();
            }
        });
        function query() {
            table.reload("commentContent", {
                url: '${pageContext.request.contextPath}/showCommentContent.am',
                where: {
                    name: $("#query-comment-input").val()
                }
            });
            $("#query-comment-input").val("")
        }
    });
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        let element = layui.element;
    });
</script>
</body>
</html>