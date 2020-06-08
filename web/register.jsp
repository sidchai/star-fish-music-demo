<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;padding-top: 0px">
    <div class="layadmin-user-login-main need-validata" >
        <div class="layui-inline">
            <video loop muted autoplay src="${pageContext.request.contextPath}/video/1.mp4" class="my-video">

            </video>
        </div>
        <div class="layadmin-user-login-main layui-inline" >
            <form action="register.do" method="post" class="layadmin-user-login-box layadmin-user-login-body layui-form" id="LAY-user-form" style="padding-left: 30px">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-phone"></label>
                    <input type="text" name="phone" id="LAY-user-login-phone" lay-verify="phone" placeholder="手机" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
                    <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                    <input type="text" name="username" id="LAY-user-login-username" lay-verify="username" placeholder="用户名" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-email" for="LAY-user-login-email"></label>
                    <input type="email" name="email" id="LAY-user-login-email" lay-verify="email" placeholder="邮箱" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-row">
                        <div class="layui-col-xs7">
                            <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
                                   for="LAY-user-login-vercode"></label>
                            <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required"
                                   placeholder="图形验证码" class="layui-input">
                        </div>
                        <div class="layui-col-xs5">
                            <div style="margin-left: 10px;">
                                <img src="${pageContext.request.contextPath}/captcha.do" class="layadmin-user-login-codeimg"
                                     id="LAY-user-get-vercode">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <input type="checkbox" name="agreement" id="agreement" lay-skin="primary" title="同意用户协议" checked>
                </div>
                <div class="layui-form-item">
                    <input type="submit" class="layui-btn layui-btn-fluid" value="注 册">
                </div>
            </form>
        </div>
    </div>

</div>
<script src="js/jquery3.4.1.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="static/layui/layui.js"></script>
<%--判断是否显示错误信息--%>
<c:if test="${reg_msg}">
    <script>
        layui.use('layer', function(){
            let layer = layui.layer;
            layer.msg("注册失败",function () {

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
    // 邮箱验证
    $.validator.addMethod("email", function(value, element) {
        let tel = /.com$/;
        return tel.test(value);
    }, "邮箱格式不正确");
    //表单验证
    $("#LAY-user-form").validate({
        rules:{
            phone:{
                phoneNumber:true,
                required:true,
                remote: {
                    url: "${pageContext.request.contextPath}/verifyPhone.do",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        phone: function() {
                            return $("#LAY-user-login-phone").val();
                        }
                    }
                }
            },
            password:{
                password:true,
                required:true,
                rangelength:[8,16]
            },
            repass:{
                equalTo:"#LAY-user-login-password"
            },
            username:{
                required:true,
                rangelength:[2,20],
                remote: {
                    url: "${pageContext.request.contextPath}/verifyUsername.do",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        username: function() {
                            return $("#LAY-user-login-username").val();
                        }
                    }
                }
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
            },
            email:{
                required:true,
                email:true
            }
        },
        messages:{
            phone:{
                required:"请输入手机号码",
                remote: "该手机号已注册，请直接登录"
            },
            password:{
                required:"请输入您的密码",
                rangelength:"密码长度必须在{0}-{1}位之间"
            },
            repass:{
                equalTo:"两次输入的密码不一致"
            },
            username:{
                required:"请输入您的用户名",
                rangelength:"用户名长度必须在{0}-{1}位之间",
                remote:"用户名已存在，请重新输入"
            },
            vercode:{
                required:"请输入验证码",
                remote:"验证码输入有误"
            },
            email:{
                required:"请输入您的邮箱",
            }
        },
        submitHandler: function (form) {
            if($("#agreement").prop("checked")){
                form.submit()
            }else {
                layui.use('layer', function(){
                    let layer = layui.layer;
                    layer.tips('必须同意此协议','.layui-icon-ok',{
                        tips: [1, '#0FA6D8'] //还可配置颜色
                    })
                });
            }
        }
    })
</script>
</body>
</html>