<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <link rel="stylesheet" href="css/login.css" media="all">
    <link rel="stylesheet" href="css/versatile.css">
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main need-validata" >
        <div class="layui-inline">
            <video loop muted autoplay src="media/1.mp4" class="my-video">

            </video>
        </div>
        <div class="layadmin-user-login-main layui-inline">
            <div class="layadmin-user-login-box layadmin-user-login-header forget-tab">
            <span class="current" id="spn1">
                手机号找回密码
            </span>
                <span id="spn2">
                邮箱找回密码
            </span>
            </div>
            <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                           for="LAY-user-login-password"></label>
                    <input type="password" name="rePassword" id="LAY-user-login-re-password" lay-verify="required"
                           placeholder="新密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                           for="LAY-user-login-password"></label>
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="required"
                           placeholder="确认密码" class="layui-input">
                </div>
                <div class="layui-form-item my-phone-div">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-cellphone"></label>
                    <input type="text" name="cellphone" id="LAY-user-login-cellphone" lay-verify="phone" placeholder="手机" class="layui-input">
                </div>
                <div class="layui-form-item my-isConceal my-email-div">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-email" for="LAY-user-login-email"></label>
                    <input type="email" name="email" id="LAY-user-login-email" lay-verify="email" placeholder="邮箱" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-row">
                        <div class="layui-col-xs7">
                            <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
                                   for="LAY-user-login-vercode"></label>
                            <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required"
                                   placeholder="请输入验证码" class="layui-input">
                        </div>
                        <div class="layui-col-xs3 layui-col-xs-offset1">
                            <button class="layui-btn layui-btn-primary">发送验证码</button>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">修改密码</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;

    });
</script>
<script>
    let $spn1 = $("#spn1");
    let $spn2 = $("#spn2");
    $spn2.click(function () {
        $spn2.addClass("current");
        $spn1.removeClass("current");
        $(".my-email-div").removeClass("my-isConceal");
        $(".my-phone-div").addClass("my-isConceal");
    });
    $spn1.click(function () {
        $spn1.addClass("current");
        $spn2.removeClass("current");
        $(".my-phone-div").removeClass("my-isConceal");
        $(".my-email-div").addClass("my-isConceal");
    })
</script>
</body>
</html>