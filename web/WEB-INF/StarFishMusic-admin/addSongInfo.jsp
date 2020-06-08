<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增歌曲</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../css/error.css">
</head>
<body>
<div class="layui-row">
    <form class="layui-form" action="${pageContext.request.contextPath}/addSongInfo.am" method="post" enctype="multipart/form-data" id="my-addSong-form" style="width: 400px;height: 400px;padding-top: 20px">
        <div class="layui-form-item">
            <label class="layui-form-label">歌曲名</label>
            <div class="layui-input-block">
                <input type="text" name="songName" required placeholder="请输入歌曲名"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌手名</label>
            <div class="layui-input-block">
                <input type="text" name="singerName" id="LAY-singerName" required placeholder="请输入歌手名" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专辑名</label>
            <div class="layui-input-block">
                <input type="text" name="introduction" required placeholder="请输入专辑名" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="left: 110px">
                <button type="button" class="layui-btn" id="btn1">
                    <i class="layui-icon">&#xe67c;</i>上传专辑图片
                </button>
                <input type="file" name="uploadPic" id="uploadPic" style="display: none">
            </div>
            <div class="layui-input-inline" style="left: 80px">
                <button type="button" class="layui-btn" id="btn2">
                    <i class="layui-icon">&#xe67c;</i>上传歌曲
                </button>
                <input type="file" name="uploadSong" id="uploadSong" style="display: none">
            </div>
            <div class="layui-input-inline" style="left: 180px;top: 30px">
                <button type="button" class="layui-btn" id="btn3">
                    <i class="layui-icon">&#xe67c;</i>上传歌词
                </button>
                <input type="file" name="uploadLyric" id="uploadLyric" style="display: none">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="float: right;padding-top: 40px">
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
        let $uploadSong = $("#uploadSong");
        $uploadPic.change(function (e) {
            let fileTypes = ["jpeg","png"];
            let type = $uploadPic[0].files[0].type.split("/");
            let fileName = type[type.length-1];
            let isNext = false;
            if(fileTypes && fileTypes.length > 0){
                for (let i = 0; i < fileTypes.length; i++) {
                    if(fileTypes[i] == fileName){
                        isNext = true;
                        break;
                    }
                }
            }
            if(!isNext){
                layer.msg("不支持的文件类型!",function () {

                });
                $uploadPic.val("");
                return false;
            }
        });
        $uploadSong.change(function (e) {
            let fileTypes = ["mp3","ogg","flac"];
            let type = $uploadSong[0].files[0].type.split("/");
            let fileName = type[type.length-1];
            let isNext = false;
            if(fileTypes && fileTypes.length > 0){
                for (let i = 0; i < fileTypes.length; i++) {
                    if(fileTypes[i] == fileName){
                        isNext = true;
                        break;
                    }
                }
            }
            if(!isNext){
                layer.msg("不支持的文件类型!",function () {

                });
                $uploadSong.val("");
                return false;
            }
        });
    });
    $("#btn1").click(function () {
        $("#uploadPic").click();
    });
    $("#btn2").click(function () {
        $("#uploadSong").click();
    });
    $("#btn3").click(function () {
        $("#uploadLyric").click();
    });
</script>
<%--表单验证--%>
<script>
    //表单验证
    $("#my-addSong-form").validate({
        rules: {
            songName: {
                required: true
            },
            singerName: {
                required: true,
                remote: {
                    url: "${pageContext.request.contextPath}/verifySingerName.am",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        singerName: function() {
                            return $("#LAY-singerName").val();
                        }
                    }
                }
            },
            introduction: {
                required: true
            },
            uploadPic: {
                required: true
            },
            uploadSong: {
                required: true
            },
            uploadLyric: {
                required: true
            }
        },
        messages: {
            songName: {
                required: "请输入歌曲名"
            },
            singerName: {
                required: "请输入歌手名",
                remote: "该歌手不存在,请先去添加"
            },
            introduction: {
                required: "请输入专辑名"
            },
            uploadPic: {
                required: "请上传专辑图片"
            },
            uploadSong: {
                required: "请上传歌曲"
            },
            uploadLyric: {
                required: "请上传歌词"
            }
        }
    })
</script>
</body>
</html>