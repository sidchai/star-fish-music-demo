<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <link rel="shortcut icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/admin.css" media="all">
    <style>
        .layui-table-page{
            text-align: center
        }
        .layui-table-cell{
            height: 100px;
            line-height: 100px;
        }
    </style>
</head>
<body  class="layui-layout-body">
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
                    <li data-name="user" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="用户管理" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>用户管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="userInfo"  class="layui-this">
                                <a href="javascript:;">用户信息</a>
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
                    <div class="layui-row" style="background: #fff;">
                        <div class="layui-row" style="margin-left:50px;padding-top: 10px">
                            <div class="layui-form-item">
                                <div id="query-user-info" class="layui-form-label layui-btn layui-btn-danger" style="margin-right: 10px;text-align: center">查询</div>
                                <div class="layui-input-inline">
                                    <input type="text" name="username" id="query-user-input" required lay-verify="required" placeholder="搜索用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-btn layui-btn-normal" id="addUser">添加新用户</div>
                            </div>
                        </div>
                        <div class="layui-row" style="margin-left:50px">
                            <table id="userInfoContent" lay-filter="test"></table>
                        </div>
                        <script type="text/html" id="userInfoBar">
                            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                        </script>
                        <script type="text/html" id="userInfoPic">
                            <img src="{{d.pic}}">
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../static/layui/layui.js"></script>
<script>
    layui.use(['table','layer'], function(){
        let table = layui.table;
        let layer = layui.layer;
        let $ = layui.$;
        //第一个实例
        table.render({
            elem: '#userInfoContent'
            ,url: '${pageContext.request.contextPath}/userInfoPage.am' //数据接口
            ,cols: [[ //表头
                {field: 'pic', title: '用户头像',templet:"#userInfoPic",width:130,fixed: 'left'}
                ,{field: 'username', title: '用户名' , width:150}
                ,{field: 'isAdmin', title: '用户类别' , width:150}
                ,{field: 'sex', title: '性别', width:60}
                ,{field: 'phone', title: '手机号码', width:150}
                ,{field: 'email', title: '邮箱',width: 200}
                ,{field: 'birthday', title: '生日',templet: "<div>{{layui.util.toDateString(d.birthday,'yyyy-MM-dd')}}</div>",width: 150}
                ,{field: 'signature', title: '个人签名',width: 300}
                ,{field: 'region', title: '地区', align:'center',width: 100}
                ,{fixed: 'right', title: '操作', align:'center',toolbar: '#userInfoBar',width: 150}
            ]]
            ,width:1552
            ,page:{
                layout:['prev', 'page','next','count']
                ,groups: 5
                ,limit : 5
            }
        });
        //监听表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    let param = {
                        id:data.id,
                        url:data.pic
                    };
                    $.post("${pageContext.request.contextPath}/deleteUserInfo.am",param,function (result) {
                        if($.trim(result) == 'true'){
                            //删除成功
                            obj.del();
                            layer.msg("删除成功!");
                            layer.close(index);
                            table.reload("userInfoContent", {
                                url: '${pageContext.request.contextPath}/userInfoPage.am'
                            })
                        }else {
                            //删除失败
                            layer.msg("删除失败！",function () {

                            });
                            layer.close(index);
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                /*layer.alert('编辑行：<br>'+ JSON.stringify(data))*/
                layer.open({
                    type: 2,
                    title: '修改用户信息',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['450px', '750px'], //宽高
                    content: ['${pageContext.request.contextPath}/toUpdateUserInfo.am?username='+data.username,'no']
                });
            }
        });
        $("#addUser").click(function () {
            layer.open({
                type: 2,
                title: '添加新用户',
                shadeClose: true,
                shade: 0.8,
                scrollbar:false,
                area: ['450px', '850px'], //宽高
                content: ['${pageContext.request.contextPath}/toAddUserInfo.am','no']
            });
        });
        $("#query-user-info").click(function () {
            query();
        });
        $(document).keydown(function(event){
            if(event.keyCode == 13){
                query();
            }
        });
        function query() {
            table.reload("userInfoContent", {
                url: '${pageContext.request.contextPath}/userInfoPage.am',
                where: {
                    name: $("#query-user-input").val()
                }
            });
            $("#query-user-input").val("")
        }
    });
</script>
<script>
    //Demo
    layui.use('form', function(){
        let form = layui.form;

    });
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
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