<%@ page import="com.softeem.pojo.User" %>
<%@ page import="com.softeem.utils.JsonUtils" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <link rel="stylesheet" href="css/login.css" media="all">
    <link rel="stylesheet" href="css/error.css">
</head>
<body style="background-image: url('img/music.jpg')">
<%
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if(cookie.getName().equals("ADMIN_INFO")){
            String value = URLDecoder.decode(cookie.getValue(), "utf-8");
            User user = JsonUtils.jsonToPojo(value, User.class);
            pageContext.setAttribute("admin",user);
            break;
        }
    }
%>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;padding: 250px 0">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2 style="color: white">StarFish-Music 后台管理</h2>
        </div>
        <form action="${pageContext.request.contextPath}/login.do" method="post" id="LAY-user-form" class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input" value="${admin.username}">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input" value="${admin.password}">
            </div>
            <div class="layui-form-item my-vercode-isHide">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <img src="${pageContext.request.contextPath}/captcha.do" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <c:if test="${not empty admin}">
                    <input type="checkbox" name="remember" value="on" lay-skin="primary" title="记住密码" checked>
                </c:if>
                <c:if test="${empty admin}">
                    <input type="checkbox" name="remember" value="on" lay-skin="primary" title="记住密码">
                </c:if>
            </div>
            <div class="layui-form-item">
                <input type="submit" class="layui-btn layui-btn-fluid" value="登录">
            </div>
        </form>
    </div>

    <div class="layui-trans layadmin-user-login-footer">
        <p>星の鱼音乐 版权所有© since 2020</p>
    </div>

</div>

<script src="static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script src="js/jquery.validate.js"></script>
<%--判断是否显示错误信息--%>
<c:if test="${login_msg}">
    <script>
        layui.use('layer', function(){
            let layer = layui.layer;
            layer.msg("登录失败,用户名与密码不匹配",function () {

            })
        });
    </script>
    <c:remove var="login_msg" scope="session"></c:remove>
</c:if>
<script>
    layui.use('form', function(){
        var form = layui.form;

    });
</script>
<script>
    //点击切换验证码
    $("#LAY-user-get-vercode").click(function () {
        $(this).attr("src","${pageContext.request.contextPath}/captcha.do?time="+ new Date().getTime());
        $("#LAY-user-login-vercode").val("");
    })
</script>
<script>
    // 密码验证
    $.validator.addMethod("password", function(value, element) {
        let tel = /[A-z]/;
        let tel2 = /[0-9]/;
        return tel.test(value) && tel2.test(value);
    }, "密码必须包含数字与字母");
    //表单验证
    $("#LAY-user-form").validate({
        rules:{
            password:{
                password:true,
                required:true,
                rangelength:[8,16]
            },
            username:{
                required:true,
                rangelength:[2,20]
            },
            vercode:{
                required:true,
                remote: {
                    url: "${pageContext.request.contextPath}/verifyCaptcha.do",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        vercode: function() {
                            return $("#LAY-user-login-vercode").val();
                        }
                    }
                }
            }
        },
        messages:{
            password:{
                required:"请输入您的密码",
                rangelength:"密码长度必须在{0}-{1}位之间"
            },
            username:{
                required:"请输入您的用户名",
                rangelength:"用户名长度必须在{0}-{1}位之间",
            },
            vercode:{
                required:"请输入验证码",
                remote:"验证码输入有误"
            }
        }
    })
</script>
</body>
</html>