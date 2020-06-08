<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.softeem.utils.JsonUtils" %>
<%@ page import="com.softeem.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <link rel="stylesheet" href="css/login.css" media="all">
    <link rel="stylesheet" href="css/versatile.css">
    <link rel="stylesheet" href="css/error.css">
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if(cookie.getName().equals("USER_INFO")){
            String value = URLDecoder.decode(cookie.getValue(), "utf-8");
            User user = JsonUtils.jsonToPojo(value,User.class);
            pageContext.setAttribute("user",user);
            break;
        }
    }
%>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none; padding-top: 0px">
    <div class="layadmin-user-login-main need-validata" >
        <div class="layui-inline">
            <video loop muted autoplay src="${pageContext.request.contextPath}/video/1.mp4" class="my-video">
            </video>
        </div>
        <div class="layadmin-user-login-main layui-inline">
            <div class="layadmin-user-login-box layadmin-user-login-header forget-tab">
            <span class="current" id="spn1">
                用户名登录
            </span>
                <span id="spn2">
                手机号登录
            </span>
            </div>
            <form action="${pageContext.request.contextPath}/login.do" method="post" id="LAY-user-form" class="layadmin-user-login-box layadmin-user-login-body layui-form" style="padding-left: 40px">
                <div class="layui-form-item my-username-isHide">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                    <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="请输入用户名" class="layui-input" value="${user.username}">
                </div>
                <div class="layui-form-item my-phone-isHide my-isConceal">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-phone"></label>
                    <input type="text" name="phone" id="LAY-user-login-phone" disabled="disabled" lay-verify="phone" placeholder="请输入手机号" class="layui-input" value="${user.phone}">
                </div>
                <div class="layui-form-item my-password-isHide">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input" value="${user.password}">
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
                    <c:if test="${not empty user}">
                        <input type="checkbox" name="remember" value="on" lay-skin="primary" title="记住密码" checked>
                    </c:if>
                    <c:if test="${empty user}">
                        <input type="checkbox" name="remember" value="on" lay-skin="primary" title="记住密码">
                    </c:if>
                    <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <input type="submit" class="layui-btn layui-btn-fluid" value="登录">
                </div>
            </form>
        </div>
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
    layui.use('layer',function () {
        let layer = layui.layer;
        let $spn1 = $("#spn1");
        let $spn2 = $("#spn2");
        $spn2.click(function () {
            $spn2.addClass("current");
            $spn1.removeClass("current");
            $(".my-username-isHide").addClass("my-isConceal");
            $(".my-phone-isHide").removeClass("my-isConceal");
            layer.msg("暂不支持手机号登录,请使用用户名登录!",function () {

            })
        });
        $spn1.click(function () {
            $spn1.addClass("current");
            $spn2.removeClass("current");
            $(".my-username-isHide").removeClass("my-isConceal");
            $(".my-phone-isHide").addClass("my-isConceal");
        })
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
    // 手机号码验证
    $.validator.addMethod("phoneNumber", function(value, element) {
        let tel = /^1[3456789][0-9]{9}$/;
        return tel.test(value);
    }, "请正确填写您的手机号码");
    // 密码验证
    $.validator.addMethod("password", function(value, element) {
        let tel = /[A-z]/;
        let tel2 = /[0-9]/;
        return tel.test(value) && tel2.test(value);
    }, "密码必须包含数字与字母");
    //表单验证
    $("#LAY-user-form").validate({
        rules:{
            phone:{
                phoneNumber:true,
                required:true,
            },
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
            phone:{
                required:"请输入手机号码",
            },
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