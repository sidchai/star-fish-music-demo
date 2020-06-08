<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改歌手信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" action="${pageContext.request.contextPath}/updateSingerInfo.am" method="post" enctype="multipart/form-data" id="my-updateSinger-form" style="width: 400px;height: 400px;padding-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">歌手名</label>
            <div class="layui-input-block">
                <input type="text" name="singerName" required  lay-verify="required" autocomplete="off" class="layui-input" value="${SINGER_INFO.singerName}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌手类型</label>
            <div class="layui-input-block">
                <input type="text" name="classify" id="LAY-classify" required placeholder="请输入歌手类型(如华语/欧美/日韩...)" lay-verify="required" autocomplete="off" class="layui-input" value="${classify}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌手排名</label>
            <div class="layui-input-block">
                <input type="number" name="rank" required placeholder="请输入歌手排名" lay-verify="required" autocomplete="off" class="layui-input" value="${SINGER_INFO.rank}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出道时间</label>
            <div class="layui-input-block">
                <input type="text" name="debutTime" id="debutTime" required  lay-verify="required" autocomplete="off" class="layui-input" value="${SINGER_INFO.debutTime}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地区</label>
            <div class="layui-input-block">
                <input type="text" name="region" required  lay-verify="required" autocomplete="off" class="layui-input" value="${SINGER_INFO.region}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">歌手介绍</label>
            <div class="layui-input-block">
                <textarea name="introduction" class="layui-textarea">
                    ${SINGER_INFO.introduction}
                </textarea>
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
    //Demo
    layui.use('form', function(){
        let form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
<script>
    layui.use('laydate', function(){
        let laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#debutTime' //指定元素
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
    //表单验证
    $("#my-updateSinger-form").validate({
        rules: {
            singerName: {
                required: true
            },
            debutTime: {
                required: true
            },
            region: {
                required: true
            },
            introduction: {
                required: true
            },
            rank: {
                required: false
            },
            classify: {
                required: true,
                remote: {
                    url: "${pageContext.request.contextPath}/verifyClassify.am",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        classify: function() {
                            return $("#LAY-classify").val();
                        }
                    }
                }
            }
        },
        messages: {
            singerName: {
                required: "请输入歌手名"
            },
            debutTime: {
                required: "请输入歌手出道时间"
            },
            region: {
                required: "请输入歌手所在地"
            },
            introduction: {
                required: "请输入歌手个人简介"
            },
            uploadPic: {
                required: "请选择上传的图片"
            },
            classify: {
                required: "请输入歌手类型",
                remote: "歌手类别不存在,请重新输入"
            }
        }
    })
</script>
</body>
</html>