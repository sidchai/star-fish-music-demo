<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/playBar.css">
</head>
<body>
<div class="layui-row btn-audio" style="background-color: #5FB878;">
    <div class="layui-col-md8 layui-col-md-offset3">
        <div class="layui-inline" style="padding-right: 20px">
            <a href="javascript:;" title="上一首" class="prv"><img src="img/playBar/prv.png"></a>
            <a href="javascript:;" title="播放/暂停" class="play"><img src="img/playBar/play.png"></a>
            <a href="javascript:;" title="播放/暂停" class="dis_none stop"><img src="img/playBar/stop.png"></a>
            <a href="javascript:;" title="下一首" class="nex"><img src="img/playBar/nex.png"></a>
        </div>
        <div style="display: inline">
            <a href="javascript:;" id="singerPicClick" target="my-iframe-content">
                <img src="${play_bar_song.pic}" class="singerPic" id="singerPic">
            </a>
        </div>
        <div class="layui-inline">
            <div style="padding: 10px 0 0 10px">
                <a href="#" title="${play_bar_song.songName}" style="color: #c2c2c2">${play_bar_song.songName}</a>
                <span style="padding-left: 20px">
                    <span title="${play_bar_song.singerName}">
                        <a href="#" style="color: #9b9b9b">${play_bar_song.singerName}</a>
                    </span>
                </span>
                <div class="layui-inline" style="float: right">
                        <a href="javascript:;" id="collect" title="收藏" target="my-playBar" class="btn-collect"></a>
                        <a href="javascript:;" id="download" title="下载" class="btn-download"></a>
                </div>
            </div>
            <div class=" layui-inline" style="width: 490px;height: 9px;padding: 10px 0 10px 10px">
                <input type="range" min=0 max=100 class='range' value=0>
            </div>
            <span style="padding-left: 5px">
                <span class="played-time">00:00</span>
                <span>/</span>
                <span class="audioTime">00:00</span>
            </span>
        </div>
        <div class="layui-inline my-bottom-right">
            <a href="javascript:;" title="随机" class="btn-repeat random" id="play_mode"></a>
            <a href="javascript:;" title="播放列表" class="btn-repeat list"></a>
            <a href="javascript:;" class="icn btn-volume" id="btn_volume"></a>
            <div class="layui-inline">
                <input type="range" min=0 max=100 class='range2' value=30 id="range2">
            </div>
        </div>
    </div>
    <div>
        <audio src="${play_bar_song.songUrl}" id="music" loop></audio>
    </div>
</div>
<script src="static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script src="js/playBar.js"></script>
<script>
    $().ready(function () {
        <c:if test="${play_bar_song != null}">
        $("#singerPicClick").click(function () {
            this.href = "${pageContext.request.contextPath}/playDetails.jsp";
        });
        layui.use('layer',function () {
            let layer = layui.layer;
            let $ = layui.$;
            $("#download").on("click",function () {
                if(${USER_INFO != null}){
                    location.href = "${pageContext.request.contextPath}/downloadSong.do?url="+"${play_bar_song.songUrl}"+"&name="+"${play_bar_song.songName}";
                }else {
                    layer.msg("您还未登录,请登录再下载!!",function () {
                    })
                }
            });

            $("#collect").on("click",function () {
                if(${USER_INFO != null}){
                    $.post("${pageContext.request.contextPath}/verifySong.do",{songId:"${play_bar_song.id}"},function (data) {
                        if($.trim(data) == 'true'){
                            layer.msg("该歌曲已收藏!");
                        }else {
                            let param = {
                                uId:"${USER_INFO.id}",
                                sId:"${play_bar_song.id}"
                            };
                            $.post("${pageContext.request.contextPath}/collectSong.do",param,function (result) {
                                layer.msg("收藏成功!!!")
                            });
                        }
                    });
                }else {
                    layer.msg("您还未登录,请登录再收藏!!",function () {
                    })
                }
            })
        });
        </c:if>
    });

    <c:if test="${empty play_bar_song}">
    $("#singerPic").attr("src","img/tubiao.jpg");
    </c:if>
</script>
<script>
    music.addEventListener('ended', function () {
        $(".play").css("display", "inline");
        $(".stop").css("display", "none");
    }, false);
</script>
</body>
</html>