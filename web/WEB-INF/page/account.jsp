<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/account.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row page-container">
    <div class="layui-row content-wrapper">
        <div class="user-info-set-view view-without-leftbar">
            <div class="user-info-set-title">管理个人信息</div>
            <div class="user-info-set-main">
                <div class="user-info">
                    <div class="user-avatar">
                        <div class="user-avatar-area">
                            <div class="user-avatar-container">
                                <img src="${USER_INFO.pic}" id="my-user-avatar">
                            </div>
                            <div class="user-avatar-change">
                                <span class="user-avatar-change-icon layui-icon layui-icon-camera" id="span-update"></span>
                            </div>
                            <input type="file" name="uploadPic" id="uploadPic" style="display: none;">
                        </div>
                        <div class="user-avatar-desc">
                            <div>图片最佳尺寸 1200*1200</div>
                            <div>支持Gif、jpg、png等多种格式。</div>
                            <br>
                            <div>*上传反动、色情等照片将导致您</div>
                            <div>的账号被删除。</div>
                        </div>
                    </div>
                </div>
                <div class="user-info-set">
                    <form class="layui-form" action="${pageContext.request.contextPath}/userUpdateUserInfo.do"
                          method="post" id="my-updateUser-form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required lay-verify="required" disabled="disabled"
                                       autocomplete="off" class="layui-input" value="${USER_INFO.username}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required lay-verify="required" autocomplete="off"
                                       class="layui-input" value="${USER_INFO.password}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <c:if test="${USER_INFO != null}">
                                <c:if test="${USER_INFO.sex == '男'}">
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="0" title="男" checked>
                                        <input type="radio" name="sex" value="1" title="女">
                                    </div>
                                </c:if>
                                <c:if test="${USER_INFO.sex == '女'}">
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="0" title="男">
                                        <input type="radio" name="sex" value="1" title="女" checked>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号码</label>
                            <div class="layui-input-block">
                                <input type="text" name="phone" required lay-verify="required" disabled="disabled"
                                       autocomplete="off" class="layui-input" value="${USER_INFO.phone}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="email" name="email" required lay-verify="required" autocomplete="off"
                                       class="layui-input" value="${USER_INFO.email}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">生日</label>
                            <div class="layui-input-block">
                                <input type="text" name="birthday" id="birthday" required lay-verify="required"
                                       autocomplete="off" class="layui-input" value="${USER_INFO.birthday}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">个性签名</label>
                            <div class="layui-input-block">
                                <input type="text" name="signature" required lay-verify="required" autocomplete="off"
                                       class="layui-input" value="${USER_INFO.signature}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地区</label>
                            <div class="layui-input-block" style="width: 200px;">
                                <select name="city" lay-verify="required">
                                    <option value="${USER_INFO.region}">${USER_INFO.region}</option>
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
                            <div class="layui-input-block" style="text-align: center;padding-top: 30px">
                                <input type="submit" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-danger"
                                       value="保存">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../static/layui/layui.js"></script>
<script src="../../js/jquery3.4.1.js"></script>
<script src="../../js/jquery.validate.js"></script>
<script>
    layui.use('form', function () {
        let form = layui.form;
    });
</script>

<script>
    layui.use('laydate', function () {
        let laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#birthday' //指定元素
            , theme: '#1E9FFF'
            , calendar: true
        });
    });
</script>
<%--表单验证--%>
<script>
    //密码验证
    $.validator.addMethod("password", function (value, element) {
        let tel = /[A-z]/;
        let tel2 = /[0-9]/;
        return tel.test(value) && tel2.test(value);
    }, "密码必须包含数字与字母");
    // 邮箱验证
    $.validator.addMethod("email", function (value, element) {
        let tel = /.com$/;
        return tel.test(value);
    }, "邮箱格式不正确");
    //表单验证
    $("#my-updateUser-form").validate({
        rules: {
            password: {
                required: true,
                password: true,
                rangelength: [8, 16]
            },
            sex: {
                required: false
            },
            email: {
                required: false,
                email: true
            },
            birthday: {
                required: false
            },
            signature: {
                required: false
            },
            city: {
                required: false
            }
        },
        messages: {
            password: {
                required: "请输入密码",
                rangelength: "密码长度必须在{0}-{1}位之间"
            }
        }
    })
</script>
<script>
    layui.use('layer', function () {
        let layer = layui.layer;
        let $uploadPic = $("#uploadPic");
        $uploadPic.change(function (e) {
            let fileTypes = ["jpeg", "png", "gif"];
            let type = $uploadPic[0].files[0].type.split("/")[1];
            let isNext = false;
            if (fileTypes && fileTypes.length > 0) {
                let name = e.currentTarget.files[0].name.split(".")[0];
                for (let i = 0; i < fileTypes.length; i++) {
                    if (fileTypes[i] == type) {
                        isNext = true;
                        break;
                    }
                }
                $("#my-singerName").val(name);
            }
            if (!isNext) {
                layer.msg("不支持的文件类型!", function () {

                });
                $uploadPic.val("");
                return false;
            }
        });

        $("#span-update").click(function () {
            $("#uploadPic").click();
        });
        $("#uploadPic").change(function () {
            if ($("#uploadPic").val() == '') {
                return;
            }
            let data = new FormData();
            data.append('uploadPic', $('#uploadPic')[0].files[0]);
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/userUpdateUserInfoAvatar.do",
                /*cache: false,*/
                processData: false,
                contentType: false,
                data: data,
                dataType: 'json',
                success: function (data) {
                    $("#my-user-avatar").attr("src",data.pic);
                    layer.msg("修改成功!");
                }
            })
        });
    });
</script>
</body>
</html>
