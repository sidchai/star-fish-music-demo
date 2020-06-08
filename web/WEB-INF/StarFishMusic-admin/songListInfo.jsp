<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>歌单信息</title>
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
                    <li data-name="songList" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="歌单管理" lay-direction="2">
                            <i class="layui-icon layui-icon-list"></i>
                            <cite>歌单管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="songList" class="layui-this">
                                <a href="javascript:;">歌单信息</a>
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
                    <div class="layui-row" style="background: #fff;">
                        <div class="layui-row" style="margin-left:50px;padding-top: 10px">
                            <div class="layui-form-item">
                                <div id="query-song-list-info" class="layui-form-label layui-btn layui-btn-danger" style="margin-right: 10px;text-align: center">查询</div>
                                <div class="layui-input-inline">
                                    <input type="text" name="songListName" id="query-song-list-input" required lay-verify="required"
                                           placeholder="搜索歌单标题" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-btn layui-btn-normal" id="addCarousel">新增歌单</div>
                            </div>
                        </div>
                        <div class="layui-row" style="margin-left:50px">
                            <table id="songListInfoContent" lay-filter="test"></table>
                        </div>
                        <script type="text/html" id="songInfoBar">
                            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                        </script>
                        <script type="text/html" id="introductionPic">
                            <img src="{{d.pic}}">
                        </script>
                        <script type="text/html" id="comment">
                            <a class="layui-btn layui-btn-sm layui-btn-primary" lay-event="comment">内容</a>
                        </script>
                        <script type="text/html" id="introduction">
                            <textarea name="desc" placeholder="请输入内容" class="layui-textarea">
                                {{d.introduction}}
                            </textarea>
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
        table.render({
            elem: '#songListInfoContent'
            , url: '${pageContext.request.contextPath}/songListInfoPage.am' //数据接口
            , cols: [[ //表头
                  {field: 'pic', title: '歌单图片', templet: "#introductionPic", width: 130, fixed: 'left'}
                , {field: 'title', title: '标题', width: 300}
                , {field: 'introduction', title: '歌单介绍', templet: "#introduction", width: 750}
                , {field: 'style', title: '风格', width: 150}
                , {fixed: 'right', title: '内容', templet: "#comment", align: 'center', width: 80}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#songInfoBar', width: 150}
            ]]
            , width: 1568
            , page: {
                layout: ['prev', 'page', 'next', 'count']
                , groups: 5
                , limit: 5
            }
        });
        //监听表格复选框选择
        table.on('checkbox(test)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(test)', function (obj) {
            let data = obj.data;
            if (obj.event === 'comment') {
                /*layer.open({
                    type: 2,
                    title: '歌单内容',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '80%'], //宽高
                    content: '${pageContext.request.contextPath}/toContent.am?id='+data.id
                });*/
                location.href = '${pageContext.request.contextPath}/toContent.am?id='+data.id;
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    let param = {
                        id: data.id,
                        url: data.pic
                    };
                    $.post("${pageContext.request.contextPath}/deleteSongListInfo.am", param, function (result) {
                        if ($.trim(result) == 'true') {
                            //删除成功
                            obj.del();
                            layer.msg("删除成功!");
                            layer.close(index);
                            table.reload("songListInfoContent", {
                                url: '${pageContext.request.contextPath}/songListInfoPage.am'
                            })
                        } else {
                            //删除失败
                            layer.msg("删除失败！", function () {

                            });
                            layer.close(index);
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2,
                    title: '修改歌单信息',
                    shadeClose: true,
                    shade: 0.8,
                    scrollbar: false,
                    area: ['480px', '500px'], //宽高
                    content: ['${pageContext.request.contextPath}/toUpdateSongListInfo.am?id=' + data.id, 'no']
                });
            }
        });
        $("#addCarousel").click(function () {
            layer.open({
                type: 2,
                title: '新增歌单',
                shadeClose: true,
                shade: 0.8,
                scrollbar: false,
                area: ['480px', '500px'], //宽高
                content: ['${pageContext.request.contextPath}/toAddSongListInfo.am', 'no']
            });
        });
        $("#query-song-list-info").click(function () {
            query();
        });
        $(document).keydown(function(event){
            if(event.keyCode == 13){
                query();
            }
        });
        function query() {
            table.reload("songListInfoContent", {
                url: '${pageContext.request.contextPath}/songListInfoPage.am',
                where: {
                    name: $("#query-song-list-input").val()
                }
            });
            $("#query-song-input").val("")
        }
    });
</script>
<script>
    //Demo
    layui.use('form', function () {
        let form = layui.form;

    });
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        let element = layui.element;
    });
</script>
<script>
    if(window != top){
        top.location.href=location.href;
    };
</script>
</body>
</html>