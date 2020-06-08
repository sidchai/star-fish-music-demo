<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改轮播图信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" action="${pageContext.request.contextPath}/updateCarousel.am" method="post" id="my-updateCarousel-form" style="width: 640px;padding-top: 20px">
        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" required lay-verify="required" autocomplete="off" class="layui-input" value="${CAROUSEL_INFO.title}">
            </div>
        </div>
        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-inline">
                <input type="text" name="sort" required lay-verify="required" autocomplete="off" class="layui-input" value="${CAROUSEL_INFO.sort}">
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
    $("#my-updateCarousel-form").validate({
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