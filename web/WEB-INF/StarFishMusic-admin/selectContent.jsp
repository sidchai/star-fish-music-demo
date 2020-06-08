<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/addSongListSong.am" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">歌曲名</label>
        <div class="layui-input-block">
            <select name="songId" lay-verify="required">
                <option value=""></option>
                <c:forEach items="${song_info_all}" var="song">
                    <option value="${song.id}">${song.songName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item" style="padding: 300px 20px 0 0;float: right">
        <div class="layui-input-block">
            <input type="submit" class="layui-btn" value="确定">
        </div>
    </div>
</form>
<script src="../../static/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        let form = layui.form;
    });
</script>
</body>
</html>
