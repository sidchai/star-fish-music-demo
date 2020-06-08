<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>starFish-music</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/playBar.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body style="background-color: #F0F0F0">
<div class="layui-row" style="height: 80px">
    <div class="layui-col-md3 layui-bg-black my-title">
        <a href="index.jsp">
            <img src="img/star.png">
            <span>星&nbsp;の&nbsp;鱼&nbsp;音&nbsp;乐</span>
        </a>
    </div>
    <div class="layui-col-md4 layui-bg-black my-height-div">
        <ul class="layui-nav">
            <li class="layui-nav-item layui-this">
                <a href="home.jsp" target="my-iframe-content">发现音乐</a>
            </li>
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/toMySong.do" target="my-iframe-content">我的音乐</a>
            </li>
            <li class="layui-nav-item">
                <a href="singer.jsp" target="my-iframe-content">歌手</a>
            </li>
            <li class="layui-nav-item">
                <a href="songList.jsp" target="my-iframe-content">歌单</a>
            </li>
        </ul>
    </div>
    <div class="layui-col-md2 layui-bg-black my-height-div">
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form" style="padding: 15px 0 0 15px">
            <div class="layui-form-item layui-inline">
                <label class="layadmin-user-login-icon layui-icon layui-icon-search" for="LAY-search-song"></label>
                <input type="text" id="LAY-search-song" name="song" placeholder="音乐" lay-verify="required" class="layui-input" style="width: 180px;margin: 0">
            </div>
            <a target="my-iframe-content" id="search-list-btn" class="layui-inline layui-btn layui-btn-sm" style="margin:0 0 20px 10px">
                <i class="layui-icon">&#xe615;</i>
            </a>
        </div>
    </div>
    <div class="layui-col-md3 layui-bg-black my-height-div">
        <ul class="layui-nav">
            <c:if test="${empty USER_INFO}">
                <li class="layui-nav-item">
                    <a href="javascript:;" id="login-user">登录</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" id="register-user">注册</a>
                </li>
            </c:if>
            <c:if test="${not empty USER_INFO}">
                <li class="layui-nav-item">
                    <a href=""><img src="${USER_INFO.pic}" class="layui-nav-img">${USER_INFO.username}</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/toUserUpdateUserInfo.do" target="my-iframe-content">修改信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/logout.do">退了</a></dd>
                    </dl>
                </li>
            </c:if>
        </ul>
    </div>
    <div class="layui-row">
        <div class="layui-col-md12 layui-bg-gray" style="height: 20px">
        </div>
    </div>
</div>
<div class="layui-row">
    <div class="layui-col-md12" >
        <div class="layui-row my-content">
            <iframe src="home.jsp" style="height: 780px" class="my-content-iframe" name="my-iframe-content">

            </iframe>
        </div>
    </div>
</div>
<iframe name="my-playBar" src="playBar.jsp" style="width: 99%;height: 60px;">

</iframe>
<script src="static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script>
    layui.use('layer', function () {
        let layer = layui.layer;
        $("#login-user").click(function () {
            layer.open({
                type: 2,
                title: '登录',
                shade: 0.5,
                area: ['630px', '570px'],
                content: ['${pageContext.request.contextPath}/login.jsp', 'no'],
                anim: 1
            });
        });
        $("#register-user").click(function () {
            layer.open({
                type: 2,
                title: '注册',
                shade: 0.5,
                area: ['610px', '580px'],
                content: ['${pageContext.request.contextPath}/register.jsp', 'no'],
                anim: 1
            });
        })
    });
</script>
<script>
    layui.use('element', function () {
        let element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
    });
</script>
<script>
    if(window != top){
        top.location.href=location.href;
    };
    $("#search-list-btn").click(function () {
        this.href = "${pageContext.request.contextPath}/searchList.jsp?name=" + $("#LAY-search-song").val()
    });
    $(document).keydown(function(event){
        if(event.keyCode == 13){
            $("#search-list-btn").trigger("click");
        }
    });
</script>
<script>
</script>
</body>
</html>