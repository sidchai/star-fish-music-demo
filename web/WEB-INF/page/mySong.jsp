<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的音乐</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../css/mySong.css">
</head>
<body>
<div class="layui-row">
    <div class="layui-col-md8 layui-col-md-offset1">
        <div class="layui-col-md-3 layui-inline my-leftbar-content">
            <div class="layui-row personal-panel" style="width: 450px;">
                <div class="avatar" style="opacity: 1">
                    <!--用户头像-->
                    <img src="${USER_INFO.pic}">
                </div>
                <div class="name versatile">昵称：${USER_INFO.username}</div>
                <div class="talentDes"></div>
                <div class="signature versatile">
                    <!--用户地区-->
                    地区：${USER_INFO.region}
                </div>
                <div class="description versatile">
                    <!--个性签名-->
                    个人说明：${USER_INFO.signature}
                </div>
            </div>

        </div>
        <div class="layui-col-md9" style="margin:200px 0 0 600px">
            <h1 style="margin-left: 360px">我的收藏</h1>
            <table class="layui-hide" id="my-song-info"></table>
        </div>
    </div>
</div>
<script type="text/html" id="songName">
    <a href="/playBar.do?songId={{d.id}}&singerName={{d.singerName}}" class="layui-table-link" target="my-playBar">{{ d.songName }}</a>
</script>
<script src="../static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        let table = layui.table;
        table.render({
            elem: '#my-song-info'
            ,url:'${pageContext.request.contextPath}/showMySongInfo.do?uId='+${USER_INFO.id}
            ,cols: [[
                {type:'numbers'}
                ,{field:'songName', width:250, title: '歌曲名', templet: '#songName'}
                ,{field:'singerName', width:250, title: '艺人'}
                ,{field:'introduction', width:250, title: '专辑'}
            ]]
            ,width:855
            ,page:{
                layout:['prev', 'page','next','count']
                ,groups: 5
                ,limit:5
            }
            ,skin:'nob'
        });
    });
</script>
<script>
    layui.use('util', function(){
        let util = layui.util;
        //执行
        util.fixbar({
            top:true
            ,click: function(type){
                if(type === 'bar2'){
                    $(document).scrollTop(0);
                }
            }
        });
    });
</script>
</body>
</html>