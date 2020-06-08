<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>starFish-music</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <link rel="stylesheet" href="css/playDetails.css">
</head>
<body style="background-color: #F0F0F0">
<div class="layui-layout layui-layout-admin">
    <div class="layui-row my-content">
        <div class="my-content-iframe">
            <div class="layui-row layui-bg-gray">
                <div class="layui-col-md8 layui-col-md-offset2">
                    <div class="layui-col-md3 layui-inline my-leftbar-content">
                        <div class="layui-row">
                            <!--专辑图片-->
                            <img src="${play_bar_song.pic}" style="width: 205px;height: 205px;">
                        </div>
                        <div class="layui-row infos">
                            <div class="info-panel">
                                <div class="layui-row info">
                                    <div class="layui-inline info-name">所属专辑</div>
                                    <div class="layui-inline info-value">
                                        <a href="#">${play_bar_song.introduction}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md9 layui-inline my-view-body">
                        <div class="layui-row titleInfo">
                            <div class="titleInfo-name">${play_bar_song.songName}</div>
                            <div class="titleInfo-artist">
                                <div class="singers">
                                    <a href="#">
                                        <div class="singer-item">
                                            <div class="layui-inline singer-avatar">
                                                <a href="${pageContext.request.contextPath}/showArtistSingerInfo.do?sId=${play_bar_singer.id}">
                                                    <img src="${play_bar_singer.pic}" class="singer-avatar">
                                                </a>
                                            </div>
                                            <div class="layui-inline singer-name"><a
                                                    href="${pageContext.request.contextPath}/showArtistSingerInfo.do?sId=${play_bar_singer.id}">${play_bar_singer.singerName}</a>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--<div class="layui-row song-operations">
                            <div class="layui-btn layui-btn-radius layui-btn-danger unselectable">
                                <span class="layui-icon layui-icon-play">
                                    立即播放
                                </span>
                            </div>
                            <div class="layui-btn layui-btn-radius layui-bg-cyan unselectable">
                                <span class="layui-icon layui-icon-star">
                                    收藏
                                </span>
                            </div>
                            <div class="layui-btn layui-btn-radius layui-bg-cyan unselectable">
                                <span class="layui-icon layui-icon-download-circle">
                                    下载
                                </span>
                            </div>
                        </div>-->
                        <div class="layui-row song-lyric" style="opacity: 1;margin-bottom: 30px">
                            <!--歌词部分-->
                            <h1 class="lyric-title">歌词</h1>
                            <div class="lyric-content">
                                <h2>暂无歌词...</h2>
                            </div>
                        </div>
                        <div class="layui-row comment-list-wrapper">
                            <!--评论区-->
                            <div class="block-title">
                                <h2>评论</h2>
                            </div>
                            <div class="add-comment">
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 40px">
                                        <div class="user-avatar">
                                            <a href="javascript:;"><img src="${USER_INFO.pic}" id="my-user-avatar"
                                                                        class="user-avatar"></a>
                                        </div>
                                    </label>
                                    <div class="layui-input-block">
                                        <form action="${pageContext.request.contextPath}/addUserComment.do"
                                              method="post"
                                              id="addFrom">
                                            <textarea name="desc" id="my-comment" placeholder="我来说两句..."
                                                      class="layui-textarea"></textarea>
                                            <div class="control">
                                                <div class="count layui-inline"><span id="number">0</span>/300</div>
                                                <button type="button"
                                                        class="layui-btn layui-btn-radius layui-btn-lg layui-btn-disabled layui-inline"
                                                        id="comment-btn">
                                                    评论
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="comment-list">
                                <div class="subtitle">
                                    评论
                                    <span class="count"></span>
                                </div>
                                <div class="list" id="my-comment-row">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-row my-copyright"
             style="height: 60px;width: 100%;text-align: center;color: #aaa;padding: 40px 0">
            <p>星の鱼音乐 版权所有© since 2020</p>
        </div>
    </div>
</div>
<script src="../static/layui/layui.js"></script>
<script src="js/jquery3.4.1.js"></script>
<script src="js/playBar.js"></script>
<script>
    layui.use('util', function () {
        let util = layui.util;
        //执行
        util.fixbar({
            top: true
            , css: {right: 100, bottom: 100}
            , click: function (type) {
                if (type === 'bar2') {
                    $(document).scrollTop(0);
                }
            }
        });
    });
</script>

<script>
    <c:if test="${empty USER_INFO}">
    /*未登录默认显示的图片*/
    $("#my-user-avatar").attr("src", "img/userPic/admin.jpg");
    </c:if>
    /*控制文本域输入长度*/
    window.onload = function () {
        //获取文本内容和长度函数
        function txtCount(el) {
            let val = el.value;
            let eLen = val.length;
            return eLen;
        }

        let el = document.getElementById('my-comment');
        el.addEventListener('input', function () {
            $("#comment-btn").removeClass("layui-btn-disabled");
            let len = txtCount(this); //   调用函数
            document.getElementById('number').innerHTML = len;
            if (el.value == "") {
                $("#comment-btn").addClass("layui-btn-disabled");
            }
        });

        el.addEventListener('propertychange', function () {//兼容IE
            let len = txtCount(this); //   调用函数
            document.getElementById('number').innerHTML = len;
        });
    }
</script>
<%--控制评论内容--%>
<script>
    commentContent();
    layui.use("layer", function () {
        let layer = layui.layer;

        $("#comment-btn").click(function () {
            <c:if test="${empty USER_INFO}">
            layer.msg("请先登录再评论");
            </c:if>
            <c:if test="${not empty USER_INFO}">
            if ($("#my-comment").val() == "") {
                layer.msg("您输入的内容为空,请先输入再评论!");
            } else {
                let targetUrl = $("#addFrom").attr("action");
                let data = $("#addFrom").serialize();
                let $my = $("#my-comment").val();
                $.ajax({
                    type: 'post',
                    url: targetUrl,
                    cache: false,
                    data: {
                        userId: "${USER_INFO.id}",
                        songId: "${play_bar_song.id}",
                        desc: $my
                    },  //重点必须为一个变量如：data
                    dataType: 'json',
                    success: function (data) {
                        layer.msg("评论成功!!");
                        commentContent();
                        $("#my-comment").val("");
                        document.getElementById('number').innerHTML = 0;
                    }
                });
            }
            </c:if>

        });
    });

    function commentContent() {
        $.ajax({
            url: "${pageContext.request.contextPath}/showCommentInfo.do",
            dataType: "json",
            type: "post",
            async: true,
            data: {
                songId: "${play_bar_song.id}"
            },
            success: function (data) {
                let html = "";
                for (let i = 0; i < data.length; i++) {
                    let ls = data[i];
                    html += "<div class='comment'>" +
                        "<div class='comment-item' style='margin-top: 30px'>" +
                        "<!--评论用户头像-->" +
                        "<a href='javascript:;'>" +
                        "<div class='layui-inline cover'>" +
                        "<img src='" + ls.pic + "'>" +
                        "</div>" +
                        "</a>" +
                        "<div class='layui-inline comment-main'>" +
                        "<div class='user-info'>" +
                        "<span class='user-name'>" +
                        "<a href='javascript:;' style='font-size: 16px'>" + ls.username + "</a>" +
                        "</span>" +
                        "</div>" +
                        "<div class='comment-text' style='width: 600px'>" +
                        "<span>" + ls.content + "</span>" +
                        "<div class='layui-inline' style='left: 540px'>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "<hr>";
                }
                $("#my-comment-row").html(html);
            }
        })
    }
</script>
<%--显示歌词内容--%>
<%--<script>
    $.ajax({
        url:"",
        dataType:"json",
        type:"post",
        async: false,
        data:{

        },
        success:function (data) {

        }
    })
</script>--%>
</body>
</html>