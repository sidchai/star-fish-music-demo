<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加用户信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" id="my-addUser-form" action="${pageContext.request.contextPath}/addUserInfo.am" method="post" enctype="multipart/form-data" style="width: 400px;height: 604px;padding-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="LAY-user-login-username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="0" title="男">
                <input type="radio" name="sex" value="1" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" id="LAY-user-login-phone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="text" name="birthday" id="birthday" required  lay-verify="required" placeholder="请输入生日" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个性签名</label>
            <div class="layui-input-block">
                <textarea name="signature" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-block">
                <select name="city" lay-verify="required">
                    <option value=""></option>
                    <option value="安徽">安徽</option>
                    <option value="上海">上海</option>
                    <option value="澳门">澳门</option>
                    <option value="北京">北京</option>
                    <option value="重庆">重庆</option>
                    <option value="福建">福建</option>
                    <option value="甘肃">甘肃</option>
                    <option value="广东">广东</option>
                    <option value="广西">广西</option>
                    <option value="贵州">贵州</option>
                    <option value="海南">海南</option>
                    <option value="河北">河北</option>
                    <option value="河南">河南</option>
                    <option value="黑龙江">黑龙江</option>
                    <option value="湖北">湖北</option>
                    <option value="湖南">湖南</option>
                    <option value="吉林">吉林</option>
                    <option value="江苏">江苏</option>
                    <option value="江西">江西</option>
                    <option value="辽宁">辽宁</option>
                    <option value="内蒙古">内蒙古</option>
                    <option value="宁夏">宁夏</option>
                    <option value="青海">青海</option>
                    <option value="山东">山东</option>
                    <option value="山西">山西</option>
                    <option value="陕西">陕西</option>
                    <option value="上海">上海</option>
                    <option value="四川">四川</option>
                    <option value="台湾">台湾</option>
                    <option value="天津">天津</option>
                    <option value="西藏">西藏</option>
                    <option value="香港">香港</option>
                    <option value="新疆">新疆</option>
                    <option value="云南">云南</option>
                    <option value="浙江">浙江</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户权限</label>
            <div class="layui-input-block">
                <input type="number" name="isAdmin" id="is-admin" required  lay-verify="required" placeholder="0为普通用户,1为管理员" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="left: 50px">
                <button type="button" class="layui-btn" id="btn">
                    <i class="layui-icon">&#xe67c;</i>上传头像
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
    $("#my-addUser-form").validate({
        rules: {
            username: {
                required: true,
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
            username: {
                required: "请输入用户名",
                rangelength:"用户名长度必须在{0}-{1}位之间",
                remote: "用户名已存在,请重新输入"
            },
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