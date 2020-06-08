<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增歌单</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" action="${pageContext.request.contextPath}/addSongListInfo.am" method="post" enctype="multipart/form-data" id="my-addSongList-form" style="width: 400px;height: 400px;padding-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" required placeholder="请输入歌单标题" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-block">
                <textarea name="introduction" placeholder="请输入歌单简介" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">风格</label>
            <div class="layui-input-block">
                <input type="text" name="style" required placeholder="请输入歌单风格" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-inline" style="left: 110px">
                <button type="button" class="layui-btn" id="btn">
                    <i class="layui-icon">&#xe67c;</i>上传图片
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
    //表单验证
    $("#my-addSongList-form").validate({
        rules: {
            title: {
                required: true
            },
            introduction: {
                required: true
            },
            style: {
                required: true
            }
        },
        messages: {
            title: {
                required: "请输入歌单标题"
            },
            introduction: {
                required: "请输入歌单介绍"
            },
            style: {
                required: "请输入歌单风格"
            }
        }
    })
</script>
</body>
</html>