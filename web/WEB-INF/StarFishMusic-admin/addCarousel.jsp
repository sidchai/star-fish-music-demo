<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增轮播图</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" action="${pageContext.request.contextPath}/addCarousel.am" method="post" enctype="multipart/form-data" id="my-addCarousel-form" style="width: 640px;padding-top: 20px">
        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" required lay-verify="required" placeholder="请输入图片标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-inline">
                <input type="text" name="sort" required lay-verify="required" placeholder="请输入图片排序" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label">图片</label>
            <div class="layui-input-inline">
                <button type="button" class="layui-btn" id="btn">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <input type="file" name="uploadPic" id="uploadPic" style="display: none">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin: 30px 0 0 280px">
                <input type="submit" class="layui-btn" value="确定">
                <input type="reset" class="layui-btn layui-btn-primary" value="重置">
            </div>
        </div>
    </form>
</div>
<script src="../../static/layui/layui.js"></script>
<script src="../../js/jquery3.4.1.js"></script>
<script src="../../js/jquery.validate.js"></script>
<script>
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
    $("#my-addCarousel-form").validate({
        rules: {
            title: {
                required: true
            },
            sort: {
                required: false
            }
        },
        messages: {
            title: {
                required: "请输入标题"
            }
        }
    })
</script>
</body>
</html>