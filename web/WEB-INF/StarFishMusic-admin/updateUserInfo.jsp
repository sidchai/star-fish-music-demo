<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改用户信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" id="my-updateUser-form" action="${pageContext.request.contextPath}/updateUserInfo.am" method="post" enctype="multipart/form-data" style="width: 400px;height: 400px;padding-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required  lay-verify="required" disabled="disabled" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.username}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" required  lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.password}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <c:if test="${UPDATE_USER_INFO.sex == '男'}">
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="0" title="男" checked>
                    <input type="radio" name="sex" value="1" title="女">
                </div>
            </c:if>
            <c:if test="${UPDATE_USER_INFO.sex == '女'}">
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="0" title="男">
                    <input type="radio" name="sex" value="1" title="女" checked>
                </div>
            </c:if>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required id="LAY-user-login-phone" disabled="disabled" lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.phone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" required  lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.email}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="text" name="birthday" id="birthday" required  lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.birthday}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">个性签名</label>
            <div class="layui-input-block">
                <input type="text" name="signature" required  lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.signature}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-block">
                <input type="text" name="region" required  lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.region}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户权限</label>
            <div class="layui-input-block">
                <input type="number" name="isAdmin" id="is-admin" required  lay-verify="required" autocomplete="off" class="layui-input" value="${UPDATE_USER_INFO.isAdmin}">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="left: 50px">
                <button type="button" class="layui-btn" id="btn">
                    <i class="layui-icon">&#xe67c;</i>修改头像
                </button>
                <input type="file" name="uploadPic" id="uploadPic" style="display: none">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-top: 60px">
                <input class="layui-btn" type="submit" value="确定">
                <input type="reset" class="layui-btn layui-btn-primary" value="重置">
            </div>
        </div>
    </form>
</div>
<script src="../../static/layui/layui.js"></script>
<script src="../../js/jquery3.4.1.js"></script>
<script src="../../js/jquery.validate.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        let form = layui.form;
    });
</script>
<script>
    layui.use('laydate', function(){
        let laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#birthday' //指定元素
            ,theme: '#1E9FFF'
            ,calendar: true
        });
    });
</script>
<script>
    layui.use('layer', function() {
        let layer = layui.layer;
        let $uploadPic = $("#uploadPic");
        $uploadPic.change(function (e) {
            let fileTypes = ["jpeg","png"];
            let type = $uploadPic[0].files[0].type.split("/")[1];
            let isNext = false;
            if(fileTypes && fileTypes.length > 0){
                let name = e.currentTarget.files[0].name.split(".")[0];
                for (let i = 0; i < fileTypes.length; i++) {
                    if(fileTypes[i] == type){
                        isNext = true;
                        break;
                    }
                }
                $("#my-singerName").val(name);
            }
            if(!isNext){
                layer.msg("不支持的文件类型!",function () {

                });
                $uploadPic.val("");
                return false;
            }
        });
    });
    $("#btn").click(function () {
        $("#uploadPic").click();
    })
</script>

<%--表单验证--%>
<script>
    // 手机号码验证
    $.validator.addMethod("phoneNumber", function(value, element) {
        let tel = /^1[3456789][0-9]{9}$/;
        return tel.test(value);
    }, "请正确填写您的手机号码");
    //密码验证
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
    $("#my-updateUser-form").validate({
        rules: {
            password: {
                required: true,
                password:true,
                rangelength:[8,16]
            },
            isAdmin: {
                required: true,
                maxlength: 1
            },
            sex:{
                required: false
            },
            phone:{
                required: false,
                phoneNumber:true,
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
            email:{
                required: false,
                email: true
            },
            birthday:{
                required: false
            },
            signature:{
                required: false
            },
            city:{
                required: false
            }
        },
        messages: {
            password: {
                required: "请输入密码",
                rangelength: "密码长度必须在{0}-{1}位之间"
            },
            isAdmin: {
                required: "请输入用户权限",
                maxlength: "用户权限长度不能超过1"
            },
            phone:{
                remote: "该手机号已注册，请直接登录"
            }
        }
    })
</script>
</body>
</html>