let index = 0;
let music = document.getElementById("music");
//播放
$(".play").on("click", function () {
    let duration = music.duration;
    console.log(duration);
    $(".range").attr({'max': duration});
    /*console.log(timeToStr(duration));*/
    $(".audioTime").html(timeToStr(duration));
    $(".play").css("display", "none");
    $(".stop").css("display", "inline");
    /*music.currentTime = time;*/
    music.play();
    function timer() {
        let t = parseInt(Math.round(music.currentTime));
        $(".range").val(t);
        $('.played-time').text(timeToStr(t));
        t = parseInt(music.currentTime);
        if (t < duration) {
            setTimeout(timer, 1000);
        } else {
            clearTimeout(timer);
        }
    }

    timer();
});
//暂停
$('.stop').on('click', function () {
    $(".play").css("display", "inline");
    $(".stop").css("display", "none");
    music.pause();
});
//下一首
$(".nex").click(function () {
    index++;
    music.pause();
    music.src = src[index];
    music.play();
});
//上一首
$(".prv").click(function () {
    index--;
    music.pause();
    music.src = src[index];
    music.play();
});

//监听滑块，可以拖动
$(".range").on('change', function () {
    music.currentTime = this.value;
    /* console.log(this.value)*/
    $(".range").val(this.value);
});

//显示音量
let $btnVolume = $("#btn_volume");
$btnVolume.click(function(){
    if($btnVolume.hasClass('btn-mute')) {
        $btnVolume.removeClass('btn-mute');
        $btnVolume.addClass('btn-volume');
        music.muted=false
    } else if($btnVolume.hasClass('btn-volume')) {
        $btnVolume.removeClass('btn-volume');
        $btnVolume.addClass('btn-mute');
        music.muted=true
    }
});

//控制音量
$(".range2").on('mousedown', function (e) {
    if (e.pageX <= 1644 && e.pageX >= 1544) {
        let percent = (e.pageX - 1544) + '%';
        /*console.log("音量修改为",percent);*/
        $('#curr-vol').css("width", percent);
        let value = (e.pageX - 1544) / 100;
        if(value > 0.01){
            music.volume = value;
            if($btnVolume.hasClass('btn-mute')) {
                $btnVolume.removeClass('btn-mute');
                $btnVolume.addClass('btn-volume');
                music.muted=false;
            }
        }else if(value <=0.01){
            if($btnVolume.hasClass('btn-volume')) {
                $btnVolume.removeClass('btn-volume');
                $btnVolume.addClass('btn-mute');
                music.muted=true
            }
        }
    }
});
$(".range2").on('change', function (e) {
    if (e.pageX <= 1644 && e.pageX >= 1544) {
        let percent = (e.pageX - 1544) + '%';
        console.log("音量修改为",percent);
        $('#curr-vol').css("width", percent);
        let value = (e.pageX - 1544) / 100;
        music.volume = value;
    }
});

$('#play_mode').click(function(){
    let that = $('#play_mode');
    if(that.hasClass('loop'))
    {
        that.removeClass('loop');
        that.addClass('random');
        that.attr("title","随机播放");
    }
    else if(that.hasClass('random'))
    {
        that.removeClass('random');
        that.addClass('single');
        that.attr("title","单曲循环");
    }
    else if(that.hasClass('single'))
    {
        that.removeClass('single');
        that.addClass('loop');
        that.attr("title","列表循环");
    }
});

//转换音频时长分/秒显示
function timeToStr(time) {
    let m = 0,
        s = 0,
        _m = '00',
        _s = '00';
    time = Math.floor(time % 3600);
    m = Math.floor(time / 60);
    s = Math.floor(time % 60);
    _s = s < 10 ? '0' + s : s + '';
    _m = m < 10 ? '0' + m : m + '';
    return _m + ":" + _s;
}
