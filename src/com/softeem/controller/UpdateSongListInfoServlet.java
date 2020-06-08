package com.softeem.controller;

import com.softeem.pojo.SongList;
import com.softeem.server.Impl.SongListServerImpl;
import com.softeem.server.SongListServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.UUID;

@MultipartConfig
@WebServlet("/updateSongListInfo.am")
public class UpdateSongListInfoServlet extends HttpServlet {
    private SongListServer songListServer;

    public UpdateSongListInfoServlet() {
        this.songListServer = new SongListServerImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收用户输入的歌单信息
        String title = req.getParameter("title");//歌单标题
        String introduction = req.getParameter("introduction");//歌单介绍
        String style = req.getParameter("style");//歌单风格

        //上传文件
        //得到文件对象
        Part uploadFilePart = req.getPart("uploadPic");
        //得到上传文件的名称
        //得到保存了文件名的头文件
        String contentDisposition = uploadFilePart.getHeader("Content-Disposition");
        //截取出文件名
        String headerFileName = contentDisposition.split(";")[2];
        String uploadFileName = headerFileName.substring(headerFileName.indexOf("\"") + 1, headerFileName.length() - 1);
        //上传文件
        //生成上传后的文件名（要保证文件名唯一，防止覆盖）
        String saveFIleName = UUID.randomUUID().toString() + UUID.randomUUID().toString() + uploadFileName.substring(uploadFileName.lastIndexOf("."));
        InputStream is = null;
        OutputStream os = null;
        try {
            //得到文件上传的输入流
            is = uploadFilePart.getInputStream();
            //创建输入流保存上传的文件
            os = new FileOutputStream("E:/IDEA-workspace/StarFishMusic/web/img/songListPic/" + saveFIleName);
            //定义缓存区
            byte[] buf = new byte[10240];
            //定义实际读取到的字节数量
            int len = 0;
            //完成上传
            while ((len = is.read(buf)) > 0) {
                os.write(buf, 0, len);
            }
            //上传成功保存上传的信息
            SongList songList = (SongList) req.getSession().getAttribute("SONG_LIST_INFO");
            //删除原图片
            String[] ss = songList.getPic().split("/");
            String fileName = ss[ss.length - 1];
            File file = new File("E:/IDEA-workspace/StarFishMusic/web/img/songListPic/" + fileName);
            file.delete();
            songList.setTitle(title);
            songList.setIntroduction(introduction);
            songList.setStyle(style);
            songList.setPic("songListPic/" + saveFIleName);
            //插入数据库
            songListServer.updateSongListInfo(songList);
            //跳回主页
            resp.sendRedirect(req.getContextPath() + "/toSongListInfo.am");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                is.close();
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
