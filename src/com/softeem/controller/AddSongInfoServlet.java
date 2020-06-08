package com.softeem.controller;

import com.softeem.pojo.Song;
import com.softeem.server.Impl.SingerServerImpl;
import com.softeem.server.Impl.SongServerImpl;
import com.softeem.server.SingerServer;
import com.softeem.server.SongServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.UUID;

@MultipartConfig
@WebServlet("/addSongInfo.am")
public class AddSongInfoServlet extends HttpServlet {
    private SingerServer singerServer;
    private SongServer songServer;

    public AddSongInfoServlet() {
        this.singerServer = new SingerServerImpl();
        this.songServer = new SongServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收歌曲信息
        String songName = req.getParameter("songName");//歌曲名
        String singerName = req.getParameter("singerName");//歌手名
        String introduction = req.getParameter("introduction");//专辑名

        //上传文件
        //得到文件对象
        Part uploadPicPart = req.getPart("uploadPic");//专辑图片
        Part uploadSongPart = req.getPart("uploadSong");//歌曲文件
        Part uploadLyricPart = req.getPart("uploadLyric");//歌词文件
        //2.得到上传文件的名称
        //得到保存了文件名的头文件
        String contentPic = uploadPicPart.getHeader("Content-Disposition");
        String contentSong = uploadSongPart.getHeader("Content-Disposition");
        String contentLyric = uploadLyricPart.getHeader("Content-Disposition");
        //截取出文件名
        //专辑图片
        String headerFileNamePic = contentPic.split(";")[2];
        String uploadFileNamePic = headerFileNamePic.substring(headerFileNamePic.indexOf("\"") + 1, headerFileNamePic.length() - 1);
        //歌曲文件
        String headerFileNameSong = contentSong.split(";")[2];
        String uploadFileNameSong = headerFileNameSong.substring(headerFileNameSong.indexOf("\"") + 1, headerFileNameSong.length() - 1);
        //歌词文件
        String headerFileNameLyric = contentLyric.split(";")[2];
        String uploadFileNameLyric = headerFileNameLyric.substring(headerFileNameLyric.indexOf("\"") + 1, headerFileNameLyric.length() - 1);
        //上传文件
        //生成上传后的文件名（要保证文件名唯一，防止覆盖）
        String saveFIleNamePic = UUID.randomUUID().toString() + UUID.randomUUID().toString() + uploadFileNamePic.substring(uploadFileNamePic.lastIndexOf("."));
        InputStream is = null;
        InputStream is2 = null;
        InputStream is3 = null;
        OutputStream os = null;
        OutputStream os2 = null;
        OutputStream os3 = null;
        try {
            //得到文件上传的输入流
            is = uploadPicPart.getInputStream();
            is2 = uploadSongPart.getInputStream();
            is3 = uploadLyricPart.getInputStream();
            //创建输入流保存上传的文件
            os = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/img/introductionPic/" + saveFIleNamePic);
            os2 = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/media/song/" + uploadFileNameSong);
            os3 = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/media/lyric/" + uploadFileNameLyric);
            //定义缓存区
            byte[] buf = new byte[10240];
            //定义实际读取到的字节数量
            int len = 0;
            //完成上传
            while ((len = is.read(buf)) > 0) {
                os.write(buf, 0, len);
            }
            while ((len = is2.read(buf)) > 0) {
                os2.write(buf, 0, len);
            }
            while ((len = is3.read(buf)) > 0) {
                os3.write(buf, 0, len);
            }
            //上传成功保存上传的信息
            Song song = new Song();
            song.setSongName(songName);
            song.setIntroduction(introduction);
            song.setCreateTime(new Date());
            song.setSongUrl("song/" + uploadFileNameSong);
            song.setPic("introductionPic/" + saveFIleNamePic);
            song.setLyric("lyric/" + uploadFileNameLyric);
            song.setSingerName(singerName);
            song.setCount(0);
            //根据歌手名查询到id
            int singerId = singerServer.getIdBySingerName(singerName);
            song.setSingerId(singerId);
            //将数据插入到数据库
            songServer.addSongInfo(song);
            resp.getWriter().println(true);
            //跳回主页
            resp.sendRedirect(req.getContextPath() + "/toSongInfo.am");
        } catch (Exception e) {
            resp.getWriter().println("<h2>歌曲添加失败</h2>");
        } finally {
            if (is3 != null) {
                is3.close();
            }
            if (is2 != null) {
                is2.close();
            }
            if (is != null) {
                is.close();
            }
            if (os3 != null) {
                os3.close();
            }
            if (os2 != null) {
                os2.close();
            }
            if (os != null) {
                os.close();
            }
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
